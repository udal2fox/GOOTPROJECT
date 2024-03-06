/** 서치바 검색 기능 구현 */

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//서치바 검색 버튼 클릭 이벤트 핸들러
document.querySelector('#searchBarSearchBtn').addEventListener('click', function() {
//console.log("서치바 검색 버튼 클릭 이벤트");
 currentKeyword = document.querySelector('#searchBarKeyword').value; // 현재 키워드 갱신
 
// console.log(currentKeyword);
 fetchSearchResults(currentKeyword); // 검색 결과 요청
 
});



//서치바-키워드 가져오기 
function fetchSearchResults(keyword) {
    // alert(1);



    fetch('/search?keyword=' + keyword)
        .then(response => response.json())
        .then(list => {
            let msg = '';
            list.forEach(item => {
                msg += '<tr>' +
                    '<td><a href="list.consultNo">' + item.consultNo + '</a></td>' +
                    '<td>' + item.csDate + '</td>' +
                    '<td>' + item.csCompanyName + '</td>' +
                    '<td>' + item.csName + '</td>' +
                    '<td>' + item.csContact + '</td>' +
                    '<td>' + item.csEmail + '</td>' +
                    '<td>' + item.csBdgt + '</td>' +
                    '<td>' + item.csStatus + '</td>' +
                    '<td>' + item.csEname + '</td>' +
                    '</tr>';
            });

            const tblBody = document.querySelector('#sales_tbl');
            tblBody.innerHTML = msg;

  

        })
        .catch(error => console.error('Error:', error));
} 




