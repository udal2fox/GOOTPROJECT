// 서치 기능

// 키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//검색 버튼 클릭 이벤트 핸들러
document.querySelector('#search').addEventListener('click', function() {
    currentKeyword = document.querySelector('#keyword').value; // 현재 키워드 갱신
    fetchSearchResults(currentKeyword); // 검색 결과 요청
});

// 검색 결과 요청 함수
function fetchSearchResults(keyword) {
    fetch('/searchProduct?keyword=' + keyword)
        .then(response => response.json())
        .then(list => {
            let msg = '';
            list.forEach(list => {
                msg += '<tr class="product" data-type="'+list.prdMajorCtg+'" data-status="'+list.prdSt+'">'+
					   '<td><a href="moveSuppliersUpdate">'+list.supsCo+'</a></td>'+
					   '<td><a href="moveProductUpdate">'+list.prdNo+'</a></td>'+
					   '<td>'+list.prdSdc+'</td>'+
					   '<td>'+list.prdMajorCtg+'</td>'+
					   '<td>'+list.prdSubCtg+'</td>'+
					   '<td>'+
					   		'<img alt="" src="'+list.prdImg+'" align="left" ><div id="tdTop">'+list.prdName+'</div></td>'+
					   '<td>'+list.prdCstPri.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' })+'</td>'+
				       '<td>'+list.prdSal.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' })+'</td>'+
					   '<td>'+(list.prdMargin * 100 )+'%</td>'+
		           '</tr>';
                
            });
            document.querySelector('#table-prd tbody').innerHTML = msg;
            resetCheckboxes();
        })
        .catch(error => console.error('Error:', error));
}


// 체크박스 상태 초기화 함수 이기능을 안걸어두면 체크 박스 꺼져있는데 검색하면 체크박스 무시하고나옴 // 이거 예외처리하면 코드 너무 길어짐;;
function resetCheckboxes() {
    // 모든 체크박스를 비활성화
    document.querySelectorAll('.filter-checkbox').forEach(function(checkbox) {
        checkbox.checked = true;
    });

    // "전체 선택" 체크박스도 초기화
    document.getElementById('product-typeAll').checked = true;
    document.getElementById('product-statusAll').checked = true;
}


