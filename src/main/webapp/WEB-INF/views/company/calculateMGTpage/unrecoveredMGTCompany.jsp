<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../navBar.jsp" %> 

<link rel="stylesheet" href="/resources/css/company/calculateMGTPage/TradeDetailPage.css">
<body>
	<div class="container-fluid" align="center">
	
		<table class="saleStatsTableSearch">
				<tr class="rowWhite">
					<td colspan="10"><h2>미수관리</h2></td>
				</tr>
			
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td> 키워드   </td> 
				<td colspan="2"> <input type="text" placeholder="기업관리번호/기업명"> </td>
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
					<input type="checkbox" value="전체"> 전체 
					<input type="checkbox" value="법인"> 법인  
					<input type="checkbox" value="개인"> 개인
				</td>	
			</tr>	
			<tr>
				<td> 상품 분류 </td>
				<td colspan="4">
					<input type="checkbox" value="전체"> 전체 
					<input type="checkbox" value="계산서발행"> 계산서 발행
					<input type="checkbox" value="계산서미발행"> 계산서 미발행
					<input type="checkbox" value="카드미결제"> 카드 미결제
			</tr>
			<tr>
				<td> 출력기준 </td>
				<td colspan="4">
					<input type="radio" value="기업"> 기업 
					<input type="radio" value="지점"> 지점
					<input type="radio" value="거래명세서"> 거래명세서
				</td>	
			</tr>
			<tr>
				<td>기간</td>
				<td><input type="text" class="termInput" placeholder="내용을 입력하세요"> ~ <input type="text" class="termInput" placeholder="내용을 입력하세요"></td>
				<td><input type="button" class="btn btn-primary" value="오늘"></td>
				<td><input type="button" class="btn btn-primary" value="최근일주"></td>
				<td><input type="button" class="btn btn-primary" value="이번달"></td>
				<td><input type="button" class="btn btn-primary" value="지난달"></td>
				<td><input type="button" class="btn btn-primary" value="지난분기"></td>
				<td><input type="button" class="btn btn-primary" value="검색"></td>
				<td><input type="button" class="btn btn-primary" value="초기화"></td>
				<td><input type="button" class="btn btn-primary" value="엑셀로 내려받기" style="width: 135px; height: 35px;"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		
				
		<p></p>
		<p></p>
		
		<div class ="misu">
			<div>
				<p class="misuTotal">총 미수 금액 : 000,000,000원</p>	
			</div>
			<div>	
				<input type="button" class="btn btn-primary" id="" value="미납 안내메일 발송" style="width: 185px; height: 35px;">	
			</div>	
		</div>
		
		<table border="1" class="saleStatsTableCal">
			<tr class="paintLightgray">
				<td></td>
				<td></td>
				<td>매출합계</td>
				<td>매입합계</td>
				<td>조정금액합계</td>
				<td>마진율</td>
			</tr>
			<tr>
				<td >VAT 별도</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
			</tr>		
			<tr>
				<td >VAT 포함</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
				<td>자동 계산 구문</td>
			</tr>	
		</table>

		<table border="1" class="saleStatsTableInfo">
			<tr class="paintLightgray">
				<td><input type="checkbox" name="categoryAll" value="전체"></td>
				<td> 기업관리번호 </td>
				<td> 기업명 </td>
				<td> 기업구분 </td>
				<td> 합계 </td>
				<td> 공급액 </td>
				<td> 세액 </td>
				<td> 원가 마진율 </td>
				<td> 결제수단 </td>
				<td> 정산여부 </td>
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
			</tr>
			
		</table>
	</div>
	<div id="pagination" class="page-wrap" style="width: 1200;">	
	    <ul class="page-nation">
	        <!-- 페이지네이션은 이곳에 동적으로 생성 -->
	        
	    </ul>
    </div>
	
</body>
</html>