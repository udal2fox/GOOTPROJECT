// *****************************직원 정보 가져오는 부분*****************************
// 직원 정보를 가져오고 화면에 표시하는 부분입니다.
const path = "/userAdminPage/manage_member/" + okja; // API 경로 설정

// API를 호출하고 데이터를 처리합니다.
fetch(path)
  .then((response) => response.json()) // JSON 파싱
  .then((data) => {
    showEmpList(data); // 데이터를 화면에 표시하는 함수 호출
  })
  .catch((err) => {
    console.error(err); // 오류 처리
  });

// 직원 목록을 표시하는 함수입니다.
function showEmpList(data) {
  let msg = ""; // HTML을 저장하는 변수
  let tbody = document.querySelector("#empList"); // HTML 테이블의 tbody 요소

  if (data.length === 0) {
    // 데이터가 비어있는 경우
    // 메시지 출력
    msg += '<tr class="text-center">';
    msg += '<td colspan="8">등록된 임직원이 없습니다.</td>';
    msg += "</tr>";
  } else {
    // 데이터가 있는 경우
    let n = 0;
    data.forEach((emp) => {
      // 각 직원의 정보를 반복해서 표시
      msg += '<tr class="text-center">';
      msg += '<td><input class="form-check-input" type="checkbox"></td>';
      msg += "<td>" + ++n + "</td>";
      msg += "<td>" + emp.cEmpName + "</td>";
      msg += "<td>" + emp.cEmpPosition + "</td>";
      msg += "<td>" + formatPhoneNumber(emp.cEmpTel) + "</td>"; // 전화번호 형식 변환
      msg += "<td>" + emp.cEmpEmail + "</td>";
      msg += "<td>" + formatTimestamp(emp.cEmpBirth) + "</td>"; // 날짜 형식 변환
      msg += "<td>" + emp.receiveGift + "</td>";
      msg += "</tr>";
    });
  }
  tbody.innerHTML = msg; // HTML 테이블의 tbody에 메시지 추가
}

// Unix 타임스탬프를 날짜 형식으로 변환하는 함수입니다.
function formatTimestamp(unixTimeStamp) {
  let myDate = new Date(unixTimeStamp);
  let year = myDate.getFullYear();
  let month = String(myDate.getMonth() + 1).padStart(2, "0");
  let day = String(myDate.getDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
}

// 전화번호 형식을 변환하는 함수입니다.
function formatPhoneNumber(num) {
  return num
    .replace(/[^0-9]/g, "") // 숫자 이외의 문자 제거
    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3"); // 특정 패턴에 맞게 변환
}

// 체크박스 전체선택 토글 함수 입니다.
function checkAll() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
  var checkAllCheckbox = checkboxes[0]; // 체크박스 전체 선택 체크박스
  var otherCheckboxes = Array.from(checkboxes).slice(1); // 체크박스 전체 선택을 제외한 나머지 체크박스

  // 체크박스 전체 선택 체크박스의 상태에 따라 나머지 체크박스 상태 변경
  otherCheckboxes.forEach(function (checkbox) {
    checkbox.checked = checkAllCheckbox.checked;
  });
}

// 직원 추가하기
let addEmpForm = document.querySelector("#addEmp");
let addBtn = document.querySelector("#addEmpBtn");
addBtn.addEventListener("click", () => {
  if (
    !addEmpForm.cEmpName.value ||
    !addEmpForm.cEmpPosition.value ||
    !addEmpForm.cEmpTel.value ||
    !addEmpForm.cEmpEmail.value ||
    !addEmpForm.cEmpBirth.value
  ) {
    swal("내용을 모두 입력해주세요.");
    return; // 모든 필드가 입력되지 않은 경우 함수 종료
  }

  // 직원 정보를 객체로 만듭니다.
  const formData = {
    sNo: okja,
    cEmpName: addEmpForm.cEmpName.value,
    cEmpPosition: addEmpForm.cEmpPosition.value,
    cEmpTel: addEmpForm.cEmpTel.value,
    cEmpEmail: addEmpForm.cEmpEmail.value,
    cEmpBirth: addEmpForm.cEmpBirth.value
  };

  // 서버로 POST 요청을 보냅니다.
  fetch("/userAdminPage/addEmp", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(formData)
  })
  .then((Response) => Response.text())
  .then((text) =>{
    if(text === 'success'){
      swal("직원이 추가되었습니다.");
      location.href = "/userAdminPage/manage_member";
    }else{
      swal("실패하였습니다. 창 종료 후 재시도 해주세요.")
    }
  })
  .catch(error => {
    console.error('There has been a problem with your fetch operation:', error);
  });
});
