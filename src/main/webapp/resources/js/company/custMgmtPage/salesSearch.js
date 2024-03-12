/** 서치바 검색 기능 구현 */

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//서치바 검색 버튼 클릭 이벤트 핸들러
document.querySelector('#searchBarSearchBtn').addEventListener('click', function() {
//console.log("서치바 검색 버튼 클릭 이벤트");
 currentKeyword = document.querySelector('#searchBarKeyword').value; // 현재 키워드 갱신
 
 //console.log(currentKeyword);
 fetchSearchResults(currentKeyword); // 검색 결과 요청
 
});



//서치바-키워드 가져오기 
function fetchSearchResults(keyword) {
    // alert("서치바");
    // console.log(keyword);

    fetch('/search?keyword=' + keyword)
        .then(response => response.json())
        .then(list => {
            let msg = '';
            list.forEach(list => {
                msg += '<tr>' +
               		'<td><a href="${list.consultNo}">' + list.consultNo + '</a></td>' +
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

            const tblBody = document.querySelector('#sales_tbl tbody');
            tblBody.innerHTML = msg;

  

        })
        .catch(error => console.error('Error:', error));
} 



filter();

function filter() {
	
    // allCheck 체크박스 이벤트 리스너 등록
    document.getElementById('csStatus_all').addEventListener('change', function() {
    	
    	
    	const checkAll = this.checked;
        const checkboxes = document.querySelectorAll('.searchbar_checkbox[data-filter="csStatus_type"]');
        
        checkboxes.forEach(function(checkbox) {
            checkbox.checked = checkAll;
        });
    	
    	
    	
    	
        // allCheck 체크박스 상태에 따라 상품 종류 체크박스 상태 변경
        let isChecked = this.checked;
        document.querySelectorAll('.searchbar_checkbox [data-filter="csStatus_type"]').forEach(function(checkbox) {
            console.log(checkbox);
            checkbox.checked = isChecked;
        });

        // 영업 상태 필터링 적용
        filterCsStatus();
    });




    // 체크박스가 변경될 때 필터링 함수를 호출하는 이벤트 리스너 등록
    document.querySelectorAll('.searchbar_checkbox').forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            // allCheck 체크박스 상태 업데이트
            let isTypeAllChecked = isAllTypeCheckboxesChecked();
            document.getElementById('csStatus_typeAll').checked = isTypeAllChecked;

           

            // 영업 상태 필터링 적용
            filterCsStatus();
        });
    });

    // 영업 상태 필터링 함수
    function filterCsStatus() {
        // 선택된 영업 상태  필터 가져오기
        let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="csStatus_type"]:checked')).map(function(checkbox) {
            return checkbox.value;
        });
   

        // 전체 체크 상태 확인
        let isAllTypeChecked = document.getElementById('csStatus_type').checked;

        // 모든 영업 상태 체크박스가 해제되었을 때 조회되지 않도록 처리
        if (!isAllTypeChecked && typeFilters.length === 0) {
            // 모든 영업 상태 숨기기
            document.querySelectorAll('.csStatus').forEach(function(product) {
            	csStatus.style.display = 'none';
            });
            // 처리가 골치아파서 체크 꺼지면 리무브 해버림;
            removePagination();
            return;
        }


        // 각 상품을 순회하면서 필터링 적용
        document.querySelectorAll('.csStatus').forEach(function(product) {
            let type = csStatus.getAttribute('data-type');

            // 상품 종류 및 상태가 필터에 포함되는 경우 보여주기, 그렇지 않은 경우 숨기기
            if ((typeFilters.length === 0 || typeFilters.includes(type)) && (statusFilters.length === 0 || statusFilters.includes(status))) {
                product.style.display = 'table-row'; // 테이블의 경우 display를 'table-row'로 설정
            } else {
                product.style.display = 'none';
            }
            // 필터링된 상품 개수를 기반으로 페이지네이션 다시 그리기
            drawPagination(1, Math.ceil(getFilteredProducts().length / amount));// <-- 그전에 함수에서 매개변수 사용했을때 방법  drawPagination(); 지금은 매개변수없이 돌아감
            goToPage(1); 																		   

        });
    }

    // 상품 종류 체크박스 모두 선택 여부 확인 함수
    function isAllTypeCheckboxesChecked() 
    {
        // 상품 종류 체크박스 중 선택된 개수 확인
        const checkedCount = document.querySelectorAll('.filter-checkbox[data-filter="product-type"]:checked').length;
        // 상품 종류 체크박스 개수만큼 모두 선택된 경우 true 반환
        return checkedCount === document.querySelectorAll('.filter-checkbox[data-filter="product-type"]').length;
    }


};


