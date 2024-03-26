<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../../navBar.jsp" %> 

<link rel="stylesheet" href="/resources/css/company/calculateMGTPage/TradeDetailPage.css">
<body>
	<div class="container-fluid" align="center">
	
		<table class="saleStatsTableSearch">
			<tr class="rowWhite">
				<td colspan="10"><h2>계산서발행</h2></td>
			</tr>
			<tr>
				<td> 기업 구분 </td>
				<td> 
					<input class="form-check-input" type="checkbox" id="td-BusinessAll" value="전체" checked> 전체
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business" value="법인" checked> 법인   
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business"value="개인" checked> 개인
				</td>	
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td> 키워드   </td> 
				<td colspan="2"> <input type="text" placeholder="기업관리번호/기업명" style="width: 318px;" id="tdKeyword" class="form-control"> </td>
				<td><input type="button" class="btn btn-primary" value="검색" id="search"></td>
				<td><input type="button" class="btn btn-primary" value="초기화" id="reset"></td>	
			</tr>
			<tr>
				<td>기간</td>
				<td colspan="2" style="display: flex; align-items:center;">
					<input type="text" class="datePick1 form-control" placeholder="날짜를 선택하세요"  style="width: 150px" > &nbsp;~&nbsp; 
					<input type="text" class="datePick2 form-control" placeholder="날짜를 선택하세요" style="width: 150px">
				</td>
				<td><input type="button" class="btn btn-primary dateBtn" value="오늘"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="최근1주"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="이번달"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="지난달"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="지난분기"></td>
			</tr>
		</table>
		<div class ="misu" style="padding-top: 25px; flex-direction: row-reverse ">
			<div> 	
				<input type="button" class="btn btn-primary billmakeBtn" value="계산서 발행" style="width: 185px; height: 35px;">	
			</div>	
		</div>

		<table border="1" class="saleStatsTableInfo">
			<thead>
			<tr class="paintLightgray">
				<td><input type="checkbox" id="checkboxTdAll" value="전체"></td>
				<td> 지점관리번호 </td>
				<td> 기업명 </td>
				<td> 기업구분 </td>
				<td> 지점명 </td>
				<td> 합계 </td>
				<td> 공급액 </td>
				<td> 세액 </td>
				<td> 결제수단 </td>
				<td> 정산여부 </td>
				<td> 대상거래명세서 </td>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="uc" items="${list}">
				<tr class="td" data-type="${uc.comBizType}" recNo = ${uc.recNo }>
					<td><input type="checkbox" name="checkboxTd"></td>
					<td>${uc.spotNo }</td>
					<td><a href="/companyView?companyNo=${uc.companyNo}">${uc.comName }</a></td>
					<td>${uc.comBizType }</td>	
					<td><a href="/spotView?spotNo=${uc.spotNo}">${uc.spName }</a></td>	
					<td><fmt:formatNumber value="${uc.recSum - uc.recDed + uc.recAdd}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${uc.recSup - uc.recDedSup + uc.recAddSup}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${uc.recTax - uc.recDedTax + uc.recAddTax}" pattern="#,###"/></td>
					<td>${uc.recPayMth }</td>
					<td>${uc.recSortation }</td>
					<td><a href="/tradeDetailEdit?recNo=${uc.recNo }">보기</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="pagination" class="page-wrap" style="width: 1200;">	
	    <ul class="page-nation">
	        <!-- 페이지네이션은 이곳에 동적으로 생성 -->
	    </ul>
    </div>
</body>
<script>
    let deptNo = <%= session.getAttribute("deptNo") %>;
</script>
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/ioBill/iofBillOption.js"></script> 
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/ioBill/iofBillSearch.js"></script> 

</html>