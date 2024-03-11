// 서치 기능

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//검색 버튼 클릭 이벤트 핸들러
document.querySelector('#search').addEventListener('click', function() {
 currentKeyword = document.querySelector('#keyword').value; // 현재 키워드 갱신
 fetchSearchResults(currentKeyword); // 검색 결과 요청
 
});

function fetchSearchResults(keyword) {
    fetch('/searchSups?keyword=' + keyword)
        .then(response => response.json())
        .then(list => {
            let msg = '';
            console.log(list);
            list.forEach(list => {
                msg += '<tr class="sups" data-type="'+list.supsBnt+'" data-status="'+list.supsSt+'">'+
                            '<td><a href="moveSuppliersUpdate?supsNo='+list.supsNo+'">'+list.supsNo+'</a></td>'+
                            '<td>'+list.supsCo+'</td>'+
                            '<td>'+list.supsBnt+'</td>'+
                            '<td>'+list.supsBizRegNum+'</td>'+
                            '<td>'+list.supsAddr+'</td>'+
                            '<td>'+list.supsCt+'</td>'+
                            '<td>'+list.supsCoEmail+'</td>'+
                            '<td>'+list.supsSt+'</td>'+
                        '</tr>';
            });
            resetCheckboxes();
            const tableBody = document.querySelector('#table-prd tbody');
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
    document.getElementById('sups-typeAll').checked = true;
    document.getElementById('sups-statusAll').checked = true;
}


// 필터링된 상품 리스트 가져오기
function getFilteredProducts() {
    let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="sups-type"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });
    let statusFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="sups-status"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });

    // 여기서 새로운 상품 리스트를 가져오도록 수정
    let products = document.querySelectorAll('.sups'); // 전체 상품 리스트
    let filteredProducts = Array.from(products).filter(function (product) {
        let type = product.getAttribute('data-type');
        let status = product.getAttribute('data-status');
        return (typeFilters.length === 0 || typeFilters.includes(type)) && (statusFilters.length === 0 || statusFilters.includes(status));
    });

    return filteredProducts;
}


// 서치 끝