/** --------------------기업명 찾기 모달창 시작------ */

var searchCompanyModal = document.getElementById('searchCompany_modal');
var openSearchCompanyModalBtn = document.getElementById('open_searchCompany_modal');
var closeSearchCompanyModalBtn = document.getElementById('close_searchCompany_modal');

//기업명 찾기 모달창 열기 
openSearchCompanyModalBtn.onclick = function() {
	searchCompanyModal.style.display = 'block';
	}

//기업명 찾기 모달창 닫기 
closeSearchCompanyModalBtn.onclick = function() {
	searchCompanyModal.style.display = 'none';
}

//기업명 찾기 모달창 닫기 (딴 곳 누를 시)
window.onclick = function(event) {
  if (event.target === searchCompanyModal) {
	  searchCompanyModal.style.display = 'none';
  }
}


//기업명 찾기 모달창 열기 버튼 이벤트리스너
document.getElementById("imgBtnSearchComName").addEventListener('click', function() {
    // 모달 창 열기
    var modal = document.getElementById('open_searchCompany_modal');
    modal.style.display = "block";
    
    alert("기업명 찾기 모달창!");
    
    // 기업명 리스트 가져오기
    fetch('/searchModal') 
    .then(response => response.json())
    .then(json => {
        console.log("계약 완료된 기업 리스트 불러오기: ", json);
        
        let msg = '';
        json.forEach(item => {
            msg += `
                <tr class="list">
                    <td>${item.csCompanyName}</td>
                </tr>
            `;
        });

        const tableBody = document.querySelector('#searchCompanyModal_tbl tbody');
        tableBody.innerHTML = msg;
    })
    .catch(error => console.error('Error:', error));
});




/** --------------------기업명 찾기 모달창 끝------ */