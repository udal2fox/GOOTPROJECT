/*
// ----- css 파일 추가
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/company/login.css';
// 2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.type = 'text/css';
linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
document.head.appendChild(linkEle);
*/
const f = document.forms[0];
const LOGIN_FAIL_MSG = '아이디 또는 비밀번호가 일치하지 않습니다';

//로그인 함수 정의
function login() {
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
        method: 'POST',
        body: JSON.stringify({
            eId: f.eId.value,
            ePw: f.ePw.value,
        }),
        headers: {
            "Content-type": "application/json; charset=UTF-8",
        }
    })
    .then((Response) => {
        if (Response.status == "400") {
            alert(LOGIN_FAIL_MSG);
            f.eId.focus();
        } else {
            Response.json().then((result) => {
                sessionStorage.setItem("Okja", result.eno);
                sessionStorage.setItem("deptNo", result.deptNo);
                sessionStorage.setItem("eName", result.eName);
                sessionStorage.setItem("profilePicture", result.profilePicture);
                
                location.href = "/moveSalesChart?" + sessionStorage.getItem("Okja");
            })
        }
    })  
    .catch(err => {
        // 에러 처리
        console.log('Fetch error:', err);
        // 에러 메시지 출력
        console.log('Error message:', err.message);
    });
}

// 로그인 버튼 클릭 시 로그인 함수 호출
document.getElementById("loginBtn").addEventListener("click", login);

// 비밀번호 입력란에서 엔터 키 눌렀을 때 로그인 함수 호출
f.ePw.addEventListener("keypress", function(event) {
    if (event.key === 'Enter') {
        login();
    }
});