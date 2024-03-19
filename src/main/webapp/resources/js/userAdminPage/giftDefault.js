// 페이지가 로드될 때 실행되는 함수
window.onload = () => {
  // 선물 목록을 가져오는 fetch 요청
  fetch("/userAdminPage/getGiftList")
    .then((response) => response.json()) // 응답을 JSON 형식으로 변환
    .then((list) => showGiftList(list)) // JSON 데이터를 처리하는 함수 호출
    .catch((err) => console.log(err)); // 오류 처리
};

// 선물 목록을 화면에 표시하는 함수
function showGiftList(data) {
  let productList = document.querySelector("#productList"); // HTML 요소 찾기
  let msg = ""; // 출력할 HTML 문자열 초기화
  data.forEach((product) => {
    // 각 선물에 대한 HTML 요소 생성
    msg += '<div class="col p-1">';
    msg += '<div class="form-check">';
    msg += '<input class="form-check-input" type="radio" data-code="' + product.prdNo + '" id="' + product.prdNo + '" name="product">';
    msg += '<label class="form-check-label" for="' + product.prdNo + '">';
    msg += '<div class="card" style="width:160px;">';
    msg += '<img src="' + product.prdImg + '" class="card-img-top object-fit-fill border rounded" alt="product" width="150px" height="150px">';
    msg += '<div class="card-body">';
    msg += '<div style="height:85px;"><span class="card-text" style="font-size: 0.7rem;">' + extractProductName(product.prdName) + "</span></div>";
    msg += '<div><span class="card-text" style="font-size: 0.7rem;">▶ 금액 : ' + product.prdSal.toLocaleString() + "원</span></div>";
    msg += "</div></div></label></div></div>";
  });
  productList.innerHTML = msg; // HTML 문자열을 HTML 요소에 할당하여 화면에 출력
}

// product.prdName 값에서 []와 () 안에 있는 텍스트를 제외하고 반환하는 함수
function extractProductName(productName) {
  // 정규 표현식을 사용하여 []와 () 안에 있는 텍스트를 제거
  return productName.replace(/[\[\(].*?[\]\)]/g, '').trim();
}

// 취소버튼 경로 지정
document.querySelector("#cancleButton").addEventListener("click",()=>{
  location.href = "/userAdminPage/goManagegift";
})
// 체크박스 체크된 상품 DB저장
document.querySelector("#saveButton").addEventListener("click", () => {
  let checkbox = document.querySelector('input[type="radio"]:checked');

  if (checkbox.length === 0) {
    swal("선택된 상품이 없습니다.");
    return;
  }

  // 선택된 상품의 상품코드 가져오기
  let prdNo = checkbox.dataset.code;

  fetch("/userAdminPage/defaultGift", {
    method: "post",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      spotNo: sessionStorage.getItem("Okja"),
      spDefaultGift: prdNo,
    }), 
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
