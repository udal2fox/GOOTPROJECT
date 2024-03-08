<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../navBar.jsp" %> 

<link rel="stylesheet" href="/resources/css/company/salesStatisticsPage/salesStatsView.css">
<script type="text/javascript" src="/resources/js/navBar.js"></script>

<body>
	<div class="container-fluid" align="center">
	
		<table class="saleStatsTableSearch">
				<tr class="rowWhite">
					<td colspan="10">기업별 매출통계 </td>
				</tr>
			
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td> 키워드   </td> 
				<td colspan="3"> <input type="text" placeholder="상품코드/대분류/소분류/상품명"> </td>
				<td colspan="2"></td>
				<td> 상품상태 </td>
				<td colspan="3"> 
					<input type="checkbox" name="goodsAll" value="전체"> 전체 
					<input type="checkbox" name="goodssale" value="판매중"> 판매중 
					<input type="checkbox" name="goodsSoldout" value="일시품절"> 일시품절 
				</td>	
			</tr>
			<tr>
				<td> 상품 분류 </td>
				<td> 
					<input type="checkbox" name="categoryAll" value="전체"> 전체 
					<input type="checkbox" name="categoryGiftcard" value="상품권"> 상품권  
					<input type="checkbox" name="categorySelling" value="현물"> 현물 
				</td>	
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
			<tr>
				<td class="paintLightgray"> 상품코드 </td>
				<td class="paintLightgray"> 대분류 </td>
				<td class="paintLightgray"> 소분류 </td>
				<td class="paintLightgray"> 상품명 </td>
				<td class="paintLightgray"> 매출합계 </td>
				<td class="paintLightgray"> 매입합계 </td>
				<td class="paintLightgray"> 전체마진율 </td>
				<td class="paintLightgray"> 상품판매가 </td>
				<td class="paintLightgray"> 상품원가 </td>
				<td class="paintLightgray"> 상품마진율 </td>
				<td class="paintLightgray"> 상품상태 </td>
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
			</tr>
			
		</table>
	</div>

	<div class="pageNum">
	<input type="button" value="<"> &nbsp; <input type="button" value="1"> &nbsp; <input type="button" value="2"> &nbsp; <input type="button" value="3"> &nbsp; <input type="button" value="4"> &nbsp; <input type="button" value=">">
	</div>
	
</body>
</html>