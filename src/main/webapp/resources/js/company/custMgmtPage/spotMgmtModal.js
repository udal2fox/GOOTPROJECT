

/** --------------------직원 리스트 모달창 시작------ */

var empListModal = document.getElementById('empList_modal');
var openEmpListModalBtn = document.getElementById('open_empList_modal');
var closeEmpListModalBtn = document.getElementById('close_empList_modal');

/**직원 리스트 모달창 열기 */ 
openEmpListModalBtn.onclick = function() {
	  empListModal.style.display = 'block';
	}

/**직원 리스트 모달창 닫기 */ 
closeEmpListModalBtn.onclick = function() {
	empListModal.style.display = 'none';
}

/**직원 리스트 모달창 닫기 (딴 곳 누를 시)*/ 
window.onclick = function(event) {
  if (event.target === empListModal) {
	  empListModal.style.display = 'none';
  }
}

/** --------------------직원 리스트 모달창 끝------ */




/** --------------------지점-직원 정보 수정 모달창 시작------ */

var empInpoModal = document.getElementById('empInpo_modal');
var openEmpInpoModalBtn = document.getElementById('open_empInpo_modal');
var closeEmpInpoModalBtn = document.getElementById('close_empInpo_modal');

/**지점-직원 정보 수정 모달창 열기 */ 
openEmpInpoModalBtn.onclick = function() {
	empInpoModal.style.display = 'block';
}

/**지점-직원 정보 수정 모달창 닫기 */ 
closeEmpInpoModalBtn.onclick = function() {
	empInpoModal.style.display = 'none';
}

/**지점-직원 정보 수정 모달창 닫기 (딴 곳 누를 시)*/ 
window.onclick = function(event) {
  if (event.target === empInpoModal) {
	  empInpoModal.style.display = 'none';
  }
}
/** --------------------지점-직원 정보 수정 모달창 끝------ */



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
/** --------------------담당자 정보 수정 모달창 끝------ */