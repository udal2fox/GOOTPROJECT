<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../navBar.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link rel="stylesheet" href="/resources/css/company/calculateMGTPage/TradeDetailPage.css">
<body>
	<div class="container-fluid" align="center">
		<table class="saleStatsTableSearch">
			<tr class="rowWhite">
				<td colspan="10"><h2>거래명세</h2> </td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
				<tr>
					<td> 키워드   </td> 
					<td colspan="2"> <input type="text" placeholder="거래명세번호/기업명/지점명"> </td>
					<td><input type="button" class="btn btn-primary" value="검색"></td>
					<td><input type="button" class="btn btn-primary" value="초기화" id="reset"></td>
					<td align="center" style="padding-right:15px;"> 결제수단 </td>
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
					<input class="form-check-input" type="checkbox" id="td-BusinessAll" value="전체" checked> 전체
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business" value="법인" checked> 법인   
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business"value="개인" checked> 개인
				</td>	
			</tr>	
			<tr>
				<td> 정산 구분 </td>
				<td colspan="4">
					<input class="form-check-input" type="checkbox" id="td-calculateAll" value="전체" checked> 전체 
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="결제완료" checked> 결제완료  
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="계산서발행" checked> 계산서 발행
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="계산서미발행" checked> 계산서 미발행
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="카드미결제" checked> 카드 미결제
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="대손처리" checked> 대손처리
				</td>	
			</tr>
			<tr>
				<td>기간</td>
				<td>
					<input class="datePick1" type="text" placeholder="날짜를 선택하세요.." readonly="readonly">
					 ~ 
					<input class="datePick2" type="text" placeholder="날짜를 선택하세요.." readonly="readonly">
				</td>
				<td><input type="button" class="btn btn-secondary" value="오늘"></td>
				<td><input type="button" class="btn btn-secondary" value="최근 1주"></td>
				<td><input type="button" class="btn btn-secondary" value="이번달"></td>
				<td><input type="button" class="btn btn-secondary" value="지난달"></td>
				<td><input type="button" class="btn btn-secondary" value="지난분기"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="file" class="custom-file-input" id="excelUpload" name="EXCEL" style="display: none;">
					<input type="button" class="btn btn-primary" style="width: 135px; height: 35px;" value="엑셀로 내려받기">
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		
		<table border="1" class="saleStatsTableInfo">
			<thead>
			<tr>
				<th><input type="checkbox" name="categoryAll" value="전체"></th>
				<th>거래명세번호</th>
				<th>기업명</th>
				<th>기업구분</th>
				<th>지점명</th>
				<th>일자<button type="button" class="sort-btn" data-column="recDate">🔽</button></th>
				<th>합계<button type="button" class="sort-btn" data-column="recSum">🔽</button></th>
				<th>공급액</th>
				<th>세액</th>
				<th>원가</th>
				<th>마진율</th>
				<th>결제수단</th>
				<th>정산여부</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="td" items="${list}">
					<tr class="td" data-type="${td.comBizType}" data-status="${td.recSortation}">
						<td><input type="checkbox" name="categoryAll"></td>
						<td>${td.recNo}</td>
						<td>${td.comName}</td>
						<td>${td.comBizType}</td>
						<td>${td.spName}</td>
						<td>${td.recDate}</td>
						<td>${td.recSum}</td>
						<td>${td.recSup}</td>
						<td>${td.recTax}</td>
						<td>${td.prdCstPri}</td>
						<td>${td.prdMargin * 100}%</td>
						<td>${td.recPayMth}</td>
						<td>${td.recSortation}</td>
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
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/tdPageFilter.js"></script> 
	
</html>