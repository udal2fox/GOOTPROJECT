// 서치 기능

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//검색 버튼 클릭 이벤트 핸들러
document.querySelector('#searchBarSearchBtn').addEventListener('click', function() {
 currentKeyword = document.querySelector('#keyword').value; // 현재 키워드 갱신
 fetchSearchResults(currentKeyword); // 검색 결과 요청
 
});

function fetchSearchResults(keyword) {
    fetch('/searchSpot?keyword=' + keyword)
        .then(response => response.json())
        .then(list => {
            let msg = '';
            list.forEach(list => {
            	  msg += '<tr class="spotList" data-type="'+list.spStatus+'">'+
                  '<td><a href="'+list.companyNo+'">'+list.companyNo+'</a></td>'+
                  '<td><a href="'+list.spotNo+'">'+list.spotNo+'</a></td>'+
                  '<td>'+list.comName+'</td>'+
                  '<td>'+list.spName+'</td>'+
                  '<td>'+list.spAddr+'</td>'+
                  '<td>'+list.spAgreementDate+'</td>'+
                  '<td>'+list.spStatus+'</td>'+
                  '<td>'+list.spChangeDate+'</td>'+ 
                  '<td><a href=# id=open_managerInpo_modal>'+list.userName+'</a></td>'+
                  '<td><a href=# id=open_empList_modal>보기</a></td>'+
              '</tr>';
            });
            resetCheckboxes();
            const tableBody = document.querySelector('#spot_tbl tbody');
            tableBody.innerHTML = msg;
            
            drawPagination();
            goToPage(1);
            resetCheckboxes();

        })
        .catch(error => console.error('Error:', error));
}

//체크박스 상태 초기화 함수 이기능을 안걸어두면 체크 박스 꺼져있는데 검색하면 체크박스 무시하고나옴 // 이거 예외처리하면 코드 너무 길어짐;;
function resetCheckboxes() {
    // 모든 체크박스를 비활성화
    document.querySelectorAll('.filter-checkbox').forEach(function(checkbox) {
        checkbox.checked = true;
    });

    // "전체 선택" 체크박스도 초기화
    document.getElementById('spotList-serviceStatusAll').checked = true;
}


//필터링된 상품 리스트 가져오기
function getFilteredProducts() {
    let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="spotList-serviceStatus"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });

    // 여기서 새로운 상품 리스트를 가져오도록 수정
    let tds = document.querySelectorAll('.spotLists'); // 전체 상품 리스트
    let filteredProducts = Array.from(tds).filter(function (tds) {
        let type = tds.getAttribute('data-type');
        return (typeFilters.length === 0 || typeFilters.includes(type));
    });

    return filteredProducts;
}
