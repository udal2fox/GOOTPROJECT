const CSS_FILE_PATH = ['/resources/css/company/custMgmtPage/spotMgmt.css','/resources/css/company/custMgmtPage/spotMgmtModal.css' ];
cssBinding(CSS_FILE_PATH);
function cssBinding(cssFiles) {
	cssFiles.forEach(css => {
		
		//2. link 태그 생성
		let linkEle = document.createElement('link');
		linkEle.rel = 'stylesheet';
		linkEle.type = 'text/css';
		linkEle.href = css;
		
		
		//3.  head 태그에 link 엘리먼트 추가 (여기서 head 태그에 동적으로 바인딩 된다)
		document.head.appendChild(linkEle);
	})
}



document.getElementById("moveSpotRegisterBtn").addEventListener('click', ()=>{
	
	
	location.href = '/spotRegister';
})




/** 'spotList.jsp' 에서 기업 번호, 지점 번호 클릭 시 'salesView.jsp'로 값 보내기  */
document.querySelectorAll("tbody a").forEach(aEle => {
	aEle.addEventListener('click', function(e){
		e.preventDefault();
		
		let companyNo = this.getAttribute("href");
		let spotNo = this.getAttribute("href");
		
		console.log("기업 번호 " + companyNo);
		console.log("지점 번호 " +spotNo);


		
		//location.href = '/salesView?consultNo=' + consultNo;
		
	})
})