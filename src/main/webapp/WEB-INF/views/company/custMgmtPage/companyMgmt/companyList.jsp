<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/companyMgmt.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title></title>

</head>
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp"/>
	</div>
	<div class="container-fluid" align="center" style="padding: 100px;">
	<div class="entire">

	<div class="title" align="left">
		<h3>기업 관리</h3>
	</div>
	<div class="searchBar_div">
	<form method="post">
		<table class="searchBar_tbl">
			<thead>
				<tr>
					<th>키워드</th>
					<td>
						<input type="text" name="searchBarKeyword" placeholder="기업명/사업자번호/주소/연락처" style="text-align: center;">
					</td>
					<td></td>
					<th>지역</th>
					<td>
					<div class="checkbox_div">
						<input type="checkbox" name="area" value="전체" checked="checked">전체
						<input type="checkbox" name="area" value="서울" checked="checked">서울
						<input type="checkbox" name="area" value="경기" checked="checked">경기
						<input type="checkbox" name="area" value="부산" checked="checked">부산
						<input type="checkbox" name="area" value="그 외" checked="checked">그 외
					</div>
					</td>
					<td></td>
				
				</tr>
				<tr>
					<th>기업 구분</th>
					<td>
					<div class="radioBtn_div">
						<input type="radio" name="bizType" value="전체" checked="checked">전체
						<input type="radio" name="bizType" value="법인">법인
						<input type="radio" name="bizType" value="개인">개인
					
					</div>
					</td>
					<td></td>
					<th>업태</th>
					<td>
						<select name="searchBarBizStatus" id="searchBarBizStatus" style="text-align: center;">
							<option value="선택">==선택==</option>
							<option value="농업 및 임업">농업 및 임업</option>
							<option value="어업">어업</option>
							<option value="광업">광업</option>
							<option value="제조업">제조업</option>
							<option value="전기,가스 및 수도사업">전기,가스 및 수도사업</option>
							<option value="건설업">건설업</option>
							<option value="도매 및 소매업">도매 및 소매업</option>
							<option value="숙박 및 음식점업">숙박 및 음식점업</option>
							<option value="운수업">운수업</option>
							<option value="통신업">통신업</option>
							<option value="금융 및 보험업">금융 및 보험업</option>
							<option value="부동산업 및 임대업">부동산업 및 임대업</option>
							<option value="사업서비스업">사업서비스업</option>
							<option value="공공행정,국방 및 사회보장행정">공공행정,국방 및 사회보장행정</option>
							<option value="교육 서비스업">교육 서비스업</option>
							<option value="보건 및 사회복지사업">보건 및 사회복지사업</option>
							<option value="오락,문화 및 운동관련산업">오락,문화 및 운동관련산업</option>
							<option value="기타 공공,수리 및 개인서비스 업">기타 공공,수리 및 개인서비스 업</option>
							<option value="기타">기타</option>
						</select>
					</td>
					<td></td>
				</tr>
			</thead>
		</table>
			<input type="button" class="companyListBtns" id="searchBarSearchBtn" value="검색">
			<input type="reset"  id="searchBarResetBtn" value="초기화">
		</form>
			</div>
			
		
			<div class="download_to_excel_btn_div">
				<input type="button" class="companyListBtns" id="downloadExcelBtn" value="엑셀로 내려받기">
			</div>
			<div class="viewAFew_div">
				<select name="viewAFew" id="selectViewAFew">
								<option value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="75">75</option>
								<option value="100">100</option>
							
				</select>
				개씩 보기
			</div>
	

	
	<div class="list_div">
		
	 <div>
      <table class="list_div_tbl">
         <thead>
            <tr class="top_bar_of_list">
               <th>번호</th>
               <th>기업명</th>
               <th>사업자 번호</th>
               <th>사업자 구분</th>
               <th>지역</th>
               <th>주소</th>
               <th>연락처</th>
               <th>업태</th>
            </tr>
            </thead>
  			<tbody>
      			<tr>
				<td><a href="/companyView">1</a></td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				
				</tr>
            
         </tbody>
      </table>


</div>
</div>
	<div class="btn_div">
		<input type="button"  class="companyListBtns" id="moveCompanyRegisterBtn" value="기업 등록">
	</div>
</div>
</div>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyMgmt.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotMgmt.js"></script>
</body>
</html>