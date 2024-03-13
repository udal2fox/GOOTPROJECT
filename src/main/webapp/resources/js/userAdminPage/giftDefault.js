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
      msg += '<input class="form-check-input" type="radio" name="product" value="' + product.prdNo + '" id="' + product.prdNo + '">';
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
                                 