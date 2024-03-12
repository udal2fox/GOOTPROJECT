/**
 * 
 */
	let recDedName = document.getElementById("recDedName");
	let recDed = document.getElementById("recDed");
	let recDedSup = document.getElementById("recDedSup");
	let recDedTax = document.getElementById("recDedTax");
	let recDedCst = document.getElementById("recDedCst");
	let recDedCstSup = document.getElementById("recDedCstSup");
	let recDedCstTax = document.getElementById("recDedCstTax");
	let worker = document.getElementById("worker");
	
	
	function calculateRecDed() {
		
		
		
		if(isNaN(recDedSup.value))
		{
			alert("정수만 입력해주세요");
			recDedSup.value = 0;
		}	
		if(isNaN(recDedTax.value))
		{
			alert("정수만 입력해주세요");
			recDedTax.value = 0;
		}	
		
		let taxValue = parseFloat(recDedTax.value);
	    if (isNaN(taxValue)) {
	        taxValue = 0;
	    }

	    let supValue = parseInt(recDedSup.value);
	    if (isNaN(supValue)) {
	        supValue = 0;
	    }

	    let result = supValue + taxValue;
	    recDed.value = result.toFixed(0);
	}

	recDedSup.addEventListener('change', calculateRecDed);
	recDedTax.addEventListener('change', calculateRecDed);
	
	
	
	
	
	
	
	