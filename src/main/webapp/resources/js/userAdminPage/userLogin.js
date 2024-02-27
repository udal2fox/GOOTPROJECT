const f = document.querySelector(".login-form");
const btn = document.querySelector("#login_btn");

const regMail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const regPw = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

btn.addEventListener('click', () => {

    if (!f.userId.value || !regMail.test(f.userId.value)) {
        alert("올바른 형식의 이메일이 아닙니다.");
        f.userId.focus();
        return false;
    }
    if (!f.userPw.value || !regPw.test(f.userPw.value)) {
        alert("정확한 비밀번호를 입력하세요. (8자리 이상, 영문, 숫자, 특수문자 포함)")
        f.userPw.focus();
        return false;
    }
    fetch('/userAdminPage/login',{
        method : 'post',
        body: JSON.stringify({
            userId : f.userId.value,
            userPw : f.userPw.value
        }),
        headers:{
    'content-type':'application/json; charset=utf-8'
}})
.then(Response => Response.json())
    .then(json => {
        if(json.userInfo == null){
            alert("가입되지 않은 로그인 정보입니다. 아이디와 비밀번호를 확인하세요")
        }else {
            location.href = "/userAdminPage/dashboard"
            sessionStorage.setItem('userinfo',json.userInfo)
        }
    }).catch(err => {
        console.log(err)
    });
});