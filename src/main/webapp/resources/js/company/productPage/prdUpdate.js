/**
 * 
 */
	let cri = document.querySelector('.prdCri');
	let sal = document.querySelector('.prdSal');
	let cost = document.querySelectorAll('.cost');
	let magin = document.querySelector('.magin');
	let critax = document.querySelector('.critax');
	let saltax = document.querySelector('.saltax');
	let criSub = document.querySelector('.criSub');
	let salSub = document.querySelector('.salSub');

	
		cost.forEach(function(e) {
		  e.addEventListener('change', function() {
		    let criValue = parseFloat(cri.value);
		    let salValue = parseFloat(sal.value);
		
		    if (isNaN(criValue) || isNaN(salValue) || criValue < 0 || salValue < 0) {
		      magin.value = 0;
		      critax.value = 0;
		      saltax.value = 0;
		      criSub.value = 0;
		      salSub.value = 0;
		    } else {
		      if (salValue <= 0) {
		        magin.value = 0;
		        critax.value = 0;
		        saltax.value = 0;
		        criSub.value = 0;
		        salSub.value = 0;
		      } else {
		        magin.value = (((salValue - criValue) / salValue)).toFixed(2);
		        
		        // 과세 여부에 따라 세액을 계산하거나 0으로 설정
		        if (document.querySelector('#exampleRadios1').checked) {
		          critax.value = Math.floor(criValue * 0.1);
		          saltax.value = Math.floor(salValue * 0.1);
		        } else {
		          critax.value = 0;
		          saltax.value = 0;
		        }
		        
		        criSub.value = (criValue + parseFloat(critax.value))
		        salSub.value = (salValue - parseFloat(saltax.value))
		      }
		    }
		  });
		});


	// 라디오버튼 이벤트 과세시 세율 활성 비과세시 비활성화 기능
	document.querySelectorAll('[name="prdTaxExSt"]').forEach(function(radio) {
	  radio.addEventListener('change', function() {
	    if (radio.value === 'O') {
	      console.log("과세");
	      document.querySelectorAll(".tax").forEach(function(e) {
	        e.disabled = false;
	        // 체인지 이벤트를 직접 부여
	       cost.forEach(function(e) {
	            let event = new Event('change');
	            e.dispatchEvent(event);
	          });
	      });
	    } else {
	      console.log("비과세");
	      document.querySelectorAll(".tax").forEach(function(e) {
	        e.disabled = true;
	        e.value = 0; // 비과세일 때 세액 필드를 0으로 설정
	        // 체인지 이벤트를 직접 부여
		       cost.forEach(function(e) {
		            let event = new Event('change');
		            e.dispatchEvent(event);
		          });
	      });
	    }
	  });
	});

	// 수정창 비과세시 disalble 안걸리는상태값 받을떄
	(function taxDisable() {
		if(document.querySelector('taxX').checked='checked')
		{
			document.querySelectorAll(".tax").forEach(function(e) {
		        e.disabled = true;
		        e.value = 0;
			});
		}
	})();	


	function prdUpdate(f)
	{
		if(deptNo != 0 && deptNo != 4)
		{
			alert("불허된 접근입니다.")
			return;
		}
		if(f.prdSdc.value == '' || f.prdName.value == '')
		{
			alert("필수정보를 입력해주세요...");
			return false;
		
		}
		if(confirm("상품을  수정하시겠습니까?"))
		{
			f.action = 'prdUpdate.do';
			f.submit();
		}
		else return false;	
		
	}
	function prdDelte(f)
	{
		if(deptNo != 0 && deptNo != 4)
		{
			alert("불허된 접근입니다.")
			return;
		}
		if(confirm("상품을  삭제하시겠습니까?"))
		{
			f.action = 'prdDelete.do';
			f.submit();
		}
		else return false;	
	}
	
	// 이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
	function backPage() 
	{
		window.location = document.referrer;
	} 
	
	 // 모달 열기 함수
    function openModal() {
        var modal = document.getElementById("searchModal");
        modal.style.display = "block";
        var codeInput = document.getElementById("keyword").value = document.querySelector('.searchCode').value;
    }

    // 모달 닫기 함수
    function closeModal() {
        var modal = document.getElementById("searchModal");
        modal.style.display = "none";
    }

    // 모달 바깥 영역 클릭 시 닫기
    window.onclick = function(event) {
        var modal = document.getElementById("searchModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
	
    
 // 검색 버튼을 눌렀을 때 실행되는 함수
    function checkCode() {
        var codeInput = document.getElementById("keyword");
        var code = codeInput.value; // 입력한 코드 가져오기

        // fetch API를 사용하여 서버에 요청을 보내어 코드의 가용 여부 확인
        fetch('/checkCode?code=' + code)
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(function(data) {
                // 서버로부터의 응답에 따라 동적으로 결과 처리
                if (data === "able") {
                    // 사용 가능한 코드일 때
                    alert("사용 가능한 코드입니다.");
                    codeInput.value = code;
                    document.querySelector('.searchCode').value = code;
                    closeModal();
                } else {
                    // 이미 사용 중인 코드일 때
                    alert("사용할수 없는 코드입니다.");
                    codeInput.value = "";
                }
            })
            .catch(function(error) {
                console.error('There was a problem with the fetch operation:', error);
            });
    }