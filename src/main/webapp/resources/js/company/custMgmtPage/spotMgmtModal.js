
/** --------------------담당자 정보 수정 모달창 시작------ */

var managerInpoModal = document.getElementById('managerInpo_modal');
var openManagerInpoModalBtn = document.getElementById('open_managerInpo_modal');
var closeManagerInpoModalBtn = document.getElementById('close_managerInpo_modal');


/**지점-직원 정보 수정 모달창 열기 */ 
openManagerInpoModalBtn.onclick = function() {
	managerInpoModal.style.display = 'block';
}

/**지점-직원 정보 수정 모달창 닫기 */ 
closeManagerInpoModalBtn.onclick = function() {
	managerInpoModal.style.display = 'none';
}

/**지점-직원 정보 수정 모달창 닫기 (딴 곳 누를 시)*/ 
window.onclick = function(event) {
  if (event.target === managerInpoModal) {
	  managerInpoModal.style.display = 'none';
  }
}





//담당자 정보 가져오기
document.getElementById("open_managerInpo_modal").addEventListener('click', function() {
    
    // 모달 열기
    let modal = document.getElementById('managerInpo_modal');
    modal.style.display = "block";

    // 클릭된 링크의 href 속성에서 spotNo 값을 가져옴
    let spotNo = this.getAttribute("data-spot-no");
    
    console.log(spotNo);

    // fetch 요청 보내기
    fetch('/getManagerInfo', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ spotNo: spotNo })
    })
    .then(response => response.json())
    .then(json => {
    	
    	console.log(json);
        let msg = '';
        if (json) {
            msg = `
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="managerName" value="${json.userName}"></td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td><input type="text" name="contact" value="${json.userContact}"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email" value="${json.userEmail}"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="text" name="password" value="${json.userPw}"></td>
                </tr>
            `;
        }
    
        const tableBody = document.querySelector('#managerInpo_tbl tbody');
        tableBody.innerHTML = msg;
    })
    .catch(error => console.error('Error:', error));
});




/** --------------------담당자 정보 수정 모달창 끝------ */




