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
		  const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
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
		}
		if(recDedSup.value == '' && recDedCstSup.value == '')
		{
			alert("금액을 입력해주세요");
		}
		
		let tbody = document.querySelector('.Detail');
		
		let msg = '';
		
		msg += '<tr>'+
			   '<td>금액차감</td>'+
			   '<td>금액차감</td>'+
			   '<td>'+randomCode(8)+'</td>'+
			   '<td>'+recDed.value+'</td>'+
			   '<td>'+recDedCst.value+'</td>'+
			   '<td>'+((recDed.value - recDedCst.value)/ recDedCst.value) * 100 +'</td>'+
			   '<td>'+worker.value+'</td>';
		
		
			
		
	}
	
	
	
	
	