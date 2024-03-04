

	let cri = document.querySelector('.prdCri');
	let sal = document.querySelector('.prdSal');
	let cost = document.querySelectorAll('.cost');
	let magin = document.querySelector('.magin');
	let critax = document.querySelector('.critax')
	let saltax = document.querySelector('.saltax')
	
	cost.forEach(function(e) {
	  e.addEventListener('change', function() {
		  magin.value = (((sal.value) - (cri.value)) / (sal.value)) * 100;
		  critax.value = (cri.value * 0.1);
		  saltax.value = (sal.value * 0.1);
		  
	  });
	});
	// 파싱해서 갑수정
	
	 //magin.value = ((parseFloat(sal.value) - parseFloat(cri.value)) / parseFloat(sal.value)) * 100;
	
	

	// 라디오버튼 이벤트 과세시 세율 활성 비활성화 기능
	document.querySelectorAll('[type=radio]').forEach(function(radio){
		radio.addEventListener('change', function() {
			if(radio.value == 'O')
			{
				console.log("과세")
				document.querySelectorAll(".tax").forEach((e) =>{
					e.disabled = false;
				})
			}
			else
			{
				console.log("비과세")
				document.querySelectorAll(".tax").forEach((e) =>{
					e.disabled = true;
				})
			}
		})
    });
	
	
	
	