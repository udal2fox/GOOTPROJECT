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

let datePickAll = document.querySelectorAll('input[type="date"]');
datePickAll.forEach(function(input) {
    flatpickr(input, {
        locale: 'ko'
    });
});


document.getElementById("moveSpotRegisterBtn").addEventListener('click', ()=>{
	
	
	location.href = '/spotRegister';
})


/** 'spotList.jsp' 에서 기업 번호, 지점 번호 클릭 시 각각 'companyView.jsp', 
 * 'spotView.jsp'로 값 보내기  */
document.querySelectorAll(".companyLink").forEach(link => {
    link.addEventListener("click", function(e) {
        e.preventDefault();
        const companyNo = this.dataset.companyNo;
        location.href = "/companyView?companyNo=" + companyNo;
    });
});

document.querySelectorAll(".spotLink").forEach(link => {
    link.addEventListener("click", function(e) {
        e.preventDefault();
        const spotNo = this.dataset.spotNo;
        location.href = "/spotView?spotNo=" + spotNo;
    });
});

