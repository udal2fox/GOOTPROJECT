/** 'salesList.jsp' 에서 상담번호 클릭 시 'salesView.jsp'로 값 보내기  */
document.querySelectorAll("tbody a").forEach(aEle => {
	aEle.addEventListener('click', function(e){
		e.preventDefault();
		
		let consultNo = this.getAttribute("href");
		
		console.log(consultNo);
		location.href = '/salesView?consultNo=' + consultNo;
		
	})
})


let datePickAll = document.querySelectorAll('input[type="date"]');
datePickAll.forEach(function(input) {
    flatpickr(input, {
        locale: 'ko'
    });
});

