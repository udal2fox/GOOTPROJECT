const form = document.querySelector(".login-form");
const loginBtn = document.querySelector("#login_btn");

const emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

loginBtn.addEventListener("click", () => {
  const userEmail = form.userEmail.value.trim();
  const userPw = form.userPw.value.trim();

  if (!userEmail || !emailRegex.test(userEmail)) {
    swal("올바른 이메일 형식이 아닙니다.", "", "error");
    form.userEmail.focus();
    return false;
  }
  
  if (!userPw || !passwordRegex.test(userPw)) {
    swal(
      "정확한 비밀번호를 입력하세요.",
      "8자리 이상의 대소문자, 숫자, 특수문자를 포함해야 합니다.",
      "error"
    );
    form.userPw.focus();
    return false;
  }

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
        sessionStorage.setItem("Okja", result.spotNo);
        swal("로그인 완료!", "반갑습니다. 담당자님", "success");
        setTimeout(() => {
          location.href = "/userAdminPage/goDashboard/" + sessionStorage.getItem("Okja");
        }, 1500);
      });
    }
  })
  .catch((err) => console.log(err));
});
