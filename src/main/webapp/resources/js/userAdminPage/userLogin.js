const f = document.querySelector(".login-form");
const btn = document.querySelector("#login_btn");

const regMail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const regPw = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

btn.addEventListener('click', () => {

    if (!f.uEmail.value || !regMail.test(f.uEmail.value)) {
        alert("올바른 형식의 이메일이 아닙니다.");
        f.uEmail.focus();
        return false;
    }
    if (!f.uPw.value || !regPw.test(f.uPw.value)) {
        alert("정확한 비밀번호를 입력하세요. (8자리 이상, 영문, 숫자, 특수문자 포함)")
        f.uPw.focus();
        return false;
    }

    fetch('/userAdminPage/login', {
        method: 'post',
        body: JSON.stringify({
            uEmail: f.uEmail.value,
            uPw: f.uPw.value
        }),
        headers: {"Content-type": "application/json; charset=utf-8"}
    })
        .then((Response) => Response.text())
        .then((result) => {
            if (result === 'fail') {
                alert('아이디와 비밀번호가 다릅니다.\n 로그인 관련 문의는 고객센터로 문의주세요. \n TEL) 1588-0000');
                f.uEmail.value = '';
                f.uPw.value = '';
            } else {
                location.href = '/userAdminPage/dashboard'
            }
        })
        .catch((err) => console.log(err));
});
