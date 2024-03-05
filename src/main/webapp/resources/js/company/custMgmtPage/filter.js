filter();

function filter() {
	
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

        // 전체 체크 상태 확인
        let isAllTypeChecked = document.getElementById('product-typeAll').checked;
        let isAllStatusChecked = document.getElementById('product-statusAll').checked;

        // 모든 상품분류 체크박스가 해제되었을 때 조회되지 않도록 처리
        if (!isAllTypeChecked && typeFilters.length === 0) {
            // 모든 상품 숨기기
            document.querySelectorAll('.product').forEach(function(product) {
                product.style.display = 'none';
            });
            // 처리가 골치아파서 체크 꺼지면 리무브 해버림;
            removePagination();
            return;
        }

        // 모든 상품상태 체크박스가 해제되었을 때 조회되지 않도록 처리
        if (!isAllStatusChecked && statusFilters.length === 0) {
            // 모든 상품 숨기기
            document.querySelectorAll('.product').forEach(function(product) {
                product.style.display = 'none';
            });
            // 여기서 필터값 가져오고 페이징 다시그리기ㅈ
            removePagination();
            return;
        }

        // 각 상품을 순회하면서 필터링 적용
        document.querySelectorAll('.product').forEach(function(product) {
            let type = product.getAttribute('data-type');
            let status = product.getAttribute('data-status');

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

    // 상품 상태 체크박스 모두 선택 여부 확인 함수
    function isAllStatusCheckboxesChecked() 
    {
        // 상품 상태 체크박스 중 선택된 개수 확인
        const checkedCount = document.querySelectorAll('.filter-checkbox[data-filter="product-status"]:checked').length;
        // 상품 상태 체크박스 개수만큼 모두 선택된 경우 true 반환
        return checkedCount === document.querySelectorAll('.filter-checkbox[data-filter="product-status"]').length;
    }
};

// 필터 끝
