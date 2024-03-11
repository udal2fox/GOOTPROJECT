
// ----- css 파일 추가
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/company/employeeSupervisePage/searchEmployeePage.css';
// 2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.type = 'text/css';
linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
document.head.appendChild(linkEle);

let employee = document.querySelectorAll('.employee');
let sortDirection = {};

document.querySelectorAll('button').forEach( btn => {
	btn.addEventListener( 'click', (event) => {
		event.preventDefault(); 
		
		let type = btn.id;
		
		if( type === 'insertBtn') insert();
		else if ( type === 'execelBtn'){
			
		}
	})
})

function insert(){
	
	location.href = '/employee_insert';
}


//페이지 버튼 클릭 이벤트
document.querySelectorAll('tbody a').forEach(a => {
	a.addEventListener('click', function(e){
		e.preventDefault();
		
		let eno = a.getAttribute('href');
		
		location.href = '/employee_modify?eno=' + eno;
	});
});

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

document.querySelector('.searchBar').addEventListener('keypress', function(event) {
    if (event.key === 'Enter') { // 엔터 키 입력 확인
        const keyword = this.value.trim().toLowerCase(); // 검색어
        const tableRows = document.querySelectorAll('.employee');

        tableRows.forEach(row => {
            const name = row.cells[1].textContent.toLowerCase(); // 이름 열
            const email = row.cells[2].textContent.toLowerCase();
            const dname = row.cells[4].textContent.toLowerCase(); // 부서 이름 열
            
            if (name.includes(keyword) || dname.includes(keyword) || email.includes(keyword)) {
                row.style.display = 'table-row'; // 행 보이기
            } else {
                row.style.display = 'none'; // 행 숨기기
            }
        });
    }
});

document.querySelector('.dept-sb').addEventListener('change', function() {
    const selectedDept = this.value.toLowerCase(); // 선택된 부서 이름
    const tableRows = document.querySelectorAll('.employee');

    tableRows.forEach(row => {
        const dname = row.cells[4].textContent.toLowerCase(); // 부서 이름 열

        if (selectedDept === '전체' || dname === selectedDept) {
            row.style.display = 'table-row'; // 행 보이기
        } else {
            row.style.display = 'none'; // 행 숨기기
        }
    });
});

//페이지 버튼 클릭 이벤트
document.querySelectorAll(".page-nation li a").forEach( aEle => {
	aEle.addEventListener('click', function(e){
		e.preventDefault();
		
		let pageNum = this.getAttribute("href");
		let amount = 10;
		
		setStorageData(pageNum, amount);
		
		
		let sendData = 'pageNum=' + pageNum + '&amount=' + amount;
		location.href = '/searchEmployee?' + sendData;
	});
});
