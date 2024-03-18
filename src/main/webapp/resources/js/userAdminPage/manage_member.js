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
      msg +=
        '<td><input class="form-check-input" type="checkbox" name="empCheck"></td>';
      msg += '<td data-code="' + emp.cEmpNo + '">' + ++n + "</td>";
      msg += "<td>" + emp.cEmpName + "</td>";
      msg += "<td>" + emp.cEmpPosition + "</td>";
      msg += "<td>" + formatPhoneNumber(emp.cEmpTel) + "</td>"; // 전화번호 형식 변환
      msg += "<td>" + emp.cEmpEmail + "</td>";
      msg += "<td>" + formatTimestamp(emp.cEmpBirth) + "</td>"; // 날짜 형식 변환
      msg += "<td>" + formatReceiveGift(emp.receiveGift) + "</td>";
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

// 선물 수령여부 형식을 변환하는 함수입니다.
function formatReceiveGift(data) {
  return data ? "O" : "X";
}

// *****************************직원 추가*****************************
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
    cEmpBirth: addEmpForm.cEmpBirth.value,
  };

  // 서버로 POST 요청을 보냅니다.
  fetch("/userAdminPage/addEmp", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(formData),
  })
    .then((Response) => Response.text())
    .then((text) => {
      if (text === "success") {
        swal("새로운 직원이 추가되었습니다.", {
          icon: "success",
        }).then(() => {
          location.href = "/userAdminPage/goManagemember";
        });
      } else {
        swal("직원 등록이 실패하였습니다. 다시 시도해주세요.", {
          icon: "error",
        });
      }
    })
    .catch((error) => {
      console.log(error);
    });
});


// *****************************직원 수정*****************************
document
  .querySelector('button[data-bs-target="#edit_member"]')
  .addEventListener("click", function () {
    let checkboxes = document.querySelectorAll(
      'input[name="empCheck"]:checked'
    );

    if (checkboxes.length === 0) {
      swal("선택된 직원이 없습니다.");
      return;
    }

    let editList = document.querySelector("#editList");
    let msg = "";
    checkboxes.forEach(function (checkbox) {
      var tr = checkbox.parentElement.parentElement;
      var td = tr.children;

      var no = td[1].dataset.code;
      var cEmpName = td[2].innerText;
      var cEmpPosition = td[3].innerText;
      var cEmpTel = td[4].innerText;
      var cEmpEmail = td[5].innerText;
      var cEmpBirth = td[6].innerText;

      msg += '<tr class="text-center align-middle">';
      msg += "<td>" + no + "</td>";
      msg += '<td class=""><input type="text" value="' + cEmpName + '"></td>';
      msg += '<td><input type="text" value="' + cEmpPosition + '"></td>';
      msg +=
        '<td><input type="number" value="' +
        phoneNumberToNumber(cEmpTel) +
        '"></td>';
      msg += '<td><input type="mail" value="' + cEmpEmail + '"></td>';
      msg += '<td><input type="date" value="' + cEmpBirth + '"></td>';
      msg +=
        '<td><select class="form-select" aria-label="status"><option value="" selected>선택</option><option value="0">X</option><option value="1">O</option>';
      msg += "</select></td></tr>";
    });
    editList.innerHTML = msg;
  });

function phoneNumberToNumber(phoneNumber) {
  // 전화번호에서 숫자 이외의 문자를 모두 제거합니다.
  var numberOnly = phoneNumber.replace(/\D/g, "");
  return numberOnly;
}

