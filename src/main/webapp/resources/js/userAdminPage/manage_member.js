// *****************************직원 정보 가져오는 부분*****************************

// API 경로를 설정합니다.
const path = "/userAdminPage/manage_member/" + okja;

// API를 호출하고 반환된 데이터를 처리합니다.
fetch(path)
  .then(response => response.json()) // JSON 형식으로 응답을 파싱합니다.
  .then(data => {
    showEmpList(data); // 데이터를 화면에 표시하는 함수를 호출합니다.
  })
  .catch(err => {
    console.error(err); // 오류가 발생한 경우 콘솔에 오류를 출력합니다.
  });

// 직원 목록을 표시하는 함수입니다.
function showEmpList(data) {
  let msg = ""; // 출력할 HTML을 저장하는 변수입니다.
  let tbody = document.querySelector("#empList"); // HTML 테이블의 tbody 요소를 찾습니다.

  if (data.length === 0) { // 반환된 데이터가 비어 있는지 확인합니다.
    // 비어 있는 경우, 메시지를 표시합니다.
    msg += '<tr class="text-center">';
    msg += '<td colspan="8">등록된 임직원이 없습니다.</td>';
    msg += "</tr>";
  } else {
    // 데이터가 있는 경우, 각 직원의 정보를 표시합니다.
    data.forEach(emp => {
      msg += '<tr class="text-center">';
      msg += '<td><input class="form-check-input" type="checkbox"></td>';
      msg += '<td>' + emp.cEepNo + '</td>'; 
      msg += '<td>' + emp.cEmpName + '</td>'; 
      msg += '<td>' + emp.cEmpPosition + '</td>'; 
      msg += '<td>' + emp.cEmpTel + '</td>'; 
      msg += '<td>' + emp.cEmpEmail + '</td>'; 
      msg += '<td>' + formatTimestamp(emp.cEmpBirth) + '</td>'; 
      msg += '<td>' + emp.receiveGift + '</td>'; 
      msg += "</tr>";
    });
  }
  // HTML 테이블의 tbody에 메시지를 추가합니다.
  tbody.innerHTML = msg;
}

// Unix 타임스탬프를 날짜 형식으로 변환하는 함수입니다.
function formatTimestamp(unixTimeStamp) {
  let myDate = new Date(unixTimeStamp);
  let year = myDate.getFullYear();
  let month = String(myDate.getMonth() + 1).padStart(2, "0");
  let day = String(myDate.getDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
}
