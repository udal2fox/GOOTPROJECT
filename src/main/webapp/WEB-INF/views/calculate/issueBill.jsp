<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid" align="center" style="padding: 100px;">
	<div style="width: 1500px">
		<h2 align="left">계산서 발행</h2>
        <table style="background:#eaeaea;width: 1500px" >
            <tr>
                <td>키워드</td><td><input type="text" class="form-control" placeholder="지점관리번호/기업명"></td>
            </tr>
            <tr>
            	<td>기업 분류</td>
            	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">전체</td>
            	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">법인</td>
            	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">개인</td>
            </tr>
            <!-- 그.. 부트스트랩 데이트 피커로 가꼬오는게 좋을듯? -->
            <tr>
            	<td>
            		<input type="text" class="form-control" placeholder="기간 입력~"> 
            	</td>
            	
            	<td>
            		<input type="text" class="form-control" placeholder="거래명세번호/기업명/지점명">
            	</td>
            	<td>
            		<button type="button" class="btn btn-primary">오늘</button>
            		<button type="button" class="btn btn-primary">최근일주</button>
            		<button type="button" class="btn btn-primary">이번달</button>
            		<button type="button" class="btn btn-primary">지날달</button>
            		<button type="button" class="btn btn-primary">지난분기</button>
            	</td>
            	<td>
            		<button type="button" class="btn btn-primary">검색</button>	
            		<button type="button" class="btn btn-primary">초기화</button>	
            	</td>
            </tr>
        </table> 
        <div style="padding-top: 20px;">
       		<div style="display: flex; flex-direction: row-reverse;">
        		<div><button type="button" class="btn btn-primary">미납 안내 메일 발송</button></div>
        	</div>
        </div>
    </div>
    <div style="padding-top: 20px">
        <form>
            <table border="1" class="table" id="table-prd" style="width: 1500px;">
			    <thead class="table-light">
			        <tr>
			        	<th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
			        	<th>기업명</th>
			        	<th>기업구분</th>
			        	<th>지점명</th>
			        	<th>합계</th>
			        	<th>공급액</th>
			        	<th>세액</th>
			        	<th>결제수단</th>
			        	<th>정산여부</th>
			        	<th>대상거래명세서</th>
			        </tr>
			    </thead>
			    <tbody>
	         		<tr>
		                <th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
		                <td>2</td>
		                <td>3</td>
		                <td>4</td>
		                <td>5</td>
		                <td>6</td>
		                <td>7</td>
           				<td>9</td>
           				<td>10</td>
		            </tr>
			    </tbody>
			</table>
        </form>
    </div>
</div> 
</body>
</html>