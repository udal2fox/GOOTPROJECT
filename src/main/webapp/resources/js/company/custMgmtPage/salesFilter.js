	// 전역 변수 공간
	let amount = 10; // 페이지당 보여줄 아이템 수
	let pageNum = 1; // 현재 페이지 번호
	let salesLists = document.querySelectorAll('.salesList'); // 전체 상품 리스트
	let sortDirection = {}; // 정렬
	//------------

	filter();

	function filter() {
		
	    // allCheck 체크박스 이벤트 리스너 등록
	    document.getElementById('salesList-csStatusAll').addEventListener('change', function() {
	        // allCheck 체크박스 상태에 따라 상품 종류 체크박스 상태 변경
	        let isChecked = this.checked;
	        document.querySelectorAll('.filter-checkbox[data-filter="salesList-csStatus"]').forEach(function(checkbox) {
	            console.log(checkbox);
	            checkbox.checked = isChecked;
	        });
	
	        // 필터링 적용
	        filterProducts();
	    });

	    // 체크박스가 변경될 때 필터링 함수를 호출하는 이벤트 리스너 등록
	    document.querySelectorAll('.filter-checkbox').forEach(function(checkbox) {
	        checkbox.addEventListener('change', function() {
	            // allCheck 체크박스 상태 업데이트
	            let isTypeAllChecked = isAllTypeCheckboxesChecked();
	            document.getElementById('salesList-csStatusAll').checked = isTypeAllChecked;
	
	            // 필터링 적용
	            filterProducts();
	        });
	    });

	    // 상품 필터링 함수
	    function filterProducts() {
	        // 선택된 상품 종류 필터 및 상태 필터 가져오기
	        let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="salesList-csStatus"]:checked')).map(function(checkbox) {
	            return checkbox.value;
	        });
	
	        // 전체 체크 상태 확인
	        let isAllTypeChecked = document.getElementById('salesList-csStatusAll').checked;
	
	        // 모든 상품분류 체크박스가 해제되었을 때 조회되지 않도록 처리
	        if (!isAllTypeChecked && typeFilters.length === 0) {
	            // 모든 상품 숨기기
	            document.querySelectorAll('.salesList').forEach(function(product) {
	                product.style.display = 'none';
	            });
	            // 처리가 골치아파서 체크 꺼지면 리무브 해버림;
	            removePagination();
	            return;
	        }
	
	
	        // 각 상품을 순회하면서 필터링 적용
	        document.querySelectorAll('.salesList').forEach(function(product) {
	            let type = product.getAttribute('data-type');
	
	            // 상품 종류 및 상태가 필터에 포함되는 경우 보여주기, 그렇지 않은 경우 숨기기
	            if ((typeFilters.length === 0 || typeFilters.includes(type))) {
	                product.style.display = 'table-row'; // 테이블의 경우 display를 'table-row'로 설정
	            } else {
	                product.style.display = 'none';
	            }
	            // 필터링된 상품 개수를 기반으로 페이지네이션 다시 그리기
	            drawPagination(1, Math.ceil(getFilteredProducts().length / amount)); // <-- 그전에 함수에서 매개변수 사용했을때 방법  drawPagination(); 지금은 매개변수없이 돌아감
	            goToPage(1);
	        });
	    }
	
	    // 체크박스 들 카운팅
	    // 상품 종류 체크박스 모두 선택 여부 확인 함수
	    function isAllTypeCheckboxesChecked() {
	        // 상품 종류 체크박스 중 선택된 개수 확인
	        const checkedCount = document.querySelectorAll('.filter-checkbox[data-filter="salesList-csStatus"]:checked').length;
	        // 상품 종류 체크박스 개수만큼 모두 선택된 경우 true 반환
	        return checkedCount === document.querySelectorAll('.filter-checkbox[data-filter="salesList-csStatus"]').length;
	    }
	
	};
	
	// 필터 끝


	/** -----------------페이징----------------- */

	// 페이징 시작
	// 페이지 이동 함수
	function goToPage(page) {
	    pageNum = page;
	    const startIndex = (pageNum - 1) * amount;
	    const endIndex = pageNum * amount;
	
	    let filteredProducts = getFilteredProducts();
	
	    filteredProducts.forEach((product, index) => {
	        if (index >= startIndex && index < endIndex) {
	            product.style.display = 'table-row';
	        } else {
	            product.style.display = 'none';
	        }
	    });
	
	    const paginationElement = document.getElementById('pagination');
	    const pageButtons = paginationElement.querySelectorAll('a');
	    pageButtons.forEach((button, index) => {
	        if (index === pageNum) {
	            button.classList.add('active');
	        } else {
	            button.classList.remove('active');
	        }
	    });
	
	    drawPagination();
	}
	
	// 페이징 버튼 바인딩 함수
	function drawPagination() {
	    let totalPages = Math.ceil(getFilteredProducts().length / amount);
	    //    if (getFilteredProducts().length % amount === 0) 
	    //    {
	    //        totalPages--;
	    //    }
	
	    const paginationElement = document.getElementById('pagination');
	    paginationElement.innerHTML = ''; // 전에 있던 페이지네이션 내용을 초기화
	
	    const ul = document.createElement('ul');
	    ul.classList.add('page-nation');
	
	    // 이전 페이지 버튼 추가
	    const prevButton = document.createElement('li');
	    const prevLink = document.createElement('a');
	    prevLink.href = '#';
	    prevLink.innerText = '◀';
	    prevLink.addEventListener('click', (e) => {
	        e.preventDefault();
	        if (pageNum > 1) goToPage(pageNum - 1);
	    });
	    prevButton.appendChild(prevLink);
	    ul.appendChild(prevButton);
	
	    // 페이지 번호 버튼 추가
	    const maxPageButtons = Math.min(totalPages, 5); // 최대 5개의 페이지 버튼을 표시합니다.
	    let startPage = Math.max(1, pageNum - 2);
	    let endPage = Math.min(startPage + maxPageButtons - 1, totalPages);
	
	    // 페이지수 조정
	    if (endPage - startPage < maxPageButtons - 1) {
	        startPage = Math.max(1, endPage - maxPageButtons + 1);
	    }
	
	    for (let num = startPage; num <= endPage; num++) {
	        const li = document.createElement('li');
	        const a = document.createElement('a');
	        a.href = '#'; // 페이지 번호 클릭 시 페이지 이동 방지
	        a.innerText = num;
	        a.addEventListener('click', () => goToPage(num)); // 페이지 번호 클릭 시 goToPage 함수 호출
	        if (num === pageNum) {
	            a.classList.add('active'); // 현재 페이지에 active 클래스 추가
	        }
	        li.appendChild(a);
	        ul.appendChild(li);
	    }
	
	    // 다음 페이지 버튼 추가
	    const nextButton = document.createElement('li');
	    const nextLink = document.createElement('a');
	    nextLink.href = '#';
	    nextLink.innerText = '▶';
	    nextLink.addEventListener('click', (e) => {
	        e.preventDefault();
	        if (pageNum < totalPages) goToPage(pageNum + 1);
	    });
	    nextButton.appendChild(nextLink);
	    ul.appendChild(nextButton);
	
	    paginationElement.appendChild(ul);
	}
	
	//필터링된 상품 리스트 가져오기
	function getFilteredProducts() {
	    let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="td-Business"]:checked')).map(function(checkbox) {
	        return checkbox.value;
	    });
	
	    return Array.from(salesLists).filter(function(product) {
	        let type = product.getAttribute('data-type');
	        return (typeFilters.length === 0 || typeFilters.includes(type));
	    });
	}
	
	function removePagination() {
	    const paginationElement = document.getElementById('pagination');
	    paginationElement.innerHTML = ''; // 페이지네이션 요소의 내용을 청소
	}
	
	
	// 초기 페이지네이션 그리기
	drawPagination();
	goToPage(1);
	
	
	// '보기' 셀렉트 박스에 change 이벤트 리스너 추가
	document.getElementById('selectViewAFew').addEventListener('change', function() {
	    // 선택된 옵션의 값을 가져와서 페이지당 아이템 수로 설정
	    amount = parseInt(this.value);
	    
	    // 페이지 이동 함수 호출하여 페이지를 다시 로드
	    goToPage(1);
	});

	
	
	
	
	
	// 페이징 끝
	
	
	//리셋 그냥 새로고침''
	document.querySelector('#searchBarResetBtn').addEventListener('click', function() {
		console.log("서치바 초기화");
	    location.reload();
	});
	
	
	
	
	
	

	/** -----------------소트 버튼 : 정렬 기능----------------- */


	//소트 버튼에 클릭 이벤트를 추가하여 정렬 기능을 구현
	document.querySelectorAll('.sort-btn').forEach(button => {
	    button.addEventListener('click', () => {
	        const column = button.dataset.column;
	        sortDirection[column] = !sortDirection[column]; // 정렬 방향을 변경

	        // 정렬 방향에 따라 버튼 모양 변경
	        button.innerText = sortDirection[column] ? '🔽' : '🔼';
	        sortTable(column);
	    });
	});


