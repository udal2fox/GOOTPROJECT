	let sortDirection = {}; // 정렬

	
	totalUc();

	function totalUc() {
	    let data = [];
	    let uctable = document.querySelectorAll('.saleStatsTableInfo tr');

	    uctable.forEach(function (uc, index) {
	        if (index !== 0) {
	            let tdList = uc.querySelectorAll('td');
	            let recNo = parseInt(tdList[5].textContent.trim().replace(/[^0-9]/g, ''));
	            data.push(recNo);
	        }
	    });
	    console.log(data);

	    let total = data.reduce((acc, curr) => acc + curr, 0);
	    console.log("총합: ", total);

	    // 총합을 천 단위로 변환하여 출력
	    let formattedTotal = formatToThousand(total);
	    console.log("총합(천 단위): ", formattedTotal);

	    let ucTotal = document.querySelector('.misuTotal').innerHTML = '총 미수 금액 : ' + formattedTotal +'원';
	};

	// 천 단위로 변환하는 함수
	function formatToThousand(num) {
	    return num.toLocaleString('ko-KR');
	}
	
	
		document.querySelector('.ucMailSend').addEventListener('click', function() {
			if(deptNo != 0 && deptNo != 2)
			{
				alert("불허된 접근입니다.")
				return;
			}
			
			let checkedDataList = [];

			let checkboxes = document.getElementsByName('checkboxTd');
			checkboxes.forEach(function(checkbox) {
			    if (checkbox.checked) {
			        let row = checkbox.closest('tr');
			        let tdList = row.querySelectorAll('td');
			        let email = row.getAttribute('com-Email'); // com-Email 속성값 가져오기
			        
			        let pdv = {
			            comName: tdList[2].textContent.trim(),
			            email: email, // 
			            recSum : tdList[5].textContent.trim()
			        };

			        checkedDataList.push(pdv);
			    }
			});
		    
			console.log(checkedDataList);
		    fetch('/ucComMailSend', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
				},
				body: JSON.stringify(checkedDataList),
			})
		    .then(response => response.text())
		    .then(text =>
		    {
		    	console.log(text)
		    	if(text == 'Success'){
					alert("메일 전송 성공");
					location.reload();
				}
				else alert("메일 전송 실패"); 
		    })
		    .catch(error => 
		    {
		        console.error('Error:', error);
		    });
		    
		});
	
		
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

		

	
	




	
	
	