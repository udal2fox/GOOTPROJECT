// 전역 변수로 선물 목록을 담을 변수 선언
let giftList;

// 페이지가 로드될 때 실행되는 함수
window.onload = () => {
    // 선물 목록을 가져오는 fetch 요청
    fetch("/userAdminPage/getGiftList")
        .then((response) => response.json()) // 응답을 JSON 형식으로 변환
        .then((data) => {
            // 전역 변수 giftList에 선물 목록 할당
            giftList = data;
            // 선물 목록을 초기 필터링하여 출력
            applyFiltersAndShowList();
        })
        .catch((err) => console.error(err)); // 오류 처리

    // 닫기 버튼에 클릭 이벤트 추가
    document.querySelector("#cancleButton").addEventListener("click", () => {
        location.href = "/userAdminPage/goManagegift";
    });

    // 초기화 버튼에 클릭 이벤트 추가
    document.getElementById("resetButton").addEventListener("click", resetCheckboxes);

    // 체크박스 변경 이벤트를 캐치하여 체크박스 카운트 업데이트
    document.getElementById("productList").addEventListener("change", function (event) {
        if (event.target.classList.contains("form-check-input")) {
            countCheckboxes();
        }
    });

    // 시작 가격 변경 시 필터링 및 선물 목록 업데이트
    document.getElementById('start_scope').addEventListener('change', applyFiltersAndShowList);

    // 끝 가격 변경 시 필터링 및 선물 목록 업데이트
    document.getElementById('end_scope').addEventListener('change', applyFiltersAndShowList);

    // 검색 버튼 클릭 시 검색 수행
    document.getElementById("searchKeyword").addEventListener("click", searchHandler);

    // 엔터 키 눌렀을 때 검색 수행
    document.querySelector('input[name="search"]').addEventListener("keydown", function (event) {
        if (event.key === "Enter") {
            searchHandler();
        }
    });
};

// 선물 목록을 화면에 표시하는 함수
function showGiftList(data) {
    let productList = document.querySelector("#productList"); // HTML 요소 찾기
    let html = ""; // 출력할 HTML 문자열 초기화
    data.forEach((product) => {
        // 각 선물에 대한 HTML 요소 생성
        html += '<div class="col p-1">';
        html += '<div class="form-check">';
        html += '<input class="form-check-input" type="checkbox" data-code="' + product.prdNo + '" id="' + product.prdNo + '">';
        html += '<label class="form-check-label" for="' + product.prdNo + '">';
        html += '<div class="card" style="width:160px;">';
        html += '<img src="' + product.prdImg + '" class="card-img-top object-fit-fill border rounded" alt="product" width="150px" height="150px">';
        html += '<div class="card-body">';
        html += '<div style="height:85px;"><span class="card-text" style="font-size: 0.7rem;">' + extractProductName(product.prdName) + "</span></div>";
        html += '<div><span class="card-text" style="font-size: 0.7rem;">▶ 금액 : ' + product.prdSal.toLocaleString() + "원</span></div>";
        html += "</div></div></label></div></div>";
    });
    productList.innerHTML = html; // HTML 문자열을 HTML 요소에 할당하여 화면에 출력
}

// 상품명에서 []와 () 안에 있는 텍스트를 제외하고 반환하는 함수
function extractProductName(productName) {
    return productName.replace(/[\[\(].*?[\]\)]/g, '').trim();
}

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

// 필터를 적용하여 선물 목록을 업데이트하고 화면에 출력하는 함수
function applyFiltersAndShowList() {
    // 시작 가격과 끝 가격 가져오기
    let startScopeValue = parseInt(document.getElementById('start_scope').value);
    let endScopeValue = parseInt(document.getElementById('end_scope').value);

    // 선물 목록을 필터링
    let filteredList = giftList.filter(product => product.prdSal >= startScopeValue && product.prdSal <= endScopeValue);

    // 필터링된 선물 목록을 화면에 출력
    showGiftList(filteredList);
}

// 검색과 필터링을 수행하는 함수
function searchHandler() {
    // 검색어 가져오기
    let keyword = document.querySelector('input[name="search"]').value.trim().toLowerCase();

    // 시작 가격과 끝 가격 가져오기
    let startScopeValue = parseInt(document.getElementById('start_scope').value);
    let endScopeValue = parseInt(document.getElementById('end_scope').value);

    // 선물 목록을 검색어와 가격대에 맞게 필터링
    let filteredList = giftList.filter(product => {
        let productNameMatch = product.prdName.toLowerCase().includes(keyword);
        let priceMatch = product.prdSal >= startScopeValue && product.prdSal <= endScopeValue;
        return productNameMatch && priceMatch;
    });

    // 필터링된 선물 목록을 화면에 출력
    showGiftList(filteredList);
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
    let count = document.querySelectorAll('input[type="checkbox"]:checked').length;
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

