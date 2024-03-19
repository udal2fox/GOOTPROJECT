// 지점 선물 편집 버튼
const customBtn = document.querySelector("#customGiftBtn");
customGiftBtn.addEventListener("click", () => {
  location.href = "/userAdminPage/giftCustom";
});

// 기본 선물 편집 버튼
const defaultGiftBtn = document.querySelector("#defaultGiftBtn");
defaultGiftBtn.addEventListener("click", () => {
  location.href = "/userAdminPage/giftDefault";
});

// 지점 커스텀 선물 정보 가져오기
fetch("/userAdminPage/getCustomGift/" + sessionStorage.getItem("Okja"))
  .then((response) => {
    return response.json(); // JSON 데이터를 반환하는 Promise를 반환
  })
  .then((data) => {
    showCustomGift(data); // 반환된 JSON 데이터를 처리
  })
  .catch((error) => {
    console.error("서버에 요청을 보내는 중 오류가 발생했습니다:", error);
    swal("오류가 발생하여 선물 리스트를 가져오기 못했습니다.", {
      icon: "error",
    });
  });

function showCustomGift(data) {
  let msg = "";
  let customList = document.querySelector("#customList");

  if (data === "") {
    msg += '<li class="my-2 bg-secondary-subtle p-2 rounded-2">';
    msg += "<span>지정 상품이 없습니다.</span>";
    msg += "</li>";
  } else {
    data.forEach((customGift) => {
      msg += '<li class="my-2 bg-secondary-subtle p-2 rounded-2">';
      msg +=
        '<img src="' +
        customGift.prdImg +
        '" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp';
      msg += "<span>" + customGift.prdName + "</span>";
      msg += "</li>";
    });
  }
  customList.innerHTML = msg;
}

// 지점 기본 선물 정보 가져오기
fetch("/userAdminPage/getDefaultGift/" + sessionStorage.getItem("Okja"))
  .then((Response) => {
    return Response.json();
  })
  .then((data) => {
    showDefaultGift(data);
  })
  .catch((error) => {
    console.errer("서버에 요청을 보내는 중 오류가 발생했습니다:", error);
    swal("오류가 발생하여 선물 정보를 가져오지 못했습니다.", {
      icon: "error",
    });
  });

function showDefaultGift(data) {
  let msg = "";
  let DefaultInfo = document.querySelector("#defaultInfo");

  if (data === "") {
    msg += '<li class="my-2 bg-secondary-subtle p-2 rounded-2">';
    msg += "<span>지정 상품이 없습니다.</span>";
    msg += "</li>";
  } else {
    msg += '<li class="my-2 bg-secondary-subtle p-2 rounded-2">';
    msg +=
      '<img src="' + data.prdImg +
      '" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp';
    msg += "<span>" + data.prdName + "</span>";
    msg += "</li>";
  }
  DefaultInfo.innerHTML = msg;
}
