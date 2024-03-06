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
		window.history.go(-1); // 뒤로 한 페이지 이동
	} 