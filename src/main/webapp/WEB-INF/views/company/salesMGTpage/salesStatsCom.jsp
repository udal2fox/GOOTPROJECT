<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="../../navBar.jsp" %> 

<link rel="stylesheet" href="/resources/css/company/calculateMGTPage/TradeDetailPage.css">
<body>
	<div class="container-fluid" align="center">
	
		<table class="saleStatsTableSearch">
			<tr class="rowWhite">
				<td colspan="10"><h2>기업매출 통계</h2></td>
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
				<td colspan="2"> <input type="text" placeholder="지점관리번호/기업명" style="width: 318px;" id="tdKeyword"> </td>
				<td><input type="button" class="btn btn-primary" value="검색" id="search"></td>
				<td><input type="button" class="btn btn-primary" value="초기화" id="reset"></td>	
			</tr>
			<tr>
				<td>기간</td>
				<td colspan="2">
					<input type="text" class="datePick1" placeholder="내용을 입력하세요"  style="width: 150px" > ~ 
					<input type="text" class="datePick2" placeholder="내용을 입력하세요" style="width: 150px">
				</td>
				<td><input type="button" class="btn btn-primary dateBtn" value="오늘"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="최근1주"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="이번달"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="지난달"></td>
				<td><input type="button" class="btn btn-primary dateBtn" value="지난분기"></td>
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
			<tr>
				<td class="paintLightgray">VAT 별도</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
			</tr>		
			<tr>
				<td class="paintLightgray">VAT 포함</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
			</tr>	
		</table>
		
	<table border="1" class="saleStatsTableInfo">
			<thead>
			<tr class="paintLightgray">
				<td> 기업관리번호 </td>
				<td> 기업명 </td>
				<td> 매출액 </td>
				<td> 매출액-공급액 </td>
				<td> 매출액-세액 </td>
				<td> 매입액 </td>
				<td> 매입액공급액 </td>
				<td> 매입액-세액 </td>
				<td> 조정금액 </td>
				<td> 조정금액-공급액 </td>
				<td> 조정금액-세액 </td>
				<td> 마진율</td>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="ex" items="${list }">
					<tr>
						<td>${ex.companyNo }</td>
						<td>${ex.companyName }</td>
						<td>${ex.recSumTotal }</td>
						<td>${ex.recSupTotal }</td>
						<td>${ex.recTaxTotal }</td>
						<td>${ex.prdCstPriTotal }</td>
						<td>${ex.prdCstSupTotal }</td>
						<td>${ex.prdCstTaxTotal }</td>
						<td>${ex.resADTotal }</td>
						<td>${ex.resADSupTotal }</td>
						<td>${ex.resADTaxTotal }</td>
						<td>${(ex.resADTotal + ex.recSumTotal - ex.prdCstPriTotal) / ex.recSumTotal }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	
</body>
</html>