// 직원 수정 완료 버튼 클릭 시
document.querySelector("#editMemberBtn").addEventListener("click", function () {
  // 수정된 데이터를 담을 배열
  var editedData = [];

  // 수정된 데이터를 가져옴
  var editRows = document.querySelectorAll("#editList tr");

  // 유효성 검사 플래그
  var isValid = true;

  editRows.forEach(function (row) {
    var editedEmp = {};

    // 각 열의 입력된 값을 가져와서 editedEmp 객체에 저장
    editedEmp.no = row.querySelector("td:nth-child(1)").innerText;
    editedEmp.cEmpName = row.querySelector("td:nth-child(2) input").value;
    editedEmp.cEmpPosition = row.querySelector("td:nth-child(3) input").value;
    editedEmp.cEmpTel = row.querySelector("td:nth-child(4) input").value;
    editedEmp.cEmpEmail = row.querySelector("td:nth-child(5) input").value;
    editedEmp.cEmpBirth = row.querySelector("td:nth-child(6) input").value;
    editedEmp.receiveGift = row.querySelector("td:nth-child(7) select").value;

    // 유효성 검사: receiveGift 값이 0 또는 1이 아닌 경우 플래그 설정 및 경고 표시
    if (editedEmp.receiveGift !== "0" && editedEmp.receiveGift !== "1") {
      isValid = false;
      swal("선물 수령여부가 선택되지 않았습니다.");
      return; // 함수 종료
    }

    editedData.push(editedEmp);
  });

  // 유효성 검사 통과 여부 확인 후 서버로 전송
  if (isValid) {
    // 서버로 수정된 데이터를 전송
    fetch("/userAdminPage/updateEmp", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(editedData),
    })
      .then((response) => response.text())
      .then((text) => {
        if (text === "success") {
          swal("선택된 직원이 수정되었습니다.", {
            icon: "success",
          }).then(() => {
            location.href = "/userAdminPage/goManagemember";
          });
        } else {
          swal("직원 수정을 실패하였습니다. 다시 시도해주세요.", {
            icon: "error",
          });
        }
      })
      .catch((error) => {
        console.error("서버에 요청을 보내는 중 오류가 발생했습니다:", error);
      });
  }
});


// *****************************직원 삭제*****************************
// 직원 삭제 버튼 클릭 시
document.querySelector("#checkDelete").addEventListener('click', () => {
  let checkboxes = document.querySelectorAll('input[name="empCheck"]:checked');

  // 체크된 직원이 없는 경우 알림창 띄우고 함수 종료
  if (checkboxes.length === 0) {
    swal("선택된 직원이 없습니다.");
    return;
  }

  // 선택된 직원들의 번호를 담을 배열
  let empNumbers = [];

  // 선택된 직원들의 번호를 배열에 저장
  checkboxes.forEach((checkbox) => {
    let tr = checkbox.parentElement.parentElement;
    let td = tr.children;
    let cEmpNo = td[1].dataset.code; // 직원 번호를 해당하는 td에서 가져옴
    empNumbers.push(cEmpNo);
    console.log(empNumbers);
  });

  // 직원 삭제 확인 여부 확인
  swal({
    title: "정말로 직원을 삭제하시겠습니까?",
    text: "삭제된 직원은 복구할 수 없습니다!",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }).then((willDelete) => {
    if (willDelete) {
      // 삭제할 직원의 번호를 서버로 전송
      fetch("/userAdminPage/deleteEmp/" + sessionStorage.getItem("Okja"), {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(empNumbers), // 직원 번호들만 전송하도록 수정
      })
        .then((response) => response.text())
        .then((text) => {
          if (text === "success") {
            swal("선택된 직원이 삭제되었습니다.", {
              icon: "success",
            }).then(() => {
              location.href = "/userAdminPage/goManagemember";
            });
          } else {
            swal("직원 삭제 실패하였습니다. 다시 시도해주세요.", {
              icon: "error",
            });
          }
        })
        .catch((error) => {
          console.error("서버에 요청을 보내는 중 오류가 발생했습니다:", error);
          swal("오류가 발생하여 직원 삭제에 실패했습니다.", {
            icon: "error",
          });
        });
    } else {
      swal("선택된 직원 삭제가 취소되었습니다.");
    }
  });
});

// 직원 검색 버튼 클릭 시
document.getElementById("searchBtn").addEventListener("click", function () {
  var keyword = document.getElementById("searchInput").value.trim().toLowerCase();
  var rows = document.getElementById("empList").getElementsByTagName("tr");

  for (var i = 0; i < rows.length; i++) {
      var cells = rows[i].getElementsByTagName("td");
      var found = false;

      for (var j = 1; j < cells.length; j++) { // 첫 번째 열은 체크박스이므로 검색에서 제외
          var cellContent = cells[j].innerText.toLowerCase();
          if (cellContent.includes(keyword)) {
              found = true;
              break;
          }
      }

      if (found) {
          rows[i].style.display = "";
      } else {
          rows[i].style.display = "none";
      }
  }
});

// 검색 입력란 엔터 키 이벤트 추가
document.getElementById("searchInput").addEventListener("keyup", function(event) {
  // 키코드가 13일 때(Enter 키)
  if (event.keyCode === 13) {
      // 기본 동작 방지
      event.preventDefault();
      // Search 버튼 클릭 이벤트 호출
      document.getElementById("searchBtn").click();
  }
});