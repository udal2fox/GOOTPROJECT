// 페이지가 로드될 때 실행되는 함수
window.onload = () => {
  // 선물 목록을 서버에서 가져오는 fetch 요청
  fetch("/userAdminPage/getGiftList")
    .then((response) => response.json()) // 응답을 JSON 형식으로 변환
    .then((list) => {
      showGiftList(list);
    }) // JSON 데이터를 처리하는 함수 호출
    .catch((err) => console.log(err)); // 오류 발생 시 콘솔에 로그 출력

  // 페이지 버튼 기능 설정
  document.getElementById("total").addEventListener("click", function () {
    fetch("/userAdminPage/getGiftList")
      .then((response) => response.json()) // 응답을 JSON 형식으로 변환
      .then((list) => {
        showGiftList(list);
      }) // JSON 데이터를 처리하는 함수 호출
      .catch((err) => console.log(err)); // 오류 발생 시 콘솔에 로그 출력
  });
  document.getElementById("10000").addEventListener("click", function () {
    filterGiftsByPrice(10000);
  });
  document.getElementById("30000").addEventListener("click", function () {
    filterGiftsByPrice(30000);
  });
  document.getElementById("50000").addEventListener("click", function () {
    filterGiftsByPrice(50000);
  });
  document.getElementById("80000").addEventListener("click", function () {
    filterGiftsByPrice(80000);
  });
  document.getElementById("100000").addEventListener("click", function () {
    filterGiftsByPrice(100000);
  });

  // 닫기 버튼에 클릭 이벤트 추가
  document.querySelector("#cancleButton").addEventListener("click",()=>{
    location.href = "/userAdminPage/goManagegift";
  })
  // 초기화 버튼에 클릭 이벤트 추가
  document
    .getElementById("resetButton")
    .addEventListener("click", resetCheckboxes);

  // 이벤트 위임을 사용하여 체크박스 변경 이벤트를 캐치
  document
    .getElementById("productList")
    .addEventListener("change", function (event) {
      if (event.target.classList.contains("form-check-input")) {
        countCheckboxes();
      }
    });
};

// 선물 목록을 화면에 표시하는 함수
function showGiftList(data) {
  let productList = document.querySelector("#productList"); // HTML 요소 찾기
  let msg = ""; // 출력할 HTML 문자열 초기화
  data.forEach((product) => {
    // 각 선물에 대한 HTML 요소 생성
    msg += '<div class="col p-1">';
    msg += '<div class="form-check">';
    msg += '<input class="form-check-input" type="checkbox" data-code="' + product.prdNo + '" id="' + product.prdNo + '">';
    msg += '<label class="form-check-label" for="' + product.prdNo + '">';
    msg += '<div class="card" style="width: 150px;">';
    msg += '<img src="' + product.prdImg + '" class="card-img-top object-fit-fill border rounded" alt="product" width="150px" height="150px">';
    msg += '<div class="card-body">';
    msg += '<span class="card-text" style="font-size: 0.7rem;">' + product.prdName + "</span><br>";
    msg += '<span class="card-text" style="font-size: 0.7rem;">금액 : ' + product.prdSal.toLocaleString() + "원</span>";
    msg += "</div></div></label></div></div>";
  });
  productList.innerHTML = msg; // HTML 문자열을 HTML 요소에 할당하여 화면에 출력
}

// 특정 가격 이하의 선물만 표시하는 함수
function filterGiftsByPrice(price) {
  // 선물 목록을 서버에서 가져오는 fetch 요청
  fetch("/userAdminPage/getGiftList")
    .then((response) => response.json()) // 응답을 JSON 형식으로 변환
    .then((list) => {
      // 가격에 따라 필터링된 선물 목록 생성
      let filteredList = list.filter(
        (product) => product.prdSal <= price && product.prdSal > price - 20000
      );
      showGiftList(filteredList); // 필터링된 선물 목록을 화면에 표시
    })
    .catch((err) => console.log(err)); // 오류 발생 시 콘솔에 로그 출력
}

// 체크박스 초기화 함수
function resetCheckboxes() {
  // 모든 체크박스 요소를 가져옴
  let checkboxes = document.querySelectorAll('input[type="checkbox"]');
  // 각 체크박스의 상태를 해제
  checkboxes.forEach((checkbox) => {
    checkbox.checked = false;
    countCheckboxes();
  });
}

// 체크박스 체크된 숫자 카운팅 함수
function countCheckboxes() {
  let count = document.querySelectorAll(
    'input[type="checkbox"]:checked'
  ).length;
  document.querySelector("#selectGift").setAttribute("value", count);
}

// 체크박스 체크된 상품 DB저장
document.querySelector("#saveButton").addEventListener("click", () => {
  let checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');

  if (checkboxes.length === 0) {
    swal("선택된 상품이 없습니다.");
    return;
  }

  // 선택된 상품의 상품코드를 담을 배열
  let saveProduct = [];

  // 선택된 상품의 상품코드를 배열에 저장
  checkboxes.forEach((checkbox) => {
    let prdNo = checkbox.dataset.code; 
    saveProduct.push(prdNo);
  });

  fetch("/userAdminPage/customGift/" + sessionStorage.getItem("Okja"), {
    method: "post",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(saveProduct), // 선택된 상품코드 배열을 전송
  })
    .then((Response) => Response.text())
    .then((text) => {
      if (text === "success") {
        swal("선택된 선물이 저장되었습니다.", {
          icon: "success",
        }).then(() => {
          location.href =
            "/userAdminPage/goManagegift";
        });
      } else {
        swal("선물 저장에 실패했습니다. 다시 시도해주세요.", {
          icon: "error",
        });
      }
    })
    .catch((error) => {
      console.error("서버에 요청을 보내는 중 오류가 발생했습니다:", error);
      swal("오류가 발생하여 선물 저장에 실패했습니다.", { icon: "error" });
    });
});

