// 서치 기능 

//키워드와 현재 페이지를 저장하는 전역 변수
let currentKeyword = '';
let currentPage = 1;

// 검색 버튼 클릭 이벤트 핸들러
document.querySelector('#search').addEventListener('click', function() {
    currentKeyword = document.querySelector('#keyword').value; // 현재 키워드 갱신
    currentPage = 1; // 페이지 초기화
    fetchSearchResults(currentKeyword, currentPage); // 검색 결과 요청
});

//페이지네이션 버튼 클릭 이벤트 핸들러
document.querySelector('.page-nation').addEventListener('click', function(event) {
    if (event.target.tagName === 'A') {
        event.preventDefault();
        let pageNum = event.target.getAttribute('href');
        currentPage = pageNum; // 현재 페이지 갱신
        console.log(currentPage);
        fetchSearchResults(currentKeyword, currentPage); // 검색 결과 요청
    }
});



// 검색 결과 요청 함수
function fetchSearchResults(keyword, page) {
    fetch('/searchProduct?keyword=' + keyword + '&pageNum=' + page)
        .then(response => response.json())
        .then(data => {
        	const list = data[0]; // 리스트
    	    const ptdo = data[1]; // ptdo 객체
    	    console.log(list);
    	    console.log(ptdo);
    	    // 리스트와 ptdo 객체를 사용하여 작업 수행
    	    let msg = '';
    	    let pageMsg = '';
    	    list.forEach(list =>
    	    {
	    	msg += '<tr class="product" data-type="'+list.prdMajorCtg+'" data-status="'+list.prdSt+'">'+
					   '<td>'+list.supsCo+'</td>'+
					   '<td>'+list.prdNo +'</td>'+
					   '<td>'+list.prdSdc+'</td>'+
					   '<td>'+list.prdMajorCtg+'</td>'+
					   '<td>'+list.prdSubCtg+'</td>'+
					   '<td>'+
					   		'<img alt="" src="'+list.prdImg+'"align="left" ><div id="tdTop">'+list.prdName+'</div></td>'+
					   '<td>'+list.prdCstPri.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' })+'</td>'+
				       '<td>'+list.prdSal.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' })+'</td>'+
					   '<td>'+(list.prdMargin * 100 )+'%</td>'+
		           '</tr>';
    	    })
    	    let pageMaker = ptdo;
			
			// 이전 페이지 링크
			if (pageMaker.prev) {
				pageMsg += '<li class="previous">' +
			            '<a href="' + (pageMaker.startPage - 1) + '"> &lt; </a>' +
			            '</li>';
			}
			
			// 페이지 번호 목록
			for (let num = pageMaker.startPage; num <= pageMaker.endPage; num++) {
				pageMsg += '<li>' +
			            '<a href="' + num + '" class="' + (pageMaker.cri.pageNum == num ? 'active' : '') + '">' + num + '</a>' +
			            '</li>';
			}
			
			if (pageMaker.next) {	
			    pageMsg += '<li>' +
			                '<a href="' + (pageMaker.endPage + 1) + '"> &gt; </a>' +
			                '</li>';
			}
			
			// HTML 마무리
			pageMsg += '</ul>' +
			        '</div>';
    	    
    	    document.querySelector('#table-prd tbody').innerHTML = msg;
    	    document.querySelector('.page-nation').innerHTML = pageMsg;
    	    
    	    filter();
    	    
        })
        .catch(error => console.error('Error:', error));
}
