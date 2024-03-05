/** 서치바 검색 기능 구현 */

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';

//서치바 검색 버튼 클릭 이벤트 핸들러
document.querySelector('#searchBarSearchBtn').addEventListener('click', function() {
//console.log("서치바 검색 버튼 클릭 이벤트");
 currentKeyword = document.querySelector('#searchBarKeyword').value; // 현재 키워드 갱신
 
 //console.log(currentKeyword);
 fetchSearchResults(currentKeyword); // 검색 결과 요청
 
});



//서치바-키워드 가져오기 
function fetchSearchResults(keyword) {
    // alert(1);


    const searchKeyword = {
        method: 'POST',
        //  body: 'keyword=' + encodeURIComponent(keyword), 
        body: JSON.stringify(keyword),
        headers: {
            'Content-Type': 'application/json; charset=utf-8' 
        }

    };

    fetch('/searchBarKeyword', searchKeyword)
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

          /*  drawPagination();
            goToPage(1);
            resetCheckboxes();*/

        })
        .catch(error => console.error('Error:', error));
}



// 필터링된 영업 상태, 기간 가져오기
function getFilteredSearchBar() {
	
	//선택된 영업 상태 값 가져오기 
    let typeFilters = Array.from(document.querySelectorAll('input[name="serviceStatus"]:checked')).map(function (checkbox) {
        return checkbox.value;
    });
    
    
    //선택된 날짜 값 가져오기(아직 구현 안됨) 
    
    
  

    // 여기서 새로운 영업 리스트를 가져오도록 수정
    let salesList = document.querySelectorAll('.salesList'); // 전체 영업 리스트
    let filteredSalesList = Array.from(salesList).filter(function (salesList) {
       
        return (typeFilters.length === 0 || typeFilters.includes(type)) && (statusFilters.length === 0 || statusFilters.includes(status));
    });

    return filteredProducts;
}


// 서치 끝