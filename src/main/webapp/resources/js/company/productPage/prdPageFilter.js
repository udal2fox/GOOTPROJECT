(function () {
    // 전역 변수 설정
    const amount = 10; // 페이지당 보여줄 아이템 수
    let pageNum = 1; // 현재 페이지 번호
    let products = document.querySelectorAll('.product'); // 전체 상품 리스트

    // 필터링 및 페이징 처리 함수
    function filterAndPaginate() {
        // 페이지네이션을 그리는 함수
        function drawPagination(startPage, endPage) {
            const paginationElement = document.getElementById('pagination');
            paginationElement.innerHTML = ''; // 이전에 있던 페이지네이션 내용을 초기화합니다.

            const ul = document.createElement('ul');
            ul.classList.add('page-nation');

            for (let num = startPage; num <= endPage; num++) {
                const li = document.createElement('li');
                const a = document.createElement('a');
                a.href = '#'; // 페이지 번호 클릭 시 페이지 이동 방지
                a.innerText = num;
                a.addEventListener('click', () => goToPage(num)); // 페이지 번호 클릭 시 goToPage 함수 호출
                li.appendChild(a);
                ul.appendChild(li);
            }

            paginationElement.appendChild(ul);
        }

        // 페이지 이동 함수
        function goToPage(page) {
            pageNum = page;

            // 각 페이지당 보여줄 상품의 시작 인덱스와 끝 인덱스 계산
            const startIndex = (pageNum - 1) * amount;
            const endIndex = pageNum * amount;

            // 필터링된 상품 리스트 가져오기
            let filteredProducts = getFilteredProducts();

            // 현재 페이지에 보여줄 상품만 보이도록 설정
            filteredProducts.forEach((product, index) => {
                if (index >= startIndex && index < endIndex) {
                    product.style.display = 'table-row'; // startIndex부터 endIndex 이전까지만 표시
                } else {
                    product.style.display = 'none';
                }
            });
        }

        // 상품 필터링 함수
        function filterProducts() {
            // 선택된 상품 종류 필터 및 상태 필터 가져오기
            let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="product-type"]:checked')).map(function (checkbox) {
                return checkbox.value;
            });
            let statusFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="product-status"]:checked')).map(function (checkbox) {
                return checkbox.value;
            });

            // 각 상품을 순회하면서 필터링 적용
            products.forEach(function (product) {
                let type = product.getAttribute('data-type');
                let status = product.getAttribute('data-status');

                // 상품 종류 및 상태가 필터에 포함되는 경우 보여주기, 그렇지 않은 경우 숨기기
                if ((typeFilters.length === 0 || typeFilters.includes(type)) && (statusFilters.length === 0 || statusFilters.includes(status))) {
                    product.style.display = 'table-row'; // 테이블의 경우 display를 'table-row'로 설정
                } else {
                    product.style.display = 'none';
                }
            });

            // 필터링된 상품 개수를 기반으로 페이지네이션 다시 그리기
            drawPagination(1, Math.ceil(getFilteredProducts().length / amount));
        }

        // allCheck 체크박스 이벤트 리스너 등록
        document.getElementById('product-typeAll').addEventListener('change', function () {
            // allCheck 체크박스 상태에 따라 상품 종류 체크박스 상태 변경
            let isChecked = this.checked;
            document.querySelectorAll('.filter-checkbox[data-filter="product-type"]').forEach(function (checkbox) {
                checkbox.checked = isChecked;
            });

            // 필터링 적용
            filterProducts();
            
        });

        // allListCheck 체크박스 이벤트 리스너 등록
        document.getElementById('product-statusAll').addEventListener('change', function () {
            // allListCheck 체크박스 상태에 따라 상품 상태 체크박스 상태 변경
            let isChecked = this.checked;
            document.querySelectorAll('.filter-checkbox[data-filter="product-status"]').forEach(function (checkbox) {
                checkbox.checked = isChecked;
            });
            // 필터링 적용
            filterProducts();
        });

        // 체크박스가 변경될 때 필터링 함수를 호출하는 이벤트 리스너 등록
        document.querySelectorAll('.filter-checkbox').forEach(function (checkbox) {
            checkbox.addEventListener('change', function () {
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

        // 상품 종류 체크박스 모두 선택 여부 확인 함수
        function isAllTypeCheckboxesChecked() {
            // 상품 종류 체크박스 중 선택된 개수 확인
            const checkedCount = document.querySelectorAll('.filter-checkbox[data-filter="product-type"]:checked').length;
            // 상품 종류 체크박스 개수만큼 모두 선택된 경우 true 반환
            return checkedCount === document.querySelectorAll('.filter-checkbox[data-filter="product-type"]').length;
        }

        // 상품 상태 체크박스 모두 선택 여부 확인 함수
        function isAllStatusCheckboxesChecked() {
            // 상품 상태 체크박스 중 선택된 개수 확인
            const checkedCount = document.querySelectorAll('.filter-checkbox[data-filter="product-status"]:checked').length;
            // 상품 상태 체크박스 개수만큼 모두 선택된 경우 true 반환
            return checkedCount === document.querySelectorAll('.filter-checkbox[data-filter="product-status"]').length;
        }

        // 필터링된 상품 리스트 가져오기
        function getFilteredProducts() {
            let typeFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="product-type"]:checked')).map(function (checkbox) {
                return checkbox.value;
            });
            let statusFilters = Array.from(document.querySelectorAll('.filter-checkbox[data-filter="product-status"]:checked')).map(function (checkbox) {
                return checkbox.value;
            });

            return Array.from(products).filter(function (product) {
                let type = product.getAttribute('data-type');
                let status = product.getAttribute('data-status');
                return (typeFilters.length === 0 || typeFilters.includes(type)) && (statusFilters.length === 0 || statusFilters.includes(status));
            });
        }

        // 초기 페이지 설정
        drawPagination(1, Math.ceil(products.length / amount));
        goToPage(1);
    }

    // 필터링 및 페이징 처리 함수 호출
    filterAndPaginate();
})();



// 초기 정렬 방식은 오름차순으로 설정
let sortDir = {};

// 정렬 버튼 이벤트 리스너 등록
document.querySelectorAll('.sort-btn').forEach(button => {
    button.addEventListener('click', () => {
        const column = button.dataset.column;
        sortDir[column] = !sortDir[column]; // 정렬 방향을 변경

        // 정렬 방향에 따라 버튼 모양 변경
        button.innerText = sortDir[column] ? '🔽' : '🔼';
        sortTable(column);
    });
});

// 테이블을 정렬하는 함수
function sortTable(column) {
    const tbody = document.querySelector('.table tbody');
    const rows = Array.from(tbody.querySelectorAll('tr'));

    rows.sort((a, b) => {
        const aValue = getCellValue(a, column);
        const bValue = getCellValue(b, column);
        if (sortDir[column]) {
            return aValue.localeCompare(bValue);
        } else {
            return bValue.localeCompare(aValue);
        }
    });

    tbody.innerHTML = '';
    rows.forEach(row => tbody.appendChild(row));
}

// 셀의 값을 가져오는 함수
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

// 리셋 버튼 이벤트 리스너 등록
document.querySelector('#reset').addEventListener('click', function () {
    location.reload();
});