function getCellValue(row, column) {
    const columnIndex = {
    "csDate": 1,
    "csCompanyName": 2,
    "csName": 3,
    "csEname": 8
} [column];

const cell = row.querySelector(`td:nth-child(${columnIndex + 1})`);
return cell ? cell.textContent.trim() : "";
}

function sortTable(column) {
	 const tbody = document.querySelector('.list_div_tbl tbody');
   const rows = Array.from(tbody.querySelectorAll('tr'));

   // 정렬 방식에 따라 정렬
   rows.sort((a, b) => {
       const aValue = getCellValue(a, column);
       const bValue = getCellValue(b, column);
       if (sortDirection[column]) {
           return aValue.localeCompare(bValue);
       } else {
           return bValue.localeCompare(aValue);
       }
   });

   // 정렬된 행을 테이블에 적용
   tbody.innerHTML = '';
   rows.forEach(row => tbody.appendChild(row));
}



/** -----------------searchBar-기간 설정----------------- */

// 데이트 피커 
flatpickr.localize(flatpickr.l10ns.ko);

let datePick1 = document.querySelector('.datePick1');
datePick1.flatpickr({
    local: 'ko'

});
let datePick2 = document.querySelector('.datePick2');
datePick2.flatpickr({
    local: 'ko'

});





