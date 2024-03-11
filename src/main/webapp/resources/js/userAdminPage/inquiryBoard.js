// *****************************문의 정보 가져오는 부분*****************************
// 문의 정보를 가져와 화면에 표시하는 부분입니다.
const path = "/userAdminPage/getInquiryboard/" + okja; // API 경로 설정

// API를 호출하고 데이터를 처리합니다.
fetch(path)
  .then((response) => response.json()) // JSON 파싱
  .then((data) => {
    showQnAList(data); // 데이터를 화면에 표시하는 함수 호출
  })
  .catch((err) => {
    console.error(err); // 오류 처리
  });

// 직원 목록을 표시하는 함수입니다.
function showQnAList(data) {
  let msg = "";
  let listBody = document.querySelector("#QnA");
  if (data.length === 0) {
    // 데이터가 비어있는 경우
    // 메시지 출력
    msg += '<div class="accordion-item" id="QnA">';
    msg += '<h2 class="accordion-header">';
    msg += '문의 내역이 없습니다.';
    msg += '</h2>';
    msg += '<div>';
  } else {
    // 데이터가 있는 경우
    data.reverse().forEach((QnA) => {
      // 각 문의 정보를 반복해서 표시
      msg += '<div class="accordion-item" id="QnA">';
      msg += '<h2 class="accordion-header">';
      msg += '<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#'+QnA.spotQnANo+'">';
      msg += '<span class="fst-italic">'+formatTimestamp(QnA.questionDate)+'</span>&nbsp; &nbsp; &nbsp;';
      msg += '<span class="fw-bolder text-break">'+QnA.questionTitle+'</span>';
      msg += '</button>';
      msg += ' <div id="'+QnA.spotQnANo+'" class="accordion-collapse collapse" data-bs-parent="#inquiryBoard">';
      msg += '</h2>';
      msg += '<div id="'+QnA.spotQnANo+'" class="accordion-collapse collapse" data-bs-parent="#inquiryBoard">';
      msg += '<div class="accordion-body">';
      msg += '<p>[문의]</p>';
      msg += '<span class="text-break">'+QnA.questionContent+'</span>';
      msg += '</span>';
      msg += '</div>';
      msg += '</div>';
      msg += '<div id="'+QnA.spotQnANo+'" class="accordion-collapse collapse" data-bs-parent="#inquiryBoard">';
      msg += '<div class="accordion-body">';
      msg += '<p>[답변]</p>';
      msg += '<span class="text-break">'+formatAnswer(QnA.answerContent)+'</span>';
      msg += '</div>'+'</div>'+'</div>';
    });
  }
  listBody.innerHTML = msg; // HTML 테이블의 listBody에 메시지 추가
}

// Unix 타임스탬프를 날짜 형식으로 변환하는 함수입니다.
function formatTimestamp(unixTimeStamp) {
  let myDate = new Date(unixTimeStamp);
  let year = myDate.getFullYear();
  let month = String(myDate.getMonth() + 1).padStart(2, "0");
  let day = String(myDate.getDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
}

// QnA문의 작성하기.
let f = document.querySelector("#inputQnA");
const inputBtn = document.querySelector("#inputBtn");
inputBtn.addEventListener('click',()=>{
  if(!f.inquiryTitle.value){
    swal("제목을 입력해주세요"); 
    return;
  }
  if(!f.customMessege.value){
    swal("내용을 입력해주세요"); 
    return;
  }
  f.setAttribute("action","/userAdminPage/addQnA/" + okja);
  f.setAttribute("method","post");
  f.submit();
});

// 답변이 아직 등록되지 않은 문의에 대해 문구 출력하는 함수입니다.
function formatAnswer(content){
  if(content == undefined){
    return '잠시만 기다려주시면 담당부서에서 답변드릴 예정입니다.'
  }else{
    return content;
  }
}