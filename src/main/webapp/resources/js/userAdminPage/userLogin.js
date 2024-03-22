// 3일을 밀리초로 변환
const THREE_DAYS_IN_MS = 3 * 24 * 60 * 60 * 1000;

// 문서가 로드되었을 때 실행될 함수 등록
document.addEventListener("DOMContentLoaded", () => {
    // 저장된 데이터 가져오기
    const rememberedEmail = localStorage.getItem("rememberedEmail");
    const rememberChecked = localStorage.getItem("rememberChecked");
    const savedTime = localStorage.getItem("savedTime");

    // 저장된 시간이 있는 경우에만 처리
    if (savedTime) {
        // 현재 시간과 저장된 시간의 차이 계산
        const currentTime = new Date().getTime();
        const elapsedTime = currentTime - parseInt(savedTime);

        // 경과 시간이 3일 이상인 경우 데이터 삭제
        if (elapsedTime >= THREE_DAYS_IN_MS) {
            localStorage.removeItem("rememberedEmail");
            localStorage.removeItem("rememberChecked");
            localStorage.removeItem("savedTime");
        }
    }

    // 이메일 주소 기억하기 여부 확인 및 입력 필드에 자동으로 입력
    if (rememberedEmail && rememberChecked === "true") {
        document.getElementById("floatingInput").value = rememberedEmail;
        document.getElementById("flexCheckDefault").checked = true;
    }
});

// 로그인 버튼 클릭 시 실행될 함수 등록
document.getElementById("login_btn").addEventListener("click", () => {
    // 로그인 폼 요소 가져오기
    const form = document.querySelector(".login-form");

    // 이메일 주소와 기억하기 여부 가져오기
    const userEmail = form.querySelector("input[name=userEmail]").value.trim();
    const rememberChecked = document.getElementById("flexCheckDefault").checked;

    // 이메일 주소와 기억하기 여부 저장
    if (rememberChecked) {
        localStorage.setItem("rememberedEmail", userEmail);
        localStorage.setItem("rememberChecked", true);
        localStorage.setItem("savedTime", new Date().getTime());
    } else {
        localStorage.removeItem("rememberedEmail");
        localStorage.setItem("rememberChecked", false);
        localStorage.removeItem("savedTime");
    }
});

// 로그인 버튼 요소 가져오기
const loginBtn = document.querySelector("#login_btn");
// 로그인 폼 요소 가져오기
const form = document.querySelector(".login-form");

// 이메일과 비밀번호의 유효성 검사를 위한 정규식 패턴
const emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

// 로그인 버튼 클릭 시 실행될 함수 등록
loginBtn.addEventListener("click", () => {
    // 이메일과 비밀번호 입력값 가져오기
    const userEmail = form.userEmail.value.trim();
    const userPw = form.userPw.value.trim();

    // 이메일 형식 검사
    if (!userEmail || !emailRegex.test(userEmail)) {
        swal("올바른 이메일 형식이 아닙니다.", "", "error");
        form.userEmail.focus();
        return false;
    }
  
    // 비밀번호 형식 검사
    if (!userPw || !passwordRegex.test(userPw)) {
        swal(
            "정확한 비밀번호를 입력하세요.",
            "8자리 이상의 대소문자, 숫자, 특수문자를 포함해야 합니다.",
            "error"
        );
        form.userPw.focus();
        return false;
    }

    // 서버로 로그인 요청 보내기
    fetch("/userAdminPage/adminLogin", {
        method: "POST",
        body: JSON.stringify({
            userEmail,
            userPw,
        }),
        headers: { "Content-Type": "application/json; charset=utf-8" },
    })
    .then((response) => {
        if (response.status === 400) {
            swal("아이디와 비밀번호가 다릅니다.", "", "error");
            form.reset();
        } else {
            response.json().then((result) => {
                // 성공 시 세션 스토리지에 사용자 정보 저장
                sessionStorage.setItem("Okja", result.spotNo);
                swal("로그인 완료!", "반갑습니다. 담당자님", "success");
                setTimeout(() => {
                    // 대시보드 페이지로 이동
                    location.href = "/userAdminPage/goDashboard/" + sessionStorage.getItem("Okja");
                }, 1500);
            });
        }
    })
    .catch((err) => console.log(err));
});

