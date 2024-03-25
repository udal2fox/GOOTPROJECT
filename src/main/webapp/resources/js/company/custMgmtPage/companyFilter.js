/** -----------------전역 변수 공간----------------- */
const amount = 10; // 페이지당 보여줄 아이템 수
let pageNum = 1; // 현재 페이지 번호
let totalCompanyList = document.querySelectorAll('.companyList'); // 전체 기업 리스트
let sortDirection = {}; // 정렬


/** -----------------서치바 : 필터 걸기----------------- */
filter();


function filter() {
	// 지역 체크박스 '전체'값 이벤트 리스너 등록 
	document.getElementById('comArea_typeAll').addEventListener('change', function() {
	    let isChecked = this.checked;
	    document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comArea_type"]').forEach(function(checkbox) {
	        checkbox.checked = isChecked;
	    });

	    filterCompany(); // '전체'값 선택 시 필터링 함수 호출
	   
	});

	// 기업 구분 체크박스 '전체'값 이벤트 리스너 등록 
	document.getElementById('comBizType_typeAll').addEventListener('change', function() {
	    let isChecked = this.checked;
	    document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comBizType_type"]').forEach(function(checkbox) {
	        checkbox.checked = isChecked;
	    });

	    filterCompany(); // '전체'값 선택 시 필터링 함수 호출
	   
	});
	
    
// 체크박스가 변경될 때 필터링 함수를 호출하는 이벤트 리스너 등록
document.querySelectorAll('.searchbar_checkbox_filter').forEach(function(checkbox) {
    checkbox.addEventListener('change', function() {
    	
    	// 지역 체크박스
        let comAreaAll = comAreaAllChecked();
        document.getElementById('comArea_typeAll').checked = comAreaAll;
        
        // 기업 구분 체크박스
        let comBizTypeAll = bizTypeAllChecked();
        document.getElementById('comBizType_typeAll').checked = comBizTypeAll;
        
        filterCompany();
    });
});
    

// 서치바 필터링 함수
function filterCompany() {
	
    // 선택된 '지역' 필터 가져오기
    let comAreaFilter = Array.from(document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comArea_type"]:checked')).map(function(checkbox) {
        return checkbox.value;
    }); 
    
    // 선택된 '기업 구분' 필터 가져오기
    let comBizTypeFilter = Array.from(document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comBizType_type"]:checked')).map(function(checkbox) {
        return checkbox.value;
    }); 
    
    // '전체' 체크 상태 확인
    let isComAreaAll = document.getElementById('comArea_typeAll').checked;
    let isComBizTypeAll = document.getElementById('comBizType_typeAll').checked;
    
    // 모든 '지역' 체크박스가 해제되었을 때 조회되지 않도록 처리
    if (!isComAreaAll && comAreaFilter.length === 0) {
        // 모든 기업 숨기기
        document.querySelectorAll('.companyList').forEach(function(companyList) {
        	
        	companyList.style.display = 'none';
        });
        
        return;
    }
    
    // 모든 '기업 구분' 체크박스가 해제되었을 때 조회되지 않도록 처리
    if (!isComBizTypeAll && comBizTypeFilter.length === 0) {
        // 모든 기업 숨기기
        document.querySelectorAll('.companyList').forEach(function(companyList) {
        	
        	companyList.style.display = 'none';
        });
       
        return;
    }


// 각 기업을 순회하면서 필터링 적용
document.querySelectorAll('.companyList').forEach(function(companyList) {
    let comArea = companyList.getAttribute('data-comArea');
    let comBizType = companyList.getAttribute('data-comBizType');
   
    // 지역 및 기업 구분 값이 필터에 포함되는 경우 보여주기, 그렇지 않은 경우 숨기기
    if ((comAreaFilter.length === 0 || comAreaFilter.includes(comArea)) && (comBizTypeFilter.length === 0 || comBizTypeFilter.includes(bizType)))  {
    	companyList.style.display = 'table-row'; // 테이블의 경우 display를 'table-row'로 설정
    } else {
    	companyList.style.display = 'none';
    }
    
    // 필터링된 상품 개수를 기반으로 페이지네이션 다시 그리기
    drawPagination(1, Math.ceil(getFilteredCompanys().length / amount));// <-- 그전에 함수에서 매개변수 사용했을때 방법  drawPagination(); 지금은 매개변수없이 돌아감
        goToPage(1); 																		   

    });
}



// '지역' 체크박스 모두 선택 여부 확인 함수
function comAreaAllChecked() {
    // '지역' 체크박스 중 선택된 개수 확인
    const checkedCount = document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comArea_type"]:checked').length;
    	// '지역' 체크박스 개수만큼 모두 선택된 경우 true 반환
    	return checkedCount === document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comArea_type"]').length;
    }
    
// '기업 구분' 체크박스 모두 선택 여부 확인 함수
function comBizTypeAllChecked() 
{
    // '기업 구분' 체크박스 중 선택된 개수 확인
    const checkedCount = document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comBizType_type"]:checked').length;
    // '기업 구분' 체크박스 개수만큼 모두 선택된 경우 true 반환
    	return checkedCount === document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comBizType_type"]').length;
}

};
/** -----------------페이징----------------- */

/// 페이지 이동 함수
function goToPage(page) {
    pageNum = page;
    const startIndex = (pageNum - 1) * amount;
    const endIndex = pageNum * amount;

    const filteredConsults = getFilteredCompanys(); // 필터링된 기업 리스트 가져오기

    // 필터링된 기업 리스트에서 페이지 범위에 해당하는 부분만 보여주기
    filteredConsults.forEach((companyList, index) => {
        if (index >= startIndex && index < endIndex) {
            companyList.style.display = 'table-row';
        } else {
            companyList.style.display = 'none';
        }
    });

    // 페이지네이션 다시 그리기
    drawPagination(filteredConsults.length);
}

// 페이징 함수
function drawPagination(totalFilteredCompany) {
    const totalPages = Math.ceil(totalFilteredCompany / amount);

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


//필터링된 기업 리스트 가져오기
function getFilteredCompanys() {
    let comAreaFilter = Array.from(document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comArea_type"]:checked')).map(function(checkbox) {
        return checkbox.value;
    });
    let comBizTypeFilter = Array.from(document.querySelectorAll('.searchbar_checkbox_filter[data-filter="comBizType_type"]:checked')).map(function(checkbox) {
        return checkbox.value;
    });

    let filteredCompanies = Array.from(totalCompanyList).filter(function(companyList) {
        let comArea = companyList.getAttribute('data-comArea');
        let comBizType = companyList.getAttribute('data-comBizType');

        return (comAreaFilter.length === 0 || comAreaFilter.includes(comArea)) && (comBizTypeFilter.length === 0 || comBizTypeFilter.includes(comBizType));
    });

    return filteredCompanies;
}



//초기 페이지네이션 그리기
drawPagination();
goToPage(1);


/** -----------------페이징 끝----------------- */

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
    		"companyNo": 0,
    	    "comName": 1,
    	    "comBizType": 3,
    	    "comArea": 4,
    	    "comBizStatus": 7
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




































