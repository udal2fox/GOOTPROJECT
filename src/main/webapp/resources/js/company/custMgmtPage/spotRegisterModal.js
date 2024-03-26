// 전역 변수 공간
let amount = 10; // 페이지당 보여줄 아이템 수
let pageNum = 1; // 현재 페이지 번호
let totalPages; // 총 페이지 수
	

/** --------------------기업 연결 모달창 시작------ */

var takeComNameModal = document.getElementById('takeComName_modal');
var openTakeComNameModalBtn = document.getElementById('open_takeComName_modal');
var closeTakeComNameoModalBtn = document.getElementById('close_takeComName_modal');


/**기업 연결 모달창 열기 */ 
openTakeComNameModalBtn.onclick = function() {
	takeComNameModal.style.display = 'block';
}

/**기업 연결 모달창 닫기 */ 
closeTakeComNameoModalBtn.onclick = function() {
	takeComNameModal.style.display = 'none';
}

/**기업 연결 모달창 닫기 (딴 곳 누를 시)*/ 
window.onclick = function(event) {
  if (event.target === takeComNameModal) {
	  takeComNameModal.style.display = 'none';
  }
}

//기업명 찾기 및 기업명 변경(모달창)
document.getElementById("imgBtnSearchComName").addEventListener('click', function() {
	//기업명 찾기 검색란 값 비우기
	document.querySelector('input[name="comName"]').value = ''
    // 모달 창 열기
    let modal = document.getElementById('open_takeComName_modal');
    modal.style.display = "block";
    
    // 기업명 리스트 가져오기
    fetch('/takeComNameList')
    .then(response => response.json())
    .then(json => {
      //  console.log("계약 완료된 기업 리스트 불러오기: ", json); 
        
        let msg = '';
        if (json.length > 0) {
            json.forEach(item => {
                msg += `
                    <tr class="list">
                        <td><a href="#" class="companyLink" data-company="${item.comName}" date-companyNo="${item.companyNo}">${item.comName}</a></td>
                    </tr>
                `;
            });
        } else {
            msg = `
                <tr>
                    <td>기업이 없습니다.</td>
                </tr>
            `;
        }
        
        const tableBody = document.querySelector('#takeComName_tbl tbody');
        tableBody.innerHTML = msg;

        changeComName();
    })
    .catch(error => console.error('Error:', error));
});


//기업명 찾기(모달창)에서 기업명 검색 기능 
document.getElementById("searchTakeComNameBtn").addEventListener('click', function() {

    let comName = document.querySelector('input[name="searchComName"]').value;
    console.log("하이"+comName);
    let jsonData = JSON.stringify({ comName: comName });
    
    fetch('/searchTakeComName', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: jsonData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Failed to search company');
        }
        return response.json();
    })
    .then(json => {
    	
    	console.log(json);
 
        let msg = '';
        if (json.length > 0) {
        	json.forEach(item => {
                msg += `
                    <tr class="list">
                        <td><a href="#" class="companyLink" data-company="${item.comName}" date-companyNo="${item.companyNo}>${item.comName}</a></td>
                    </tr>
                `;
            });
        } else {
            msg = `
                <tr>
                    <td>기업이 없습니다.</td>
                </tr>
            `;
        }
        
        // HTML을 원하는 위치에 추가 또는 변경
        const tableBody = document.querySelector('#takeComName_tbl tbody');
        tableBody.innerHTML = msg;

        changeComName();
    })
    .catch(error => console.error('Error:', error));
});


//기업명 변경하기
function changeComName() {
    document.querySelectorAll('.companyLink').forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            let result = confirm("기업명을 선택하시겠습니까?");
            if (result) {
                // 선택한 기업명과 관리 번호 가져오기
                let selectedCompanyName = this.dataset.company;
                let selectedCompanyNo = this.dataset.companyNo;
                // 가져온 정보를 원하는 곳에 적용
                document.querySelector('input[name="comName"]').value = selectedCompanyName;
                document.querySelector('input[name="companyNo"]').value = selectedCompanyNo;
            }
            document.querySelector('input[name="searchComName"]').value = ''; 
            takeComNameModal.style.display = 'none'; 
        });
    });
}




/** --------------------기업 연결 모달창 */


function goToPage(page) {
    pageNum = page;

    // 페이지 버튼 활성화
    const paginationElement = document.getElementById('pagination');
    const pageButtons = paginationElement.querySelectorAll('a');
    pageButtons.forEach((button, index) => {
        if (index === pageNum) {
            button.classList.add('active');
        } else {
            button.classList.remove('active');
        }
    });

    // 현재 페이지에 해당하는 아이템만 보이도록 설정
    const productList = document.querySelectorAll('.list_div_tbl_modal tbody tr');
    const startIndex = (pageNum - 1) * amount;
    const endIndex = pageNum * amount;

    productList.forEach((product, index) => {
        if (index >= startIndex && index < endIndex) {
            product.style.display = 'table-row';
        } else {
            product.style.display = 'none';
        }
    });
}

