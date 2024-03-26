// ----- css 파일 추가
// 1. 파일 경로 설정
//const CSS_FILE_PATH = '/resources/css/company/employeeSupervisePage/searchEmployeePage.css';
// 2. link 태그 생성
//let linkEle = document.createElement('link');
//linkEle.rel = 'stylesheet';
//linkEle.type = 'text/css';
//linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
//document.head.appendChild(linkEle);

//전역 변수 공간
const amount = 13; // 페이지당 보여줄 아이템 수
let pageNum = 1; // 현재 페이지 번호
let employee = document.querySelectorAll('.employee'); // 전체 직원 리스트
let sortDirection = {}; // 정렬
//------------


filter();

function filter() {
	
	// 검색어에 따른 필터링 함수
	function filterEmployeesByKeyword(keyword) {
	    // 검색어를 소문자로 변환
	    const lowercaseKeyword = keyword.trim().toLowerCase();

	    // 모든 직원 정보를 가져옴
	    const tableRows = document.querySelectorAll('.employee');

	    // 각 직원을 순회하면서 검색어 필터링 적용
	    tableRows.forEach(row => {
	        const name = row.cells[1].textContent.toLowerCase(); // 이름 열
	        const email = row.cells[2].textContent.toLowerCase();
	        const dname = row.cells[4].textContent.toLowerCase(); // 부서 이름 열

	        // 검색어가 직원의 이름, 이메일, 또는 부서명에 포함되는 경우 보여주기, 그렇지 않은 경우 숨기기
	        if (name.includes(lowercaseKeyword) || dname.includes(lowercaseKeyword) || email.includes(lowercaseKeyword)) {
	            row.style.display = 'table-row'; // 행 보이기
	        } else {
	            row.style.display = 'none';
	        }
	    });

	    // 필터링된 직원 개수를 기반으로 페이지네이션 다시 그리기
	    drawPagination();
	    goToPage(1); // 첫 페이지로 이동
	}

	// 부서명에 따른 필터링 함수
	function filterEmployeesByDepartment(department) {
	    // 선택된 부서명을 소문자로 변환
	    const lowercaseDept = department.toLowerCase();

	    // 모든 직원 정보를 가져옴
	    const tableRows = document.querySelectorAll('.employee');

	    // 각 직원을 순회하면서 부서명 필터링 적용
	    tableRows.forEach(row => {
	        const dname = row.cells[4].textContent.toLowerCase(); // 부서 이름 열

	        // 선택된 부서명이 '전체'이거나 직원의 부서명과 일치하는 경우 보여주기, 그렇지 않은 경우 숨기기
	        if (lowercaseDept === '전체' || dname === lowercaseDept) {
	            row.style.display = 'table-row'; // 행 보이기
	        } else {
	            row.style.display = 'none';
	        }
	    });

	    // 필터링된 직원 개수를 기반으로 페이지네이션 다시 그리기
	    drawPagination();
	    goToPage(1); // 첫 페이지로 이동
	}

	// 필터링 적용 함수
	function applyFilters() {	
	    const selectedDept = document.querySelector('.dept-sb').value; // 선택된 부서명

	    filterEmployeesByDepartment(selectedDept);
	}

	// 서치바에 대한 이벤트 리스너
	document.querySelector('.searchBar').addEventListener('keypress', function(event) {
	    if (event.key === 'Enter') { // 엔터 키 입력 확인
	    	 const keyword = this.value.trim().toLowerCase();
	         filterEmployeesByKeyword(keyword);
	    }
	});

	// 셀렉트 박스에 대한 이벤트 리스너
	document.querySelector('.dept-sb').addEventListener('change', function() {
	    applyFilters(); // 필터링 적용 함수 호출
	});

// 필터 끝

	// 페이지 이동 함수
	function goToPage(page) {
	    pageNum = page;
	    const startIndex = (pageNum - 1) * amount;
	    const endIndex = pageNum * amount;

	    let filteredEmployees = getFilteredEmployees();

	    // 각 직원을 순회하면서 페이지에 표시할 범위의 직원만 보이도록 처리
	    filteredEmployees.forEach((employee, index) => {
	        if (index >= startIndex && index < endIndex) {
	            employee.style.display = 'table-row';
	        } else {
	            employee.style.display = 'none';
	        }
	    });

	    // 페이지네이션의 활성화된 버튼 처리
	    const paginationElement = document.getElementById('pagination');
	    const pageButtons = paginationElement.querySelectorAll('a');
	    pageButtons.forEach((button, index) => {
	        if (index === pageNum) {
	            button.classList.add('active');
	        } else {
	            button.classList.remove('active');
	        }
	    });
	}

	// 페이지네이션 그리기 함수
	function drawPagination() {
	    let totalPages = Math.ceil(getFilteredEmployees().length / amount);

	    const paginationElement = document.getElementById('pagination');
	    paginationElement.innerHTML = ''; // 페이지네이션 초기화

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

	    if (endPage - startPage < maxPageButtons - 1) {
	        startPage = Math.max(1, endPage - maxPageButtons + 1);
	    }

	    for (let num = startPage; num <= endPage; num++) {
	        const li = document.createElement('li');
	        const a = document.createElement('a');
	        a.href = '#';
	        a.innerText = num;
	        a.addEventListener('click', () => goToPage(num));
	        if (num === pageNum) {
	            a.classList.add('active');
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

	// 필터링된 직원 리스트 반환 함수
	function getFilteredEmployees() {
	    // 검색어 및 부서명에 따른 필터링 적용
	    const keyword = document.querySelector('.searchBar').value.trim().toLowerCase();
	    const selectedDept = document.querySelector('.dept-sb').value.toLowerCase();

	    let filteredEmployees = [];

	    document.querySelectorAll('.employee').forEach(employee => {
	        const name = employee.cells[1].textContent.toLowerCase();
	        const email = employee.cells[2].textContent.toLowerCase();
	        const dname = employee.cells[4].textContent.toLowerCase();

	        const isNameMatch = name.includes(keyword);
	        const isEmailMatch = email.includes(keyword);
	        const isDeptMatch = (selectedDept === '전체' || dname === selectedDept);

	        if ((keyword === '' || isNameMatch || isEmailMatch) && isDeptMatch) {
	            filteredEmployees.push(employee);
	        }
	    });

	    return filteredEmployees;
	}

	function removePagination() {
	    const paginationElement = document.getElementById('pagination');
	    paginationElement.innerHTML = ''; // 페이지네이션 초기화
	}

	// 초기 페이지네이션 그리기
	drawPagination();
	goToPage(1);

// 페이징 끝

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
        "eno": 0,
        "dName": 4,
        "job": 5,
        "hireDt": 7,
        "endDt": 8,
        "idStatus" : 9
    } [column];
    
    const cell = row.querySelector(`td:nth-child(${columnIndex + 1})`);
    let cellValue = cell ? cell.textContent.trim() : "";
    
    if (column === "eno") {
        return parseInt(cellValue);
    }
    return cellValue;
}

function sortTable(column) {
    const tbody = document.querySelector('.table tbody');
    const rows = Array.from(tbody.querySelectorAll('tr'));

    // 정렬 방식에 따라 정렬
    rows.sort((a, b) => {
        const aValue = getCellValue(a, column);
        const bValue = getCellValue(b, column);
        
        // eno 열인 경우 숫자로 비교
        if (column === 'eno') {
        	return sortDirection[column] ? aValue - bValue : bValue - aValue;
        } else {
            // 그 외의 열은 문자열로 비교
            if (sortDirection[column]) {
                return aValue.localeCompare(bValue);
            } else {
                return bValue.localeCompare(aValue);
            }
        }
    });

    // 정렬된 행을 테이블에 적용
    tbody.innerHTML = '';
    rows.forEach(row => tbody.appendChild(row));
}
}
