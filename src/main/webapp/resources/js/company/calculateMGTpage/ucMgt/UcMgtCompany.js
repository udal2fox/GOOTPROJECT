	let sortDirection = {}; // 정렬
	//------------
	
	totalUc();

	function totalUc() {
	    let data = [];
	    let uctable = document.querySelectorAll('.saleStatsTableInfo tr');

	    uctable.forEach(function (uc, index) {
	        if (index !== 0) {
	            let tdList = uc.querySelectorAll('td');
	            let recNo = parseInt(tdList[4].textContent.trim().replace(/[^0-9]/g, ''));
	            data.push(recNo);
	        }
	    });
	    console.log(data);

	    let total = data.reduce((acc, curr) => acc + curr, 0);
	    console.log("총합: ", total);

	    // 총합을 천 단위로 변환하여 출력
	    let formattedTotal = formatToThousand(total);
	    console.log("총합(천 단위): ", formattedTotal);

	    let ucTotal = document.querySelector('.misuTotal').innerHTML = '총 미수 금액 : ' + formattedTotal+'원';
	};

	// 천 단위로 변환하는 함수
	function formatToThousand(num) {
	    return num.toLocaleString('ko-KR');
	}

	
		
		// 소트 버튼에 클릭 이벤트를 추가하여 정렬 기능을 구현
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
		        "recSum": 5,
		    } [column];
		
		    const cell = row.querySelector(`td:nth-child(${columnIndex + 1})`);
		    return cell ? cell.textContent.trim() : "";
		}
		
		function sortTable(column) {
		    const tbody = document.querySelector('.saleStatsTableInfo tbody');
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

		

	
	




	
	
	