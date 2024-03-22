/** 'companyList.jsp' 에서 기업 번호 클릭 시 'companyView.jsp'로 값 보내기  */
document.querySelectorAll("tbody a").forEach(aEle => {
	aEle.addEventListener('click', function(e){
		e.preventDefault();
		
		let companyNo = this.getAttribute("href");

		location.href = '/companyView?companyNo=' + companyNo;
		
	})
})






