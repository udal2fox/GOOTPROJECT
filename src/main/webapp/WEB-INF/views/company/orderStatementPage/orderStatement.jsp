<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../navBar.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/company/salesStatisticsPage/salesStatsView.css">
<script type="text/javascript" src="/resources/js/navBar.js"></script>

<body>
	<div class="container-fluid" align="center">
	
	<table class="saleStatsTableSearch">
				<tr class="rowWhite">
					<td colspan="10">거래명세 </td>
				</tr>
			
			<tr>
				<td>&nbsp;</td>
			</tr>
				<tr>
					<td> 키워드   </td> 
					<td colspan="2"> <input type="text" placeholder="거래명세번호/기업명/지점명"> </td>
					<td><input type="button" class="termBtn btn btn-primary" id="paintLightblue" value="검색"></td>
					<td><input type="button" class="termBtn btn btn-primary" id="paintLightblue" value="초기화"></td>
					<td> 결제수단 </td>
					<td colspan="2"> 
						<select class="form-select">
							<option>신용카드</option>
							<option>계좌이체</option>
							<option>간편결제</option>
						</select>
					</td>	
				</tr>
			<tr>
				<td> 기업 구분 </td>
				<td> 
				    <div class="form-check">
						<input class="form-check-input" checked="checked" type="checkbox" id="product-statusAll" name="categoryAll" value="전체"> 전체 
						<input class="form-check-input filter-checkbox" checked="checked" type="checkbox" name="categoryGiftcard" value="법인"> 법인  
						<input class="form-check-input filter-checkbox" checked="checked" type="checkbox" name="categorySelling" value="개인"> 개인
					</div>
				</td>	
			</tr>	
			<tr>
				<td> 상품 분류 </td>
				<td colspan="4">
					<input class="form-check-input" type="checkbox" name="categoryAll" value="전체"> 전체 
					<input class="form-check-input filter-checkbox" type="checkbox" name="categoryGiftcard" value="결제완료"> 결제완료  
					<input class="form-check-input filter-checkbox" type="checkbox" name="categorySelling" value="계산서발행"> 계산서 발행
					<input class="form-check-input filter-checkbox" type="checkbox" name="categorySelling" value="계산서미발행"> 계산서 미발행
					<input class="form-check-input filter-checkbox" type="checkbox" name="categorySelling" value="카드미결제"> 카드 미결제
					<input class="form-check-input filter-checkbox" type="checkbox" name="categorySelling" value="대손처리"> 대손처리
			</tr>
			<tr>
				<td>기간</td>
				<td><input type="text" class="termInput" placeholder="내용을 입력하세요"> ~ <input type="text" class="termInput" placeholder="내용을 입력하세요"></td>
				<td><input type="button" class="termBtn" value="오늘"></td>
				<td><input type="button" class="termBtn" value="최근 1주"></td>
				<td><input type="button" class="termBtn" value="이번달"></td>
				<td><input type="button" class="termBtn" value="지난달"></td>
				<td><input type="button" class="termBtn" value="지난분기"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<input type="file" class="custom-file-input" id="excelUpload" name="EXCEL" multiple="multiple" style="display: none;">
				<td><input type="button" class="termBtnDown btn btn-primary" id="paintLightblue" value="엑셀로 내려받기"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		
		<table border="1" class="saleStatsTableInfo">
			<tr>
				<td class="paintLightgray"><input type="checkbox" name="categoryAll" value="전체"></td>
				<td class="paintLightgray">날짜<button type="button" class="sort-btn" data-column="recDate">🔽</button></td>
				<td class="paintLightgray"> 지점관리번호<button type="button" class="sort-btn" data-column="spotNo">🔽</button></td>
				<td class="paintLightgray"> 기업명 <button type="button" class="sort-btn" data-column="getCName">🔽</button></td>
				<td class="paintLightgray"> 기업구분 <button type="button" class="sort-btn" data-column="getCBizType">🔽</button></td>
				<td class="paintLightgray"> 지점명 <button type="button" class="sort-btn" data-column="getSName">🔽</button></td>
				<td class="paintLightgray"> 합계 <button type="button" class="sort-btn" data-column="recSum">🔽</button></td>
				<td class="paintLightgray"> 공급액 <button type="button" class="sort-btn" data-column="recSup">🔽</button></td>
				<td class="paintLightgray"> 세액<button type="button" class="sort-btn" data-column="recTax">🔽</button> </td>
				<td class="paintLightgray"> 결제수단<button type="button" class="sort-btn" data-column="recPayMth">🔽</button></td>
				<td class="paintLightgray"> 정산여부<button type="button" class="sort-btn" data-column="recPayStat">🔽</button></td>
				<td class="paintLightgray"> 대상 거래명세서<button type="button" class="sort-btn" data-column="recNo">🔽</button></td>
			</tr>
			
			<c:forEach var="ordStat" items="${ordStatlist}">
				<tr class="product" data-type="${ordStat.getCBizType()}" data-status="${ordStat.recPayStat}">
					<td> <input type="checkbox" name="categoryAll" value="전체"> </td>
					<td> ${ordStat.recDate} </td>
					<td> ${ordStat.spotNo} </td>
					<td> ${ordStat.getCName()} </td>
					<td> ${ordStat.getCBizType()} </td>
					<td> ${ordStat.getSName()} </td>
					<td> ${ordStat.recSum} </td>
					<td> ${ordStat.recSup} </td>
					<td> ${ordStat.recTax} </td>
					<td> ${ordStat.recPayMth} </td>
					<td> ${ordStat.recPayStat} </td>
					<td> ${ordStat.recNo} </td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div class="pageNum">
	<input type="button" value="<"> &nbsp; <input type="button" value="1"> &nbsp; <input type="button" value="2"> &nbsp; <input type="button" value="3"> &nbsp; <input type="button" value="4"> &nbsp; <input type="button" value=">">
	</div>

<script type="text/javascript" src="/resources/js/company/orderStatementPage/orderStatementFilter.js"></script> 
<script type="text/javascript" src="/resources/js/company/orderStatementPage/orderStatementSearch.js"></script>

	
</body>
</html>