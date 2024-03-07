<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../navBar.jsp" %> 

<link rel="stylesheet" href="/resources/css/company/salesStatisticsPage/salesStatsView.css">
<script type="text/javascript" src="/resources/js/navBar.js"></script>

<body>
	<div class="container-fluid" align="center">
	
		<table class="saleStatsTableSearch">
				<tr class="rowWhite">
					<td colspan="10">계산서 발행 </td>
				</tr>
			
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td> 키워드   </td> 
				<td colspan="2"> <input type="text" placeholder="지점관리번호/기업명"> </td>
				<td>&nbsp;</td>
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
				<td>기간</td>
				<td><input type="text" class="termInput" placeholder="내용을 입력하세요"> ~ <input type="text" class="termInput" placeholder="내용을 입력하세요"></td>
				<td><input type="button" class="termBtn" value="오늘"></td>
				<td><input type="button" class="termBtn" value="최근일주"></td>
				<td><input type="button" class="termBtn" value="이번달"></td>
				<td><input type="button" class="termBtn" value="지난달"></td>
				<td><input type="button" class="termBtn" value="지난분기"></td>
				<td><input type="button" class="termBtn" id="paintLightblue" value="검색"></td>
				<td><input type="button" class="termBtn" id="paintLightblue" value="초기화"></td>
				<td><input type="button" class="termBtnDown" id="paintLightblue" value="계산서 발행"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
				
		<table border="1" class="saleStatsTableInfo">
			<tr>
				<td class="paintLightgray"><input type="checkbox" name="categoryAll" value="전체"></td>
				<td class="paintLightgray"> 지점관리번호 </td>
				<td class="paintLightgray"> 기업명 </td>
				<td class="paintLightgray"> 기업구분 </td>
				<td class="paintLightgray"> 지점명 </td>
				<td class="paintLightgray"> 합계 </td>
				<td class="paintLightgray"> 공급액 </td>
				<td class="paintLightgray"> 세액 </td>
				<td class="paintLightgray"> 결제수단 </td>
				<td class="paintLightgray"> 정산여부 </td>
				<td class="paintLightgray"> 대상 거래명세서 </td>
				
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