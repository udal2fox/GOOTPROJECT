const okja = sessionStorage.getItem("Okja");

// 각 버튼 변수 설정
const dashboard = document.querySelectorAll("#dashboard");
const manage_member = document.querySelectorAll("#manage_member");
const usageHistory_list = document.querySelectorAll("#usageHistory_list");
const inquiryBoard = document.querySelectorAll("#inquiryBoard");
const logout = document.querySelectorAll("#logout");
const manage_gift = document.querySelectorAll("#manage_gift");
const manage_card = document.querySelectorAll("#manage_card");
const manage_recipients = document.querySelectorAll("#manage_recipients");

// 각 버튼에 이벤트 리스너 추가
dashboard.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    location.href = "/userAdminPage/goDashboard/" + okja;
  });
});

manage_member.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    location.href = "/userAdminPage/goManagemember";
  });
});

usageHistory_list.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    location.href = "/userAdminPage/goUsagehistorylist/" + okja;
  });
});

inquiryBoard.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    location.href = "/userAdminPage/goInquiryboard/" + okja;
  });
});

logout.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    sessionStorage.removeItem("Okja");
    swal("로그아웃 완료!");
    setTimeout(() => {
      location.href = "/userAdminPage/goLogout";
    }, 1500);
  });
});

manage_gift.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    location.href = "/userAdminPage/goManagegift/" + okja;
  });
});

manage_card.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    location.href = "/userAdminPage/goManagecard/" + okja;
  });
});

manage_recipients.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    location.href = "/userAdminPage/goManagerecipients/" + okja;
  });
});