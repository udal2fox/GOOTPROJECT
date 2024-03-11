// ----- css 파일 추가
// 1. 파일 경로 설정
//const CSS_FILE_PATH = '/resources/css/company/login.css';
// 2. link 태그 생성
//let linkEle = document.createElement('link');
//linkEle.rel = 'stylesheet';
//linkEle.type = 'text/css';
//linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
//document.head.appendChild(linkEle);
const f = document.forms[0];
const LOGIN_FAIL_MSG = '아이디 또는 비밀번호가 일치하지 않습니다';

document.getElementById("loginBtn").addEventListener("click", () => {
 
    if (!f.eId.value) {
        alert("아이디를 입력해주세요");
        f.eId.focus();
        return false;
    }
    if (!f.ePw.value) {
        alert("비밀 번호를 입력해주세요");
        f.ePw.focus();
        return false;
    }

    fetch("/login", {
		method : 'POST',
		body : JSON.stringify({
			eId : f.eId.value,
			ePw : f.ePw.value,
		}),
		headers : {
			"Content-type": "application/json; charset=UTF-8",
		}
	})
	.then((Response) => {
      if (Response.status == "400") {
    	  alert(LOGIN_FAIL_MSG);
    	  f.eId.focus();
      }else {
          Response.json().then((result) => {
          sessionStorage.setItem("Okja", result.eno);
          sessionStorage.setItem("deptNo", result.deptNo);
          
          location.href = "/searchEmployee?" + sessionStorage.getItem("Okja");
	})
  }
})	
	.catch( err => {
		// 에러 처리
		console.log('Fetch error:', err);
		// 에러 메시지 출력
		console.log('Error message:', err.message);
	});
});
