// 전역 변수로 list 선언
let list;

// 페이지가 로드될 때 실행되는 함수
window.onload = () => {
  // 선물 목록을 가져오는 fetch 요청
  fetch("/userAdminPage/getGiftList")
    .then((response) => response.json()) // 응답을 JSON 형식으로 변환
    .then((data) => {
      // 전역 변수 list에 할당
      list = data;
      // start_scope와 end_scope 값을 가져옴
      var startScopeValue = parseInt(document.getElementById('start_scope').value);
      var endScopeValue = parseInt(document.getElementById('end_scope').value);
      // start_scope 이상 end_scope 이하의 상품만 필터링하여 출력
      var filteredList = list.filter(product => product.prdSal >= startScopeValue && product.prdSal <= endScopeValue);
      showGiftList(filteredList);
    })
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
document.querySelector("#cancleButton").addEventListener("click", () => {
  location.href = "/userAdminPage/goManagegift";
});

// 체크박스 체크된 상품 DB저장
document.querySelector("#saveButton").addEventListener("click", () => {
  let checkbox = document.querySelector('input[type="radio"]:checked');

  if (!checkbox) {
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
          location.href = "/userAdminPage/goManagegift";
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

// start_scope 값이 변경될 때 end_scope의 옵션을 조절하는 함수
document.getElementById('start_scope').addEventListener('change', function() {
    var startScopeValue = parseInt(this.value); // start_scope의 값을 정수로 변환
    var endScopeSelect = document.getElementById('end_scope');

    // end_scope의 옵션을 start_scope보다 큰 값만 남기도록 설정
    Array.from(endScopeSelect.options).forEach(function(option) {
        var endScopeValue = parseInt(option.value);
        option.disabled = endScopeValue <= startScopeValue; // start_scope보다 작거나 같으면 비활성화
    });

    // start_scope와 end_scope 값을 가져옴
    var endScopeValue = parseInt(document.getElementById('end_scope').value);
    // start_scope 이상 end_scope 이하의 상품만 필터링하여 출력
    var filteredList = list.filter(product => product.prdSal >= startScopeValue && product.prdSal <= endScopeValue);
    showGiftList(filteredList);
});

// end_scope 값이 변경될 때 start_scope의 옵션을 조절하는 함수
document.getElementById('end_scope').addEventListener('change', function() {
    var endScopeValue = parseInt(this.value); // end_scope의 값을 정수로 변환
    var startScopeSelect = document.getElementById('start_scope');

    // start_scope의 옵션을 end_scope보다 작은 값만 남기도록 설정
    Array.from(startScopeSelect.options).forEach(function(option) {
        var startScopeValue = parseInt(option.value);
        option.disabled = startScopeValue >= endScopeValue; // end_scope보다
        var startScopeValue = parseInt(option.value);
        option.disabled = startScopeValue >= endScopeValue; // end_scope보다 크거나 같으면 비활성화
    });

    // start_scope와 end_scope 값을 가져옴
    var startScopeValue = parseInt(document.getElementById('start_scope').value);
    // start_scope 이상 end_scope 이하의 상품만 필터링하여 출력
    var filteredList = list.filter(product => product.prdSal >= startScopeValue && product.prdSal <= endScopeValue);
    showGiftList(filteredList);
});

// 검색 키워드 입력 필드의 요소를 가져옴
let searchInput = document.querySelector('input[name="search"]');

// 검색 버튼 클릭 이벤트 리스너 추가
document.querySelector("#searchKeyword").addEventListener("click", searchHandler);

// 엔터 키 눌렀을 때 검색 버튼 클릭과 동일한 동작을 하도록 설정
searchInput.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        searchHandler();
    }
});

// 검색 버튼 클릭 이벤트 리스너 추가
document.querySelector("#searchKeyword").addEventListener("click", searchHandler);

// 엔터 키 눌렀을 때 검색 버튼 클릭과 동일한 동작을 하도록 설정
searchInput.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        searchHandler();
    }
});

// 검색과 필터링을 수행하는 함수
function searchHandler() {
    // 검색어 가져오기
    let keyword = searchInput.value.trim().toLowerCase();

    // 시작 가격과 끝 가격 가져오기
    let startScopeValue = parseInt(document.getElementById('start_scope').value);
    let endScopeValue = parseInt(document.getElementById('end_scope').value);

    // 선물 목록을 검색어와 가격대에 맞게 필터링
    let filteredList = list.filter(product => {
        let productNameMatch = product.prdName.toLowerCase().includes(keyword);
        let priceMatch = product.prdSal >= startScopeValue && product.prdSal <= endScopeValue;
        return productNameMatch && priceMatch;
    });

    // 필터링된 선물 목록을 화면에 출력
    showGiftList(filteredList);
}