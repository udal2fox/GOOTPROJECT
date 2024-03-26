<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
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

button 
{
	width: 58px;
	height: 35px;
}
input[type=text]
{
	width: 150px;
}

</style>
</head>
<body>
<jsp:include page="../../navBar.jsp"/>

<div class="container-fluid" align="center" >
	<div class="product-top-back">
		
		<div class="container">
		<div align="left" style="padding-top: 30px;"><h2>거래명세-편집</h2></div>`
		<p></p>
			<h3 align="left">기업정보</h3>
	        <table style="width: 1300px">
	            <tr>
	        		<th>기업명</th><td>${edit.comName }</td>
	        		<th>지점명</th><td>${edit.spName }</td>
	        		<th>기업구분</th><td>${edit.comBizType }</td>	
	        	</tr>
	        	<tr>
	        		<th>담당자</th><td>${edit.getCEmpName()}</td>
	        		<th>대표연락처</th><td>${edit.getCEmpTel()}</td>
	        		<th>대표메일</th><td>${edit.getCEmpEmail() }</td>	 
	        	</tr>
	        	<tr>
	        		<th>일자</th><td>${edit.recDate }</td>
	        		<th>결제수단</th><td>${edit.recPayMth}</td>
	        		<th>정산여부</th><td>${edit.recSortation}</td>	
	        	</tr>
	        </table> 
        </div>
		<div class="container" style="padding-top: 50px;">
			<h3 align="left">금액차감</h3>
	        <table style="width: 1300px">
				<thead>	
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
	        	</thead>
	        	<tbody class="daBody1">
		        	<tr>
		        		<td><input type="text" id="recDedName" <c:if test="${not empty edit.recDedName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recDed" class="form-control" readonly placeholder="자동계산" <c:if test="${not empty edit.recDedName or edit.recSortation eq '결제완료'} ">disabled</c:if>></td>
		        		<td><input type="text" id="recDedSup" value="0" <c:if test="${not empty edit.recDedName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recDedTax" value="0" <c:if test="${not empty edit.recDedName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recDedCst" class="form-control" readonly placeholder="자동계산" <c:if test="${not empty edit.recDedName}">disabled</c:if>></td>
		        		<td><input type="text" id="recDedCstSup" value="0" <c:if test="${not empty edit.recDedName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recDedCstTax" value="0" <c:if test="${not empty edit.recDedName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><button type="button" class="btn btn-primary dedbtn" onclick="inputDedCal()" <c:if test="${not empty edit.recDedName or edit.recSortation eq '결제완료'}">disabled</c:if>>버튼</button></td>
		        	</tr>
	        	</tbody>
	        </table> 
	        <input type="hidden" id="hiddenDedCode">
        </div>
		<div class="container" style="padding-top: 50px;">
			<h3 align="left">추가정산</h3>
	        <table style="width: 1300px">
	        	<thead>
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
	        	</thead>	
	        	<tbody class="daBody1">
		        	<tr>
		        		<td><input type="text" id="recAddName" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if> ></td>
		        		<td><input type="text" id="recAdd" class="form-control" readonly placeholder="자동계산" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recAddSup" value="0" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recAddTax" value="0" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recAddCst" class="form-control" readonly placeholder="자동계산" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recAddCstSup" value="0" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><input type="text" id="recAddCstTax" value="0" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if>></td>
		        		<td><button type="button" class="btn btn-primary addbtn" onclick="inputAddCal()" <c:if test="${not empty edit.recAddName or edit.recSortation eq '결제완료'}">disabled</c:if>>버튼</button></td>
		        	</tr>
	        	</tbody>	
	        </table> 
        </div>
		<div class="container" style="padding-top: 50px;">
			<h3 align="left">상세내역</h3>
	        <table style="width: 1300px" class="detailtable">
	        	<thead>
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
	        	</thead>
	        	<tbody class="Detail">	
		        	<tr>
		        		<td>${edit.prdMajorCtg }</td>
		        		<td>${edit.prdSubCtg }</td>
		        		<td>${edit.prdNo }</td>
		        		<td>${edit.prdName }</td>
		        		<td><fmt:formatNumber value="${edit.prdSal }" pattern="#,###"/></td>
		        		<td><fmt:formatNumber value="${edit.prdCstPri }" pattern="#,###"/></td>
		        		<td><fmt:formatNumber value="${edit.prdMargin }" pattern="0.00"/></td>
		        		<td>${edit.getCEmpName()}</td>
		        	</tr>
		        	<c:if test="${not empty edit.recDedName}">
			        	<tr>
			        		<td>금액차감</td>
			        		<td>금액차감</td>
			        		<td>${edit.recDedPrdCode }</td>
			        		<td>${edit.recDedName }</td>
			        		<td><fmt:formatNumber value="${edit.recDed }" pattern="#,###"/></td>
			        		<td><fmt:formatNumber value="${edit.recDedCst }" pattern="#,###"/></td>
			        		<td><fmt:formatNumber value="${((edit.recDed - edit.recDedCst ) / edit.recDed)}" pattern="0.00"/></td>
			        		<td>${edit.recDedWorker}</td>
			        	</tr>	
		        	</c:if>
		        	<c:if test="${not empty edit.recAddName}">
			        	<tr>
			        		<td>추가정산</td>
			        		<td>추가정산</td>
			        		<td>${edit.recAddPrdCode }</td>
			        		<td>${edit.recAddName }</td>
			        		<td><fmt:formatNumber value="${edit.recAdd }" pattern="#,###"/></td>
			        		<td><fmt:formatNumber value="${edit.recAddCst }" pattern="#,###"/></td>
			        		<td><fmt:formatNumber value="${((edit.recAdd - edit.recAddCst )/edit.recAdd)}" pattern="0.00"/></td>
			        		<td>${edit.recAddWorker}</td>
			        	</tr>	
		        	</c:if>
	        	</tbody>
	        </table> 
        </div>
        <div class="container" >
       		<div class="buttonGp" align="right" style="width: 1300px; padding-top: 15px;">
	        	<div>
	        		<input type="hidden" value="${recNo}" id="recNo">
	        		<input type="hidden" value="${eName}" id="worker">
	        		<button type="button" class="btn btn-primary" onclick="EditTradeDetail()">수정</button>
	  				&nbsp;&nbsp;
	        		<button type="button" class="btn btn btn-secondary" onclick="reload()">취소</button>
	  				&nbsp;&nbsp;
	        		<button type="button" class="btn btn btn-secondary" onclick="backPage()">목록</button>
	        	</div>
	        </div>	
        </div>
    </div>
</div> 


<script type="text/javascript">
	let deptNo = <%= session.getAttribute("deptNo") %>;
</script>
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/tdEditOption.js"></script> 
</body>
</html>