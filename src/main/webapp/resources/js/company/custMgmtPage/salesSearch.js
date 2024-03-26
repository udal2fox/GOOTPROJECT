// 서치 기능

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//검색 버튼 클릭 이벤트 핸들러
document.querySelector('#searchBarSearchBtn').addEventListener('click', function() {
 currentKeyword = document.querySelector('#keyword').value; // 현재 키워드 갱신
 fetchSearchResults(currentKeyword); // 검색 결과 요청
 
});


//서치바-키워드 가져오기 
function fetchSearchResults(keyword) {
    let searchKeyword = {
        "keyword": keyword,
        "firDate" : document.querySelector('.datePick1').value,
        "secDate" : document.querySelector('.datePick2').value
    };
    console.log(searchKeyword);
    
    let jsonData = JSON.stringify(searchKeyword);
    console.log(jsonData);
    
    fetch('/searchConsult', {
        method: 'POST',
        body: jsonData,
        headers: {'Content-type': 'application/json; charset=utf-8'}
    })
    .then(response => response.json())
    .then(list => {
        console.log(list);
        let msg = '';
        list.forEach(list => {
            msg += '<tr>' +
                '<tr class="salesList" data-type="' + list.csStatus +'">' +
                '<td><a href="' + list.consultNo + '">' + list.consultNo + '</a></td>'+
                '<td>' + list.csDate + '</td>' +
                '<td>' + list.csCompanyName + '</td>' +
                '<td>' + list.csName + '</td>' +
                '<td>' + list.csContact + '</td>' +
                '<td>' + list.csEmail + '</td>' +
                '<td>' + list.csBdgt + '</td>' +
                '<td>' + list.csStatus + '</td>' +
                '<td>' + list.csEname + '</td>' +
                '</tr>';
        });

        resetCheckboxes();
        const tblBody = document.querySelector('#sales_tbl tbody');
        tblBody.innerHTML = msg;
        
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
    document.getElementById('salesList-csStatusAll').checked = true;
}


//필터링된 상품 리스트 가져오기
function getFilteredProducts() {
    let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="salesList-csStatus"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });

    // 여기서 새로운 상품 리스트를 가져오도록 수정
    let tds = document.querySelectorAll('.salesList'); // 전체 상품 리스트
    let filteredProducts = Array.from(salesLists).filter(function (salesLists) {
        let type = salesLists.getAttribute('data-type');
        return (typeFilters.length === 0 || typeFilters.includes(type));
    });

    return filteredProducts;
}

function myTime(unixTimeStamp) {
    moment.locale('ko'); // 한국어 설정
	// 오늘 날짜 가져오기
	const mytime = moment(unixTimeStamp).format('YYYY-MM-DD');

    return mytime;
}

// 서치 끝