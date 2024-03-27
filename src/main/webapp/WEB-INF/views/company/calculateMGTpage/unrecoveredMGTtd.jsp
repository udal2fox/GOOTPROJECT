<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="../../navBar.jsp" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link rel="stylesheet" href="/resources/css/company/calculateMGTPage/TradeDetailPage.css">
<body>
	<div class="container-fluid" align="center">
	
		<table class="saleStatsTableSearch">
			<tr class="rowWhite">
				<td colspan="10"><h2>미수관리</h2></td>
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
				<td> 상품 분류 </td>
				<td colspan="4">
					<input class="form-check-input" type="checkbox" id="td-calculateAll" value="전체" checked> 전체 
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="계산서발행" checked> 계산서 발행
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="계산서미발행" checked> 계산서 미발행
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-calculate" value="카드미결제" checked> 카드 미결제
				</td>	
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td> 결제수단 </td>
				<td> 
					<select class="form-select payMth" style="width: 318px;">
						<option data-filter="td-pay" value="전체">전체</option>
						<option data-filter="td-pay" value="신용카드">신용카드</option>
						<option data-filter="td-pay" value="계좌이체">계좌이체</option>
						<option data-filter="td-pay" value="간편결제">간편결제</option>
					</select>
				</td>
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
				<td><input type="button" class="btn btn-secondary dateBtn" value="오늘"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="최근1주"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="이번달"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="지난달"></td>
				<td><input type="button" class="btn btn-secondary dateBtn" value="지난분기"></td>
				
				<td><input type="button" class="btn btn-primary" value="엑셀로 내려받기" style="width: 135px; height: 35px;" id="downloadButton"></td>
			</tr>
			<tr>
				<td> 출력기준 </td>
				<td colspan="4">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="comPage" value="기업" name="inlineRadioOptions">
						<label class="form-check-label" for="comPage">기업</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="branchPage" value="지점" name="inlineRadioOptions">
						<label class="form-check-label" for="branchPage">지점</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="tdPage" value="거래명세서" name="inlineRadioOptions" <c:if test="${pst eq '거래명세' }">checked="checked"</c:if>>
						<label class="form-check-label" for="tdPage">거래명세서</label>
					</div>
				</td>	
			</tr>
		</table>
		<div class ="misu" style="padding-top: 25px">
			<div>
				  <span class="misuTotal"> 000,000,000원</span>	
			</div>
			<div>	
				<input type="button" class="btn btn-primary ucMailSend" id="" value="미납 안내메일 발송" style="width: 185px; height: 35px;">	
			</div>	
		</div>

		<table border="1" class="saleStatsTableInfo">
			<thead>
			<tr class="paintLightgray">
				<td><input type="checkbox" id="checkboxTdAll" value="전체"></td>
				<td> 거래명세번호 </td>
				<td> 기업명 </td>
				<td> 기업구분 </td>
				<td> 지점명 </td>
				<td> 일자 </td>
				<td> 합계 </td>
				<td> 공급액  </td>
				<td> 세액</td>
				<td> 원가 </td>
				<td> 마진율 </td>
				<td> 결제수단 </td>
				<td> 정산여부 </td>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="uc" items="${ucList}">
				<tr class="td" data-type="${uc.comBizType}" data-status="${uc.recSortation}" com-Email= "${uc.comEmail}">
					<td><input type="checkbox" name="checkboxTd"></td>
					<td><a href="/tradeDetailEdit?recNo=${uc.recNo }">${uc.recNo }</a></td>
					<td><a href="/companyView?companyNo=${td.companyNo}">${uc.comName }</a></td>
					<td>${uc.comBizType }</td>
					<td><a href="/spotView?spotNo=${td.spotNo}">${uc.spName }</a></td>
					<td>${uc.recDate }</td>
					<td><fmt:formatNumber value="${uc.recSum - uc.recDed + uc.recAdd}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${uc.recSup - uc.recDedSup + uc.recAddSup}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${uc.recTax - uc.recDedTax + uc.recAddTax}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${uc.prdCstPri}" pattern="#,###"/></td>
					<td>${uc.prdMargin }</td>
					<td>${uc.recPayMth }</td>
					<td>${uc.recSortation }</td>
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
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/ucMgt/UcDefault.js"></script> 
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/ucMgt/UcMgttd.js"></script> 
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/ucMgt/UcMgttdSearch.js"></script> 
<script type="text/javascript" src="/resources/js/company/calculateMGTpage/ucMgt/ucMgtDownDo.js"></script> 
</html>