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