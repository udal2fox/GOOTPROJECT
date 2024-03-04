<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../navBar.jsp" %> 

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
				<td>&nbsp;</td>
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
					<input type="checkbox" name="categoryAll" value="전체"> 전체 
					<input type="checkbox" name="categoryGiftcard" value="법인"> 법인  
					<input type="checkbox" name="categorySelling" value="개인"> 개인
				</td>	
			</tr>	
			<tr>
				<td> 상품 분류 </td>
				<td colspan="4">
					<input type="checkbox" name="categoryAll" value="전체"> 전체 
					<input type="checkbox" name="categoryGiftcard" value="결제완료"> 결제완료  
					<input type="checkbox" name="categorySelling" value="계산서발행"> 계산서 발행
					<input type="checkbox" name="categorySelling" value="계산서미발행"> 계산서 미발행
					<input type="checkbox" name="categorySelling" value="카드미결제"> 카드 미결제
					<input type="checkbox" name="categorySelling" value="대손처리"> 대손처리
			</tr>
			<tr>
				<td>기간</td>
				<td><input type="text" class="termInput" placeholder="내용을 입력하세요"> ~ <input type="text" class="termInput" placeholder="내용을 입력하세요"></td>
				<td><input type="button" class="termBtn" value="오늘"></td>
				<td><input type="button" class="termBtn" value="최근일주"></td>
				<td><input type="button" class="termBtn" value="이번달"></td>
				<td><input type="button" class="termBtn" value="지난달"></td>
				<td><input type="button" class="termBtn" value="지난분기"></td>
				<td><input type="button" class="termBtn" id="paintLightblue" value="검색"></td>
				<td><input type="button" class="termBtn" id="paintLightblue" value="초기화"></td>
				<td><input type="button" class="termBtnDown" id="paintLightblue" value="엑셀로 내려받기"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		
		<table border="1" class="saleStatsTableCal">
			<tr>
				<td class="paintLightgray"></td>
				<td class="paintLightgray">기업수</td>
				<td class="paintLightgray">매출합계</td>
				<td class="paintLightgray">매입합계</td>
				<td class="paintLightgray">조정금액합계</td>
				<td class="paintLightgray">마진율</td>
			</tr>
			<tr>
				<td class="paintLightgray">VAT 별도</td>
				<td>자동 계산 구문</td>
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
				<td>자동 계산 구문</td>
			</tr>	
		</table>
		
		<table border="1" class="saleStatsTableInfo">
			<tr>
				<td class="paintLightgray"> 기업관리번호 </td>
				<td class="paintLightgray"> 기업명 </td>
				<td class="paintLightgray"> 매출액 </td>
				<td class="paintLightgray"> 매출액·공급액 </td>
				<td class="paintLightgray"> 매출액·세액 </td>
				<td class="paintLightgray"> 매입액 </td>
				<td class="paintLightgray"> 매출액·공급액 </td>
				<td class="paintLightgray"> 매출액·세액 </td>
				<td class="paintLightgray"> 조정금액 </td>
				<td class="paintLightgray"> 조정금액·공급액 </td>
				<td class="paintLightgray"> 조정금액·세액</td>
				<td class="paintLightgray"> 마진율</td>
			</tr>
		
			<tr>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
				<td> 불러오기 </td>
			</tr>
			
		</table>
	</div>

	<div class="pageNum">
	<input type="button" value="<"> &nbsp; <input type="button" value="1"> &nbsp; <input type="button" value="2"> &nbsp; <input type="button" value="3"> &nbsp; <input type="button" value="4"> &nbsp; <input type="button" value=">">
	</div>
	
</body>
</html>