//모먼트 js 날짜 계산

moment.locale('ko'); // 한국어 설정
// 오늘 날짜 가져오기
const today = moment();
// 현재 주의 시작 마지막날짜(월요일 시작 일요일끝) ex 오늘기준 0308 0304 ~ 0310
const startWeek = moment().startOf('week').add(1, 'days');
const endWeek = moment().endOf('week').add(1, 'days');

// 현재 달 계산
const nowStartMonth = moment().startOf('month');
const nowEndMonth = moment().endOf('month');

// 지날달 계산
const lastStartDate = moment().subtract(1, 'months').startOf('month');
const lastEndDate = moment().subtract(1, 'months').endOf('month');

//지난분기
const quarterStartDate = moment().subtract(1, 'quarter').startOf('quarter');
const quarterEndDate = moment().subtract(1, 'quarter').endOf('quarter');

const firDate = document.querySelector('.datePick1');
const secDate = document.querySelector('.datePick2');

document.querySelectorAll('.dateBtn').forEach((e) => {
    e.addEventListener('click', (btn) => {
        console.log(e.value);
        if (e.value == '오늘') {
            firDate.value = today.format('YYYY-MM-DD');
            secDate.value = today.format('YYYY-MM-DD');
        } else if (e.value == '최근1주') {
            firDate.value = startWeek.format('YYYY-MM-DD');
            secDate.value = endWeek.format('YYYY-MM-DD');
        } else if (e.value == '이번달') {
            firDate.value = nowStartMonth.format('YYYY-MM-DD');
            secDate.value = nowEndMonth.format('YYYY-MM-DD');
        } else if (e.value == '지난달') {
            firDate.value = lastStartDate.format('YYYY-MM-DD');
            secDate.value = lastEndDate.format('YYYY-MM-DD');
        } else if (e.value == '지난분기') {
            firDate.value = quarterStartDate.format('YYYY-MM-DD');
            secDate.value = quarterEndDate.format('YYYY-MM-DD');
        }
    })
});



