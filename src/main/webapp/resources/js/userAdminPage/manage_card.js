// 세션 스토리지에서 Okja 값을 가져옴
var Okja = sessionStorage.getItem("Okja");

// BirthdayCards 테이블에서 데이터 가져오는 요청
fetch("/userAdminPage/getCardInfo/" + Okja)
  .then((response) => response.json())
  .then((data) => {
    // 가져온 데이터를 이용하여 각 요소 설정
    var selectedTheme = data.selectedTheme;
    var sendName = data.sendName;
    var checkedValue = data.checkedValue;
    var messegeContent = data.messegeContent;

    // 선택된 테마 클릭
    var themeLink = document.querySelector('a[id="' + selectedTheme + '"]');
    if (themeLink) {
      themeLink.click();
    } else {
      document.getElementById("theme_basic").click(); // 기본 테마 클릭
    }

    // 발신자명 입력
    var sendNameInput = document.getElementById("sendName");
    if (sendName === "") {
      sendNameInput.value = "기업명 또는 대표자명";
    } else {
      sendNameInput.value = sendName;
    }

    // 라디오 버튼 체크
    var basicRadio = document.getElementById("basic");
    var customRadio = document.getElementById("custom");
    if (checkedValue === "custom") {
      customRadio.checked = true;
    } else {
      basicRadio.checked = true;
    }

    // 메세지 텍스트 설정
    var customMessegeInput = document.getElementById("customMessege");
    if (messegeContent === "") {
      customMessegeInput.value =
        "안녕하세요 {name} 님! <br> <br> {발신자명} 에서 {name} 님의 생일을 축하드립니다.";
    } else {
      customMessegeInput.value = messegeContent;
    }
    // 만약 basicRadio가 체크된 상태이면 customMessegeInput을 읽기 전용으로 설정
    if (basicRadio.checked) {
      customMessegeInput.setAttribute("readonly", "readonly");
      customMessegeInput.style.background = "lightgray"; // 회색 배경으로 변경
    } else {
      customMessegeInput.removeAttribute("readonly");
      customMessegeInput.style.background = ""; // 배경 스타일 제거
    }

    document.querySelector("#messegePreview").innerHTML =
      customMessegeInput.value;
  })
  .catch((error) => console.error("Fetch Error:", error));

document.addEventListener("DOMContentLoaded", function () {
  // id가 theme로 시작하는 a 태그를 찾음
  var themeLinks = document.querySelectorAll("a[id^='theme']");

  // 각 링크에 대해 클릭 이벤트 핸들러 추가
  themeLinks.forEach(function (link) {
    link.addEventListener("click", function (event) {
      event.preventDefault(); // 기본 동작 방지

      // 클릭된 링크의 자식 요소 중 이미지 태그를 찾음
      var img = this.querySelector("div.card > img");

      // 이미지가 존재하면
      if (img) {
        // 이미지의 src 값을 가져와서
        var imageUrl = img.getAttribute("src");

        // themePreview div의 background 이미지로 설정
        var themePreview = document.getElementById("themePreview");
        if (themePreview) {
          themePreview.style.backgroundImage = "url(" + imageUrl + ")";
        }
      }
    });
  });

  // 사용자가 누른 a 태그의 id 값
  var selectedThemeId = "";
  var themeLinks = document.querySelectorAll("a[id^='theme']");
  themeLinks.forEach(function (link) {
    link.addEventListener("click", function (event) {
      event.preventDefault(); // 기본 동작 방지
      selectedThemeId = this.id;
    });
  });

  // 발신자명 입력란에 입력할 때마다 값을 업데이트
  var sendNameInput = document.getElementById("sendName");
  var sendName = ""; // 초기값 설정
  sendNameInput.addEventListener("input", function () {
    sendName = this.value;
  });

  // messegePreview의 스팬 태그 내용을 변수에 담기
  var messegePreview = document.getElementById("messegePreview");

  // 체크 전 라디오 버튼 초기화
  var checkedValue = "basic";

  // '맞춤' 라디오 버튼 체크 시 이벤트 처리
  var customMessegeInput = document.getElementById("customMessege");
  var basicRadio = document.getElementById("basic");
  var customRadio = document.getElementById("custom");

  customRadio.addEventListener("change", function () {
    customMessegeInput.removeAttribute("readonly");
    customMessegeInput.style.background = ""; // 배경 스타일 제거
    customMessegeInput.addEventListener("input", function () {
      messegePreview.innerHTML =
        '<span class="text-break" style="color: black;">' +
        customMessegeInput.value +
        "</span>";
    });

    // '맞춤' 라디오 버튼이 체크되면 checkedValue를 'custom'으로 설정
    checkedValue = "custom";
  });

  // '기본' 라디오 버튼 체크 시 이벤트 처리
  basicRadio.addEventListener("change", function () {
    customMessegeInput.value = "안녕하세요 {name} 님! <br> <br> {발신자명} 에서 {name} 님의 생일을 축하드립니다.";
    customMessegeInput.setAttribute("readonly", "readonly");
    customMessegeInput.style.background = "lightgray"; // 회색 배경으로 변경
    messegePreview.innerHTML =
      '<span class="text-break" style="color: black;"> 안녕하세요 {name} 님! <br> <br> {발신자명} 에서 {name} 님의 생일을 축하드립니다.</span>';

    // '기본' 라디오 버튼이 체크되면 checkedValue를 'basic'으로 설정
    checkedValue = "basic";
  });

  // 체크된 라디오 버튼에 따라 checkedValue 설정
  checkedValue = basicRadio.checked ? basicRadio.value : customRadio.value;

  // 저장 버튼 클릭 이벤트 처리
  var saveButton = document.getElementById("saveBtn");
  saveButton.addEventListener("click", function () {
    // 서버로 전송할 데이터 객체 생성
    var data = {
      selectedTheme: selectedThemeId,
      sendName: sendName,
      checkedValue: checkedValue,
      messegeContent: customMessegeInput.value, // 업데이트된 내용으로 설정
    };

    // 데이터를 서버로 전송합니다.
    fetch("/userAdminPage/saveCard/" + Okja, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    })
      .then((response) => {
        if (response.ok) {
          return response.text(); // 성공 시 텍스트 응답을 반환합니다.
        }
        throw new Error("Network response was not ok.");
      })
      .then((text) => {
        // 서버 응답을 확인하여 SweetAlert로 알림을 표시합니다.
        if (text === "success") {
          swal("변경되었습니다.", "", "success").then(() => {
            // SweetAlert 알림을 확인한 후 페이지를 다시로드합니다.
            location.reload();
          });
        } else {
          swal("저장에 실패하였습니다.", "", "error");
        }
      })
      .catch((error) => {
        console.error("서버 에러:", error.message);
        swal("서버 에러", "저장에 실패하였습니다.", "error");
      });
  });
});
