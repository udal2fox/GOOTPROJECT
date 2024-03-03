
/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기  */







/** 'salesList.jsp' 에서 상담번호 클릭 시 'salesView.jsp'로 값 보내기  */
document.querySelectorAll("tbody a").forEach(aEle => {
	aEle.addEventListener('click', function(e){
		e.preventDefault();
		
		let consultNo = this.getAttribute("href");
		
		console.log(consultNo);

		//controller에서 @RequestMapping("/board/*") //전체적인 경로 설정 
		
		location.href = '/getSalesView?consultNo=' + consultNo;
		
	})
})
