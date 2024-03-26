document.addEventListener("DOMContentLoaded", function () {
  // 현재 날짜를 가져오는 함수
  function getCurrentDate() {
    var today = new Date();
    var month = today.getMonth() + 1; // JavaScript의 월은 0부터 시작하므로 1을 더해줍니다.
    var year = today.getFullYear();
    return year + "년 " + (month < 10 ? "0" : "") + month + "월";
  }

  // 이전 달로 이동하는 함수
  function goToLastMonth() {
    var currentDate = document.getElementById("thisMonth").innerHTML;
    var currentMonth = parseInt(currentDate.split(" ")[1]); // 월 값 추출
    var currentYear = parseInt(currentDate.split(" ")[0]); // 연도 값 추출

    if (currentMonth === 1) {
      currentYear--;
      currentMonth = 12;
    } else {
      currentMonth--;
    }

    document.getElementById("thisMonth").innerHTML =
      currentYear +
      "년 " +
      (currentMonth < 10 ? "0" : "") +
      currentMonth +
      "월";

    // 이전 달로 이동했을 때 fetch 함수 실행
    fetchData();
  }

  // 다음 달로 이동하는 함수
  function goToNextMonth() {
    var currentDate = document.getElementById("thisMonth").innerHTML;
    var currentMonth = parseInt(currentDate.split(" ")[1]); // 월 값 추출
    var currentYear = parseInt(currentDate.split(" ")[0]); // 연도 값 추출

    if (currentMonth === 12) {
      currentYear++;
      currentMonth = 1;
    } else {
      currentMonth++;
    }

    document.getElementById("thisMonth").innerHTML =
      currentYear +
      "년 " +
      (currentMonth < 10 ? "0" : "") +
      currentMonth +
      "월";

    // 다음 달로 이동했을 때 fetch 함수 실행
    fetchData();
  }

  // "지난달"을 클릭할 때 이벤트 처리
  document.getElementById("lastMonth").addEventListener("click", function () {
    goToLastMonth();
  });

  // "다음달"을 클릭할 때 이벤트 처리
  document.getElementById("nextMonth").addEventListener("click", function () {
    goToNextMonth();
  });

  // 페이지 로드 시 초기 날짜 설정 및 fetch 함수 실행
  document.getElementById("thisMonth").innerHTML = getCurrentDate();
  fetchData();
});

// fetch 함수 정의
function fetchData() {
  // 'thisMonth' 아이디를 가진 요소의 텍스트 콘텐츠 가져오기
  var thisMonthText = document.getElementById("thisMonth").textContent;
  // '2024년 00월'에서 '2024년' 부분에서 숫자만 추출하기
  var yearNumber = parseInt(thisMonthText.split(" ")[0]);
  // '00월' 부분에서 '월'을 제외하고 숫자만 가져오기
  var monthNumber = thisMonthText.split(" ")[1].replace("월", "");

  fetch(
    "/userAdminPage/recipients/" +
      sessionStorage.getItem("Okja") +
      "/" +
      monthNumber +
      "/" +
      yearNumber
  )
    .then((Response) => Response.json())
    .then((data) => {
      let tbody = document.getElementById("recipientList");
      let msg = "";
      let n = 0;
      let totalCount = 0; // 발송 대상자의 총 수를 저장하기 위한 변수

      // 카운트 변수들 초기화
      let notSentCount = 0;
      let selectingCount = 0;
      let selectedCount = 0;
      let sentCount = 0;

      if (data.length === 0) {
        msg += '<td colspan = "9"> 이번달 생일자는 없습니다. </td>';
      } else {
        data.forEach((recipient) => {
          totalCount++; // 발송 대상자의 총 수 카운팅

          // 상태에 따라 카운트 증가
          if (recipient.step === "미발송") {
            notSentCount++;
          } else if (recipient.step === "선택중") {
            selectingCount++;
          } else if (recipient.step === "선택완료") {
            selectedCount++;
          } else if (recipient.step === "발송완료") {
            sentCount++;
          }

          msg += '<tr class="text-center align-middle">';
          msg += "<td>" + ++n + "</td>";
          msg += "<td>" + recipient.cEmpName + "</td>";
          msg += "<td>" + recipient.cEmpPosition + "</td>";
          msg += "<td>" + formatPhoneNumber(recipient.cEmpTel) + "</td>";
          msg += "<td>" + recipient.cEmpEmail + "</td>";
          msg += "<td>" + formatTimestamp(recipient.cEmpBirth) + "</td>";
          msg += "<td>" + recipient.step + "</td>";
          msg +=
            "<td>" +
            (recipient.totalAmount
              ? numberWithCommas(recipient.totalAmount) + "원"
              : "0원") +
            "</td>";
          // '미발송'인 경우에만 버튼 활성화
          if (recipient.step === "미발송") {
            msg +=
              '<td><button type="button" class="btn btn-outline-success" onclick="sendGift(' +
              recipient.ordNo +
              ')">바로발송</button></td>';
          } else {
            msg += "<td></td>";
          }
          msg += "</tr>";
        });
      }
      tbody.innerHTML = msg;

      // 발송 대상자 수 표시
      document.getElementById("numOfRecipients").textContent =
        totalCount + "명";

      // 각 상태별로 카운트 표시
      document.getElementById("notSentCount").textContent = notSentCount + "명";
      document.getElementById("selectingCount").textContent =
        selectingCount + "명";
      document.getElementById("selectedCount").textContent =
        selectedCount + "명";
      document.getElementById("sentCount").textContent = sentCount + "명";
    })
    .catch((error) => {
      console.log("서버에 요청을 보내는 중 오류가 발생했습니다:", error);
      swal("오류가 발생하여 선물 정보를 가져오지 못했습니다.", {
        icon: "error",
      });
    });
}

// Unix 타임스탬프를 날짜 형식으로 변환하는 함수입니다.
function formatTimestamp(unixTimeStamp) {
  let myDate = new Date(unixTimeStamp);
  let year = myDate.getFullYear();
  let month = String(myDate.getMonth() + 1).padStart(2, "0");
  let day = String(myDate.getDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
}

// 세자리마다 쉼표를 찍는 함수
function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 선물을 발송하는 함수
function sendGift(recipientId) {
  // 여기에 선물 발송 코드 추가
  console.log("Recipient ID:", recipientId);
}

// 전화번호 형식을 변환하는 함수입니다.
function formatPhoneNumber(num) {
  return num
    .replace(/[^0-9]/g, "") // 숫자 이외의 문자 제거
    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3"); // 특정 패턴에 맞게 변환
}

// 선물을 발송하는 함수
function sendGift(recipientId) {
  // fetch를 사용하여 서버에 요청을 보냅니다.
  fetch("/send-email/" + recipientId)
    .then((response) => {
      if (response.ok) {
        swal("성공", "이메일을 성공적으로 보냈습니다.", "success");
        // 선물 발송 성공 시 다시 데이터를 불러옵니다.
        fetchData();
      } else {
        console.error("Failed to send email");
        swal("오류", "이메일을 보내는 중 오류가 발생했습니다.", "error");
      }
    })
    .catch((error) => {
      console.error("Error sending email:", error);
      swal("오류", "서버에 요청을 보내는 중 오류가 발생했습니다.", "error");
    });
}