// 페이징 버튼 바인딩 함수
function drawPagination() {
    const paginationElement = document.getElementById('pagination');
    paginationElement.innerHTML = ''; // 페이지네이션 초기화

    const ul = document.createElement('ul');
    ul.classList.add('page-nation');

    // 이전 페이지 버튼
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

    // 페이지 번호 버튼
    for (let num = 1; num <= totalPages; num++) {
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

    // 다음 페이지 버튼
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

// 초기 페이지네이션 그리기
// 페이지 수 계산
const totalItems = document.querySelectorAll('.list_div_tbl_modal tbody tr').length;
totalPages = Math.ceil(totalItems / amount);
drawPagination();
goToPage(1);




/** --------------------담당자명 가져오기 모달창 시작------ */

var takeCsNameModal = document.getElementById('takeCsName_modal');
var openTakeCsNameModalBtn = document.getElementById('open_takeCsName_modal');
var closeTakeCsNameModalBtn = document.getElementById('close_takeCsName_modal');


/**기업 연결 모달창 열기 */ 
openTakeCsNameModalBtn.onclick = function() {
	takeCsNameModal.style.display = 'block';
}

/**기업 연결 모달창 닫기 */ 
closeTakeCsNameModalBtn.onclick = function() {
	takeCsNameModal.style.display = 'none';
}

/**기업 연결 모달창 닫기 (딴 곳 누를 시)*/ 
window.onclick = function(event) {
  if (event.target === takeCsNameModal) {
	  takeCsNameModal.style.display = 'none';
  }
}

//담당자명 가져오기(모달창)
document.getElementById("imgBtnTakeCsName").addEventListener('click', function() {
	//기업명 찾기 검색란 값 비우기
	document.querySelector('input[name="searchTakeCsName"]').value = ''
    // 모달 창 열기
    let modal = document.getElementById('open_takeCsName_modal');
    modal.style.display = "block";
    
    // 담당자명 리스트 가져오기
    fetch('/takeCsNameList')
    .then(response => response.json())
    .then(json => {
       // console.log("계약 완료된 기업 리스트 불러오기: ", json); 
        
        let msg = '';
        if (json.length > 0) {
            json.forEach(item => {
                msg += `
                    <tr class="list">
                        <td><a href="#" class="csNameLink" data-csName="${item.csName}" data-email="${item.csEmail}">${item.csName}</a></td>
                        <td>${item.csCompanyName}</td>
                    </tr>
                `;
            });
        } else {
            msg = `
                <tr>
                    <td>등록 할 담당자가 없습니다.</td>
                </tr>
            `;
        }
        
        const tableBody = document.querySelector('#takeCsName_tbl tbody');
        tableBody.innerHTML = msg;

        changeCsName();
    })
    .catch(error => console.error('Error:', error));
});


//기업명 찾기(모달창)에서 기업명 검색 기능 
document.getElementById("searchTakeCsNameBtn").addEventListener('click', function() {

    let csName = document.querySelector('input[name="searchTakeCsName"]').value;
    console.log("하이"+csName);
    let jsonData = JSON.stringify({ csName: csName });
    
    fetch('/searchTakeCsName', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: jsonData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Failed to search company');
        }
        return response.json();
    })
    .then(json => {
    	
    	console.log(json);
 
        let msg = '';
        if (json.length > 0) {
        	json.forEach(item => {
                msg += `
                    <tr class="list">
                      <td><a href="#" class="csNameLink" data-csName="${item.csName}" data-email="${item.csEmail}">${item.csName}</a></td>
                	 <td>${item.csCompanyName}</td>
                        
                    </tr>
                `;
            });
        } else {
            msg = `
                <tr>
                    <td>찾으시는 담당자명이 없습니다.</td>
                </tr>
            `;
        }
        
        // HTML을 원하는 위치에 추가 또는 변경
        const tableBody = document.querySelector('#takeCsName_tbl tbody');
        tableBody.innerHTML = msg;

        changeCsName();
    })
    .catch(error => console.error('Error:', error));
});


//담당자명 변경하기
function changeCsName(){

    document.querySelectorAll('.csNameLink').forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            let result = confirm("담당자명을 선택하시겠습니까?");
            if(result){
                // 선택한 기업명을 가져와서 comName input 요소에 할당
                let selectedCsName = this.dataset.company;
                let selectedUserEmail = this.dataset.email;
                document.querySelector('input[name="csName"]').value = selectedCsName;
                document.querySelector('input[name="userEmail"]').value = selectedUserEmail;
            }
            document.querySelector('input[name="searchComName"]').value = ''; 
            takeCsNameModal.style.display = 'none'; 
        });
    });
	
	
};


