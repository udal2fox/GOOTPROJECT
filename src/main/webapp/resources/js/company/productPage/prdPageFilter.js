/* 즉시 실행 함수 
   (fuction(){
   	
   })();
*/	
	
/*filter();

document.querySelectorAll("input[type='checkbox']").forEach(function(e){
	e.addEventListener('change',()=>{
		filter();
	});
});*/


(function filter() {
    // allCheck 체크박스 이벤트 리스너 등록
    document.getElementById('product-typeAll').addEventListener('change', function() {
        // allCheck 체크박스 상태에 따라 상품 종류 체크박스 상태 변경
        let isChecked = this.checked;
        document.querySelectorAll('.filter-checkbox[data-filter="product-type"]').forEach(function(checkbox) {
            console.log(checkbox);
        	checkbox.checked = isChecked;
        });

        // 필터링 적용
        filterProducts();
    });

    // allListCheck 체크박스 이벤트 리스너 등록
    document.getElementById('product-statusAll').addEventListener('change', function() {
        // allListCheck 체크박스 상태에 따라 상품 상태 체크박스 상태 변경
        let isChecked = this.checked;
        document.querySelectorAll('.filter-checkbox[data-filter="product-status"]').forEach(function(checkbox) {
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
            document.getElementById('product-typeAll').checked = isTypeAllChecked;

            // allListCheck 체크박스 상태 업데이트
            let isStatusAllChecked = isAllStatusCheckboxesChecked();
            document.getElementById('product-statusAll').checked = isStatusAllChecked;

            // 필터링 적용
            filterProducts();
        });
    });

    // 상품 필터링 함수
    function filterProducts() {
        // 선택된 상품 종류 필터 및 상태 필터 가져오기
        let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="product-type"]:checked')).map(function(checkbox) {
            return checkbox.value;
        });
        let statusFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="product-status"]:checked')).map(function(checkbox) {
            return checkbox.value;
        });
        
        // 아래 방식을 .map() 써써 줄인것 forEach 써도 무방
        
//        // 상품 종류 필터링
//        let typeFilters = [];
//        let typeCheckboxes = document.querySelectorAll('.filter-checkbox[data-filter="product-type"]:checked');
//
//        for (let i = 0; i < typeCheckboxes.length; i++) {
//            typeFilters.push(typeCheckboxes[i].value);
//        }
//
//        // 상품 상태 필터링
//        let statusFilters = [];
//        let statusCheckboxes = document.querySelectorAll('.filter-checkbox[data-filter="product-status"]:checked');
//
//        for (let i = 0; i < statusCheckboxes.length; i++) {
//            statusFilters.push(statusCheckboxes[i].value);
//        }
        
        

        // 전체 체크 상태 확인
        let isAllTypeChecked = document.getElementById('product-typeAll').checked;
        let isAllStatusChecked = document.getElementById('product-statusAll').checked;

        // 모든 상품분류 체크박스가 해제되었을 때 조회되지 않도록 처리
        if (!isAllTypeChecked && typeFilters.length === 0) {
            // 모든 상품 숨기기
            document.querySelectorAll('.product').forEach(function(product) {
                product.style.display = 'none';
            });
            
            return;
        }

        // 모든 상품상태 체크박스가 해제되었을 때 조회되지 않도록 처리
        if (!isAllStatusChecked && statusFilters.length === 0) {
            // 모든 상품 숨기기
            document.querySelectorAll('.product').forEach(function(product) {
                product.style.display = 'none';
            });
            
            return;
        }

        // 각 상품을 순회하면서 필터링 적용
        document.querySelectorAll('.product').forEach(function(product) {
            let type = product.getAttribute('data-type');
            let status = product.getAttribute('data-status');

            // 상품 종류 및 상태가 필터에 포함되는 경우 보여주기, 그렇지 않은 경우 숨기기
            if ((typeFilters.length === 0 || typeFilters.includes(type)) && (statusFilters.length === 0 || statusFilters.includes(status))) 
            {
                product.style.display = 'table-row'; // 테이블의 경우 display를 'table-row'로 설정
            } 
            else 
            {
                product.style.display = 'none';
            }
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

    // 상품 상태 체크박스 모두 선택 여부 확인 함수
    function isAllStatusCheckboxesChecked() 
    {
        // 상품 상태 체크박스 중 선택된 개수 확인
        const checkedCount = document.querySelectorAll('.filter-checkbox[data-filter="product-status"]:checked').length;
        // 상품 상태 체크박스 개수만큼 모두 선택된 경우 true 반환
        return checkedCount === document.querySelectorAll('.filter-checkbox[data-filter="product-status"]').length;
    }
})();


