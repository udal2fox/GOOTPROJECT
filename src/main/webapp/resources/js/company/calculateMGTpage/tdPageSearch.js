// 서치 기능

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//검색 버튼 클릭 이벤트 핸들러
document.querySelector('#search').addEventListener('click', function() {
 currentKeyword = document.querySelector('#tdKeyword').value; // 현재 키워드 갱신
 fetchSearchResults(currentKeyword); // 검색 결과 요청
 
});


function fetchSearchResults(keyword) {
  
	const searchKeyword = {
	    "keyword": document.getElementById('tdKeyword').value,
	    "recPayMth": document.querySelector('.payMth').value,
	    "firDate" : document.querySelector('.datePick1').value,
	    "secDate" :	document.querySelector('.datePick2').value
	}
	
	console.log(searchKeyword);
	
	fetch('/TradeDetailSearch.do',
	{
		method : 'POST',
		body :  JSON.stringify(searchKeyword),
		headers : {'Content-type':'application/json; charset=utf-8'}
	})
        .then(response => response.json())
        .then(list => {
        	console.log(list);
            let msg = '';
            list.forEach(list => {
            	msg += '<tr class="td" data-type="' + list.comBizType + '" data-status="' + list.recSortation + '">';
            	msg += '<td><input type="checkbox" name="categoryAll"></td>';
            	msg += '<td><a href="/tradeDetailEdit?recNo='+ list.recNo+'">'+list.recNo+'</td>';
            	msg += '<td><a href="/companyView?companyNo='+list.companyNo+ '">' + list.comName + '</a></td>';
            	msg += '<td>' + list.comBizType + '</td>';
            	msg += '<td><a href="/spotView?spotNo='+list.spotNo+'">' + list.spName + '</td>';
            	msg += '<td>' + myTime(list.recDate) + '</td>';
            	msg += '<td>' + (list.recSum - list.recDed + list.recAdd).toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + (list.recSup - list.recDedSup + list.recAddSup).toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + (list.recTax - list.recDedTax + list.recAddTax).toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.prdCstPri.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + (list.prdMargin).toFixed(2) + '</td>';
            	msg += '<td>' + list.recPayMth + '</td>';
            	msg += '<td>' + list.recSortation + '</td>';
            	msg += '</tr>';
            });
            resetCheckboxes();
            const tableBody = document.querySelector('.saleStatsTableInfo tbody');
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
    document.getElementById('td-BusinessAll').checked = true;
    document.getElementById('td-calculateAll').checked = true;
}


// 필터링된 상품 리스트 가져오기
function getFilteredProducts() {
    let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="td-Business"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });
    let statusFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="td-calculate"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });

    // 여기서 새로운 상품 리스트를 가져오도록 수정
    let tds = document.querySelectorAll('.td'); // 전체 상품 리스트
    let filteredProducts = Array.from(tds).filter(function (tds) {
        let type = tds.getAttribute('data-type');
        let status = tds.getAttribute('data-status');
        return (typeFilters.length === 0 || typeFilters.includes(type)) && (statusFilters.length === 0 || statusFilters.includes(status));
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