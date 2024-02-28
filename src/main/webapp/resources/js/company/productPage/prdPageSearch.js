//// 서치 기능
//
//// 키워드와 현재 페이지를 저장하는 전역 변수
//let currentKeyword = '';
//
//// 검색 버튼 클릭 이벤트 핸들러
//document.querySelector('#search').addEventListener('click', function() {
//    currentKeyword = document.querySelector('#keyword').value; // 현재 키워드 갱신
//    fetchSearchResults(currentKeyword); // 검색 결과 요청
//});
//
//
//// 검색 결과 요청 함수
//function fetchSearchResults(keyword) {
//    fetch('/searchProduct?keyword=' + keyword)
//        .then(response => response.json())
//        .then(data => {
//            console.log(data);
//            let list = data;
//            let msg = '';
//            list.forEach(list => {
//                msg += '<tr class="product" data-type="'+list.prdMajorCtg+'" data-status="'+list.prdSt+' style="display:table-row;">'+
//					   '<td><a href="moveSuppliersUpdate">'+list.supsCo+'</a></td>'+
//					   '<td><a href="moveProductUpdate">'+list.prdNo+'</a></td>'+
//					   '<td>'+list.prdSdc+'</td>'+
//					   '<td>'+list.prdMajorCtg+'</td>'+
//					   '<td>'+list.prdSubCtg+'</td>'+
//					   '<td>'+
//					   		'<img alt="" src="'+list.prdImg+'" align="left" ><div id="tdTop">'+list.prdName+'</div></td>'+
//					   '<td>'+list.prdCstPri.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' })+'</td>'+
//				       '<td>'+list.prdSal.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' })+'</td>'+
//					   '<td>'+(list.prdMargin * 100 )+'%</td>'+
//		           '</tr>';
//                
//            })
//            document.querySelector('#table-prd tbody').innerHTML = msg;
//            filter();
//            
//            
//        })
//        .catch(error => console.error('Error:', error));
//}
