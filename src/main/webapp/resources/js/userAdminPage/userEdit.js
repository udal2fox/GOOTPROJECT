const form = document.querySelector(".userEditForm");
const submitBtn = document.querySelector("#submitBtn");

const emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
const phoneRegex = /[0-9]{9,10}$/;

submitBtn.addEventListener("click", () => {
  let isFormValid = validateForm(form);
  if (isFormValid) {
    submitUpdateInfo(form);
  }
});

function validateForm(form) {
  if (!form.userEmail.value) {
    form.userEmail.value = document
      .querySelector("#userEmail")
      .getAttribute("placeholder");
  }
  if (!emailRegex.test(form.userEmail.value)) {
    swal("올바른 이메일 형식이 아닙니다.", "", "error");
    form.userEmail.focus();
    return false;
  }

  if (!form.userContact.value) {
    form.userContact.value = document
      .querySelector("#userContact")
      .getAttribute("placeholder");
  }
  if (!phoneRegex.test(form.userContact.value)) {
    swal(
      "핸드폰 번호를 입력하세요.",
      " '-' 등 특수문자를 제외하고 숫자만 입력해주세요.",
      "error"
    );
    return false;
  }

  if (form.userPw.value !== form.userPwCheck.value) {
    swal("비밀번호를 동일하게 입력하세요.", "", "error");
    return false;
  }

  if (!passwordRegex.test(form.userPw.value)) {
    swal(
      "정확한 비밀번호를 입력하세요.",
      "8자 이상의 대소문자, 숫자, 특수문자를 포함해야 합니다.",
      "error"
    );
    form.userPw.focus();
    return false;
  }

  return true;
}

function submitUpdateInfo(form) {
  const userId = sessionStorage.getItem("Okja");
  const path = '/userAdminPage/updateUserInfo/' + userId;
 
  fetch(path, {
    method: 'POST',
    body: JSON.stringify({
      userEmail: form.userEmail.value,
      userContact: form.userContact.value,
      userPw: form.userPw.value,
    }),
    headers: { "Content-Type": "application/json; charset=utf-8" },
  })
  .then((response) => {
    if (response.status === 400) {
      swal("정보 수정 실패", "입력값을 수정해주세요.", "error");
      form.reset(); // 폼 초기화
    } else {
      swal("수정 완료!", "", "success");
      setTimeout(() => {
        location.href = "/userAdminPage/userEdit/" + userId;
      }, 1500);
    }
  });
}
