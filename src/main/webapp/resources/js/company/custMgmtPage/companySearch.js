/** 전역 변수 구역 */
const checkboxes = document.querySelectorAll('.searchbar_checkbox_filter');
const radioButtons = document.querySelectorAll('.searchbar_radioBtn_filter');
//목록상자의 값은 굳이 가져 올 필요가 없다



let selectedRadioBtn = ''; 

/** 서치바 검색 기능 구현 */

// 검색 버튼 클릭 이벤트 핸들러
document.querySelector('#searchBarSearchBtn').addEventListener('click', function() {
    // 라디오 버튼에서 선택된 값을 가져오기
    radioButtons.forEach(function(radioButton) {
        if (radioButton.checked) {
            selectedRadioBtn = radioButton.value;
        }
    });

    currentKeyword = document.querySelector('.searchBarKeyword').value; // 현재 키워드 갱신
    fetchSearchResults(currentKeyword, selectedRadioBtn); // 검색 결과 요청
});

// 서치바-검색 기능 
function fetchSearchResults(keyword, companyType) {
    console.log("검색 키워드: " + keyword + ", 기업 구분: " + companyType);
    
    let searchKeyword = {
        keyword: keyword,
        comBizStatus: document.getElementById('searchBarBizStatus').value,
        comBizType: companyType
    };
    
    let jsonData = JSON.stringify(searchKeyword);
    console.log(jsonData);
    
    fetch('/searchCompanyList', {
        method: 'POST',
        body: jsonData,
        headers: {'Content-type': 'application/json; charset=utf-8'}
    })
    .then(response => response.json())
    .then(data => {
        console.log("필터링된 리스트 불러오니: ", data);
        
        let msg = '';
        data.forEach(item => {
            msg += `
                <tr class="companyList" data-type="${item.comArea}">
                    <td><a href="${item.companyNo}">${item.companyNo}</a></td>
                    <td>${item.comName}</td>
                    <td>${item.comBizNum}</td>
                    <td>${item.comBizType}</td>
                    <td>${item.comArea}</td>
                    <td>${item.comAddr}</td>
                    <td>${item.comContact}</td>
                    <td>${item.comBizStatus}</td>
                </tr>
            `;
        });

        resetCheckboxes();
        const tblBody = document.querySelector('#company_tbl tbody');
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
    document.querySelectorAll('.searchbar_checkbox_filter').forEach(function(checkbox) {
        checkbox.checked = true;
    });

    // "전체 선택" 체크박스도 초기화
    document.getElementById('comArea_typeAll').checked = true;
}


// 필터링된 기업 리스트 가져오기
function getFilteredCompanys() {
    let typeFilters = Array.from(document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comArea_type"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });


    // 여기서 새로운 상품 리스트를 가져오도록 수정
    let tds = document.querySelectorAll('.td'); // 전체 상품 리스트
    let filteredProducts = Array.from(tds).filter(function (tds) {
        let type = tds.getAttribute('data-type');
        return (typeFilters.length === 0 || typeFilters.includes(type));
    });

    return filteredCompanys;
}

function myTime(unixTimeStamp) {
    moment.locale('ko'); // 한국어 설정
	// 오늘 날짜 가져오기
	const mytime = moment(unixTimeStamp).format('YYYY-MM-DD');

    return mytime;
}

// 서치 끝