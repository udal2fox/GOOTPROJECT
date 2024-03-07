const f = document.querySelector(".login-form");
const btn = document.querySelector("#login_btn");

const regMail =
  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const regPw =
  /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

btn.addEventListener("click", () => {
  if (!f.userEmail.value || !regMail.test(f.userEmail.value)) {
    alert("올바른 형식의 이메일이 아닙니다.");
    f.userEmail.focus();
    return false;
  }
  if (!f.userPw.value || !regPw.test(f.userPw.value)) {
    alert(
      "정확한 비밀번호를 입력하세요. (8자리 이상, 영문, 숫자, 특수문자 포함)"
    );
    f.userPw.focus();
    return false;
  }

  fetch("/userAdminPage/adminLogin", {
    method: "post",
    body: JSON.stringify({
      userEmail: f.userEmail.value,
      userPw: f.userPw.value,
    }),
    headers: { "Content-type": "application/json; charset=utf-8" },
  })
    .then((Response) => {
      if (Response.status == "400") {
        alert("아이디와 비밀번호가 다릅니다.");
        f.reset();
      } else {
        Response.json().then((result) => {
          sessionStorage.setItem("Okja",result.spotNo);
          alert("로그인 되었습니다.");
          location.href = '/userAdminPage/dashboard/'+ result.spotNo;
        });
      }
    })
    .catch((err) => console.log(err));
});