//페이징

// 이거는 나중에 공통영역으로 뺄예정
function setStorageData(pageNum, amount)
{
	const pageData = {
			pageNum : pageNum,
			amount : amount
	};
	localStorage.setItem('page_data' , JSON.stringify(pageData));
}
function getStorageData()
{
	return JSON.parse(localStorage.getItem('page_data'));
}


document.querySelectorAll(".page-nation li a").forEach(aEle => {
	aEle.addEventListener('click',function(e){
		e.preventDefault();
		let pageNum = this.getAttribute("href");
		let amount = 10;
		
		// 웹 콘솔창 -> 어플리케이션 -> 로컬 스토리지에 제이슨데이터 저장된다.
		setStorageData(pageNum, amount);
		
		let sendData ='pageNum='+pageNum+'&amount='+amount;
		location.href = "/moveProductPage?"+sendData;
	})
});

// 리셋 그냥 새로고침''
document.querySelector('#reset').addEventListener('click', function() {
	location.reload();
});

////테이블 뒤집기... 
//document.querySelector('#upDown').addEventListener('click', function() {
//	
//	console.log("dd");
//	const trArr = document.querySelectorAll(".table tbody tr");
//	const tbody = document.querySelector(".table tbody")
//	tbody.innerHTML = "";
//	
//	const reversedTrArr = Array.from(trArr).reverse(); // 
//
//	reversedTrArr.forEach((el) => {
//	    tbody.appendChild(el); // 
//	});
//});

//-------------------------------------------------------
// 초기 정렬 방식은 오름차순으로 설정
// 초기 정렬 방식을 저장하는 객체
let sortDir = {};


document.querySelectorAll('.sort-btn').forEach(button => {
    button.addEventListener('click', () => {
        const column = button.dataset.column;
        sortDir[column] = !sortDir[column]; // 정렬 방향을 변경

        // 정렬 방향에 따라 버튼 모양 변경
        button.innerText = sortDir[column] ? '🔽' : '🔼';
        sortTable(column);
    });
});

//// 테이블을 정렬하는 함수 테이블 내용이 value 가 있는경우
//function sortTable(column) {
//    const tbody = document.querySelector('.table tbody');
//    const rows = Array.from(tbody.querySelectorAll('tr'));
//
//    // 정렬 방식에 따라 정렬
//    rows.sort((a, b) => {
//        const aValue = a.querySelector(`[name="${column}"]`).value;
//        const bValue = b.querySelector(`[name="${column}"]`).value;
//        if (sortDirection[column]) {
//            return aValue.localeCompare(bValue);
//        } else {
//            return bValue.localeCompare(aValue);
//        }
//    });
//
//    // 정렬된 행을 테이블에 적용
//    tbody.innerHTML = '';
//    rows.forEach(row => tbody.appendChild(row));
//}


function getCellValue(row, column) {
    const columnIndex = {
        "supsCo": 0,
        "prdNo": 1,
        "prdSdc": 2,
        "prdMajorCtg": 3,
        "prdSubCtg": 4,
        "prdName": 5,
        "prdCstPri": 6,
        "prdSal": 7,
        "prdMargin": 8
    }[column];

    const cell = row.querySelector(`td:nth-child(${columnIndex + 1})`);
    return cell ? cell.textContent.trim() : "";
}

function sortTable(column) {
    const tbody = document.querySelector('.table tbody');
    const rows = Array.from(tbody.querySelectorAll('tr'));

    rows.sort((a, b) => {
    	console.log("a=" + a);
    	// a = row
        const aValue = getCellValue(a, column);
        // b = row
        const bValue = getCellValue(b, column);
        if (sortDir[column])
        {
            return aValue.localeCompare(bValue);
        } 
        else
        {
            return bValue.localeCompare(aValue);
        }
    });

    tbody.innerHTML = '';
    rows.forEach(row => tbody.appendChild(row));
}










	









