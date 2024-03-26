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
				<td colspan="10"><h2>상품별 매출통계</h2></td>
			</tr>
			<tr>
				<td> 기업 구분 </td>
				<td> 
					<input class="form-check-input" type="checkbox" id="td-BusinessAll" value="전체" checked> 전체
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business" value="상품권" checked> 상품권   
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business"value="현물" checked> 현물
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
					<input type="text" class="datePick1 form-control" placeholder="내용을 입력하세요"  style="width: 150px" > &nbsp;~&nbsp; 
					<input type="text" class="datePick2 form-control" placeholder="내용을 입력하세요" style="width: 150px">
				</td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="오늘"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="최근1주"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="이번달"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="지난달"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="지난분기"></td>
				<td><input type="button" class="btn btn-primary" value="엑셀로 내려받기" style="width: 135px; height: 35px;" id="downloadButton"></td>
			</tr>
		</table>
		
		<table border="1" class="saleStatsTableCal">
			<tr>
				<td class="paintLightgray"></td>
				<td class="paintLightgray">상품수</td>
				<td class="paintLightgray">매출합계</td>
				<td class="paintLightgray">매입합계</td>
				<td class="paintLightgray">마진율</td>
			</tr>
			<tbody class="vat">
			<tr>
				<td class="paintLightgray">VAT 별도</td>
				<td>${stvo.salePrd }</td>
				<td><fmt:formatNumber value="${stvo.totalSum }" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${stvo.totalBuy }" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${(stvo.recAdTotal+stvo.totalSum - stvo.totalBuy)  / stvo.totalSum }"	pattern="0.00"/></td>
			</tr>		
			<tr>
			    <td class="paintLightgray">VAT 포함</td>
			    <td>${stvo.salePrd}</td>
			    <td><fmt:formatNumber value="${stvo.totalSum + (stvo.totalSum * 0.1)}" pattern="#,###"/></td>
			    <td><fmt:formatNumber value="${stvo.totalBuy + (stvo.totalBuy * 0.1)}" pattern="#,###"/></td>
			    <td><fmt:formatNumber value="${(stvo.recAdTotal + stvo.totalSum - stvo.totalBuy) / stvo.totalSum}" pattern="0.00"/></td>
			</tr>
			</tbody>
		</table>
		
	<table border="1" class="saleStatsTableInfo">
			<thead>
			<tr class="paintLightgray">
				<td> 상품코드 </td>
				<td> 대분류 </td>
				<td> 소분류 </td>
				<td> 상품명 </td>
				<td> 매출합계 </td>
				<td> 매입합계 </td>
				<td> 전체마진율 </td>
				<td> 상품판매가 </td>
				<td> 상품원가 </td>
				<td> 상품마진율 </td>
				<td> 상품상태 </td>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="ex" items="${list }">
					<tr class="td" data-type="${ex.prdMajorCtg}">
					<td>${ex.prdNo }</td>
					<td>${ex.prdMajorCtg }</td>
					<td>${ex.prdSubCtg }</td>
					<td>${ex.prdName }</td>
					<td><fmt:formatNumber value="${ex.totalSum }" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${ex.totalCstPri }" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${ex.totalMagin }" pattern="0.00"/></td>
					<td><fmt:formatNumber value="${ex.prdSal }" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${ex.prdCstPri }" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${ex.prdMargin }" pattern="0.00"/></td>
					<td>${ex.prdSt }</td>
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
<script type="text/javascript" src="/resources/js/company/salesMGTpage/salesStatsOption.js"></script> 
<script type="text/javascript" src="/resources/js/company/salesMGTpage/salesStatsPrdSearch.js"></script> 
<script type="text/javascript" src="/resources/js/company/salesMGTpage/salesStatsPrdDown.js"></script> 
</html>