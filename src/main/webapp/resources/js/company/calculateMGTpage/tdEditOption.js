	// 가격 계산부분
	// 금액차감	
	let recDedName = document.getElementById("recDedName");
	let recDed = document.getElementById("recDed");
	let recDedSup = document.getElementById("recDedSup");
	let recDedTax = document.getElementById("recDedTax");
	let recDedCst = document.getElementById("recDedCst");
	let recDedCstSup = document.getElementById("recDedCstSup");
	let recDedCstTax = document.getElementById("recDedCstTax");
	// 추가정산
	let recAddName = document.getElementById("recAddName");
	let recAdd = document.getElementById("recAdd");
	let recAddSup = document.getElementById("recAddSup");
	let recAddTax = document.getElementById("recAddTax");
	let recAddCst = document.getElementById("recAddCst");
	let recAddCstSup = document.getElementById("recAddCstSup");
	let recAddCstTax = document.getElementById("recAddCstTax");
	
	let worker = document.getElementById("worker");
	
	console.log(worker.value);
	
	// 정수체크
	function checkNan(element) 
	{
	    if (isNaN(element.value))
	    {
	        alert("정수만 입력해주세요");
	        element.value = 0;
	    }
	}
	
	function calculateRecDed() 
	{
		checkNan(recDedSup);
		checkNan(recDedTax);
		checkNan(recDedCstSup);
		checkNan(recDedCstTax);
	
	    let taxValue = parseFloat(recDedTax.value);
	    let supValue = parseInt(recDedSup.value);
	    let cstTaxValue = parseFloat(recDedCstTax.value);
	    let cstSupValue = parseInt(recDedCstSup.value);
	
	    if (isNaN(taxValue)) {
	        taxValue = 0;
	    }
	    if (isNaN(supValue)) {
	        supValue = 0;
	    }
	    if (isNaN(cstTaxValue)) {
	        cstTaxValue = 0;
	    }
	    if (isNaN(cstSupValue)) {
	        cstSupValue = 0;
	    }
	    let result = supValue + taxValue;
	    let cstResult = cstTaxValue + cstSupValue;
	
	    recDed.value = result.toFixed(0);
	    recDedCst.value = cstResult.toFixed(0);
	}
	
	recDedSup.addEventListener('change', calculateRecDed);
	recDedTax.addEventListener('change', calculateRecDed);
	recDedCstSup.addEventListener('change', calculateRecDed);
	recDedCstTax.addEventListener('change', calculateRecDed);
	
	function calculateRecAdd() 
	{
		checkNan(recAddSup);
		checkNan(recAddTax);
		checkNan(recAddCstSup);
		checkNan(recAddCstTax);
		
		let taxValue = parseFloat(recAddTax.value);
		let supValue = parseInt(recAddSup.value);
		let cstTaxValue = parseFloat(recAddCstTax.value);
		let cstSupValue = parseInt(recAddCstSup.value);
		
		if (isNaN(taxValue)) {
			taxValue = 0;
		}
		if (isNaN(supValue)) {
			supValue = 0;
		}
		if (isNaN(cstTaxValue)) {
			cstTaxValue = 0;
		}
		if (isNaN(cstSupValue)) {
			cstSupValue = 0;
		}
		
		let result = supValue + taxValue;
		let cstResult = cstTaxValue + cstSupValue;
		
		recAdd.value = result.toFixed(0);
		recAddCst.value = cstResult.toFixed(0);
	}
	
	recAddSup.addEventListener('change', calculateRecAdd);
	recAddTax.addEventListener('change', calculateRecAdd);
	recAddCstSup.addEventListener('change', calculateRecAdd);
	recAddCstTax.addEventListener('change', calculateRecAdd);
	
	
	//랜덤한 문자 + 숫자 생성
	function randomCode(length) 
	{
		  const charset = 'ABCDEFGHIJKLMNOPRSTUVWXYZ0123456789';
		  let randomString = '';
		  for (let i = 0; i < length; i++) 
		  {
		    const randomIndex = Math.floor(Math.random() * charset.length);
		    randomString += charset[randomIndex];
		  }
		  return randomString;
	}
	//document.querySelector('.randomPrdNo').value = randomCode(8);
	
	// 버튼 눌러서 테이블에 넣어주기
	function inputDedCal() 
	{
		if(recDedName.value == null || recDedName.value == '' )
		{
			alert("품목명을 입력해주세요,");
			recDedName.focus();
			return false;
		}
		if(recDedSup.value == 0 || recDedSup.value == '' && recDedCstSup.value == '' || recDedCstSup.value == 0)
		{
			alert("금액을 입력해주세요");
			return false;
		}
		
		let tbody = document.querySelector('.Detail');
		
		let msg = '';
		
		msg += '<tr>'+
			   '<td>금액차감</td>'+
			   '<td>금액차감</td>'+
			   '<td class="findDedcode">'+randomCode(8)+'</td>'+
			   '<td>'+recDedName.value	+'</td>'+
			   '<td>'+recDed.value+'</td>'+
			   '<td>'+recDedCst.value+'</td>'+
			   '<td>'+((recDed.value - recDedCst.value)/ recDedCst.value).toFixed(2)+'</td>'+
			   '<td>'+worker.value+'</td>'+
			   '</tr>';
		
		tbody.innerHTML += msg;
		
		recDedName.disabled = true;
	    recDed.disabled = true;
	    recDedSup.disabled = true;
	    recDedTax.disabled = true;
	    recDedCst.disabled = true;
	    recDedCstSup.disabled = true;
	    recDedCstTax.disabled = true;
		document.querySelector('.dedbtn').disabled = true;	
		
		dedCode = document.querySelector('.findDedcode').textContent;
	}
	
	
	
	// 버튼 눌러서 테이블에 넣어주기
	function inputAddCal() 
	{
		if(recAddName.value == null || recAddName.value == '' )
		{
			alert("품목명을 입력해주세요,");
			recAddName.focus();
		}
		if(recAddSup.value == 0 || recAddSup.value == '' && recAddCstSup.value == '' || recAddCstSup.value == 0)
		{
			alert("금액을 입력해주세요");
		}
		
		let tbody = document.querySelector('.Detail');
		
		let msg = '';
		msg += '<tr>'+
		'<td>추가정산</td>'+
		'<td>추가정산</td>'+
		'<td class="findAddcode">'+randomCode(8)+'</td>'+
		'<td>'+recAddName.value	+'</td>'+
		'<td>'+recAdd.value+'</td>'+
		'<td>'+recAddCst.value+'</td>'+
		'<td>'+((recAdd.value - recAddCst.value)/ recAddCst.value).toFixed(2)+'</td>'+
		'<td>'+worker.value+'</td>'+
		'</tr>';
		
		tbody.innerHTML += msg;
		
		recAddName.disabled = true;
	    recAdd.disabled = true;
	    recAddSup.disabled = true;
	    recAddTax.disabled = true;
	    recAddCst.disabled = true;
	    recAddCstSup.disabled = true;
	    recAddCstTax.disabled = true;
	    
	    document.querySelector('.addbtn').disabled = true;	
		
	    addCode = document.querySelector('.findAddcode').textContent;
	}
	
	
	function reload()
	{
		if(confirm("정보를 초기화 하시겠습니까?"))
		{
			location.reload();
		}
		else return false;
	}
	
	let addCode;
	let dedCode;
	
	
	function EditTradeDetail() {
		
		if(deptNo != 0 && deptNo != 2)
		{
			alert("불허된 접근입니다.")
			return;
		}

		console.log("추가정산 코드:", addCode);
		console.log("금액차감 코드:", dedCode);
		
		if (confirm("거래명세서를 편집하시겠습니까?")) {
	        let data = {
	        		
	            recDedName: document.getElementById("recDedName").value,
	            recDed: document.getElementById("recDed").value,
	            recDedSup: document.getElementById("recDedSup").value,
	            recDedTax: document.getElementById("recDedTax").value,
	            recDedCst: document.getElementById("recDedCst").value,
	            recDedCstSup: document.getElementById("recDedCstSup").value,
	            recDedCstTax: document.getElementById("recDedCstTax").value,
	            recDedWorker: document.getElementById("worker").value,
	            recAddName: document.getElementById("recAddName").value,
	            recAdd: document.getElementById("recAdd").value,
	            recAddSup: document.getElementById("recAddSup").value,
	            recAddTax: document.getElementById("recAddTax").value,
	            recAddCst: document.getElementById("recAddCst").value,
	            recAddCstSup: document.getElementById("recAddCstSup").value,
	            recAddCstTax: document.getElementById("recAddCstTax").value,
	            recAddWorker: document.getElementById("worker").value,
	            recNo: document.getElementById("recNo").value,
	            recDedPrdCode : addCode,
	            recAddPrdCode : dedCode
	            
	        };

	        // 여기서 'data' 객체를 사용하여 패치 또는 Ajax 요청을 보낼 수 있습니다.
	        fetch('TdEdit.do', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify(data)
	        })
	        .then(response => response.text())
	        .then(text => {
	        	console.log('Success:', text);
				if(text == 'Success'){
					alert("편집 성공");
					location.reload();
				}
				else alert("편집 실패");
	        })
	        .catch((error) => {
	            console.error('Error:', error);
	            // 오류가 발생한 경우 여기에 처리할 내용을 추가할 수 있습니다.
	        });
	    }
	}
	
	// 이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
	function backPage() 
	{
		window.history.go(-1); // 뒤로 한 페이지 이동
	} 

	
	
	
	
	