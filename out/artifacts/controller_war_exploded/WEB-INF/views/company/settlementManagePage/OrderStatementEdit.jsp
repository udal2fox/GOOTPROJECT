<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table th{
	background-color: #eaeaea;
}
table {
	border: 1px solid black;
}

</style>
</head>
<body>
<jsp:include page="../../navBar.jsp"/>

<div class="container-fluid" align="center" style="padding: 100px; text-align: center;">
	<div class="product-top-back">
		
		
		<div class="container" style="padding-top: 50px;">
		<div align="left" style="font-weight: bold;">거래명세-편집</div>`
		<p></p>
			<h3 align="left">기업정보</h3>
	        <table style="width: 1500px">
	            <tr>
	        		<th>기업명</th><td><a href="#">불러오기</a></td>
	        		<th>지점명</th><td><a href="#">불러오기</a></td>
	        		<th>기업구분</th><td><a href="#">불러오기</a></td>	
	        	</tr>
	        	<tr>
	        		<th>담당자</th><td><a href="#">불러오기</a></td>
	        		<th>대표연락처</th><td><a href="#">불러오기</a></td>
	        		<th>대표메일</th><td><a href="#">불러오기</a></td>	 
	        	</tr>
	        	<tr>
	        		<th>일자</th><td><a href="#">불러오기</a></td>
	        		<th>결제수단</th><td><a href="#">불러오기</a></td>
	        		<th>정산여부</th><td><a href="#">불러오기</a></td>	
	        	</tr>
	        </table> 
        </div>
		<div class="container" style="padding-top: 50px;">
			<h3 align="left">금액차감</h3>
	        <table style="width: 1500px">
	        	<tr>
	        		<th>적요(품목명)</th>	
	        		<th>차감금액</th>	
	        		<th>차감 공급액</th>	
	        		<th>차감 세액</th>	
	        		<th>원가</th>	
	        		<th>원가-공급액</th>	
	        		<th>원가-세액</th>	
	        		<th>금액조정</th>	
	        	</tr>
	        	<tr>
	        		<td>입력 (필수값)</td>
	        		<td>자동계산</td>
	        		<td>입력 (필수값)</td>
	        		<td>입력(선택값) / null=0 </td>
	        		<td>자동계산</td>
	        		<td>입력(필수값)</td>
	        		<td>입력(선택값) / null=0 </td>
	        		<td><button type="button" class="btn btn-primary">버튼</button></td>
	        	</tr>
	        </table> 
        </div>
		<div class="container" style="padding-top: 50px;">
			<h3 align="left">금액차감</h3>
	        <table style="width: 1500px">
	        	<tr>
	        		<th>적요(품목명)</th>
	        		<th>추가정산 금액</th>
	        		<th>추가정산 공급액</th>
	        		<th>추가정산 세액</th>
	        		<th>원가</th>
	        		<th>원가-공급액</th>
	        		<th>원가-세액</th>
	        		<th>금액조정</th>
	        	</tr>	
	        	<tr>
	        		<td>입력(필수값)</td>
	        		<td>자동계산</td>
	        		<td>입력(필수값)</td>
	        		<td>입력(선택값) / null=0</td>
	        		<td>자동계산</td>
	        		<td>입력(필수값)</td>
	        		<td>입력(선택값) / null=0</td>
	        		<td><button type="button" class="btn btn-primary">버튼</button></td>
	        	</tr>	
	        </table> 
        </div>
		<div class="container" style="padding-top: 50px;">
			<h3 align="left">상세내역</h3>
	        <table style="width: 1500px">
	        	<tr>
	        		<th>대분류</th>
	        		<th>소분류</th>
	        		<th>상품코드</th>
	        		<th>상품명</th>
	        		<th>판매가</th>
	        		<th>원가</th>
	        		<th>마진율</th>
	        		<th>주문자</th>
	        	</tr>	
	        	<tr>
	        		<td>1</td>
	        		<td>2</td>
	        		<td>3</td>
	        		<td>4</td>
	        		<td>5</td>
	        		<td>6</td>
	        		<td>7</td>
	        		<td>8</td>
	        	</tr>	
	        </table> 
	        <p></p>
        </div>
        <div class="container" >
       		<div class="buttonGp" align="right" style="width: 1320px">
	        	<div>
	        		<button type="button" class="btn btn-primary">수정</button>
	  				&nbsp;&nbsp;&nbsp;
	        		<button type="button" class="btn btn-primary">목록</button>
	        	</div>
	        </div>	
        </div>
        
    </div>
</div> 
</body>
</html>