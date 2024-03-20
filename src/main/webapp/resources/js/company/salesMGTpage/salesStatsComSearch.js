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
	    "firDate" : document.querySelector('.datePick1').value,
	    "secDate" :	document.querySelector('.datePick2').value
	}
	
	console.log(searchKeyword);
	
	fetch('/comVatSearch',
	{
		method : 'POST',
		body :  JSON.stringify(searchKeyword),
		headers : {'Content-type':'application/json; charset=utf-8'}
	})
        .then(response => response.json())
        .then(list => {
        	console.log(list);
        	console.log(list.salePrd);
            let vmsg = '';
            	vmsg += '<tr>';
            	vmsg += '<td>VAT 별도</td>';
            	vmsg += '<td>'+list.salePrd+'</td>';
            	vmsg += '<td>'+list.totalSum.toLocaleString('ko-KR')+'</td>';
            	vmsg += '<td>'+list.totalBuy.toLocaleString('ko-KR')+'</td>';
            	vmsg += '<td>'+((list.recAdTotal+list.totalSum - list.totalBuy)/list.totalBuy).toFixed(2)+'</td>';
            	vmsg += '</tr>';
            	vmsg += '<tr>';
            	vmsg += '<td>VAT 포함</td>';
            	vmsg += '<td>'+list.salePrd+'</td>';
            	vmsg += '<td>'+parseInt(list.totalSum + (list.totalSum * 0.1)).toLocaleString('ko-KR')+'</td>';
            	vmsg += '<td>'+parseInt(list.totalBuy + (list.totalBuy * 0.1)).toLocaleString('ko-KR')+'</td>';
            	vmsg += '<td>'+((list.recAdTotal+list.totalSum - list.totalBuy)/list.totalBuy).toFixed(2)+'</td>';
            	vmsg += '</tr>';
            resetCheckboxes();
            const vatBody = document.querySelector('.vat');
            vatBody.innerHTML = vmsg;
            
            drawPagination();
            goToPage(1);
            resetCheckboxes();

        })
        .catch(error => console.error('Error:', error));
	
	fetch('/saleComSearch',
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
            	msg += '<tr class="td" data-type="' + list.comBizType + '">';
            	msg += '<td>' + list.companyNo + '</td>';
            	msg += '<td>' + list.comName + '</td>';
            	msg += '<td>' + list.recSumTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.recSupTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.recTaxTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.prdCstPriTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.prdCstSupTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.prdCstTaxTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.resADTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.resADSupTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + list.resADTaxTotal.toLocaleString('ko-KR') + '</td>';
            	msg += '<td>' + (list.resADTotal + list.recSumTotal - list.prdCstPriTotal) / list.recSumTotal.toFixed(2) + '</td>';
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
}


// 필터링된 상품 리스트 가져오기
function getFilteredProducts() {
    let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="td-Business"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });

    // 여기서 새로운 상품 리스트를 가져오도록 수정
    let tds = document.querySelectorAll('.td'); // 전체 상품 리스트
    let filteredProducts = Array.from(tds).filter(function (tds) {
        let type = tds.getAttribute('data-type');
        return (typeFilters.length === 0 || typeFilters.includes(type));
    });

    return filteredProducts;
}




