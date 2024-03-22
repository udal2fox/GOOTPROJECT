<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/companyMgmt.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title></title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
		<table class="searchBar_tbl">
			<thead>
				<tr>
					<th>키워드</th>
					<td>
						<input type="text" class="searchBarKeyword" name="searchBarKeyword" placeholder="기업명/사업자번호/주소/연락처" style="text-align: center;">
					</td>
					<td></td>
					<th>지역</th>
					<td>
					<div class="checkbox_div">
	
						<input type="checkbox" class="searchbar_checkbox" name="area" value="전체" checked="checked" id="comArea_typeAll"  data-check-all="comArea_type">
						<label class="searchbar_checkbox_lable" for="comArea_typeAll">전체</label>
						<input type="checkbox" class="searchbar_checkbox_filter" name="area" value="서울" checked="checked" id="comArea_seoul"  data-filter="comArea_type">
						<label class="searchbar_checkbox_lable" for="comArea_seoul">서울</label>
						<input type="checkbox" class="searchbar_checkbox_filter" name="area" value="경기" checked="checked" id="comArea_gyeonggi"  data-filter="comArea_type">
						<label class="searchbar_checkbox_lable" for="comArea_gyeonggi">경기</label>
						<input type="checkbox" class="searchbar_checkbox_filter" name="area" value="부산" checked="checked" id="comArea_busan"  data-filter="comArea_type">
						<label class="searchbar_checkbox_lable" for="comArea_busan">부산</label>
						<input type="checkbox" class="searchbar_checkbox_filter" name="area" value="그 외" checked="checked" id="comArea_etc"  data-filter="comArea_type">
						<label class="searchbar_checkbox_lable" for="comArea_etc">그 외</label>
					
					</div>
					</td>
					<td></td>
				
				</tr>
				<tr>
					<th>기업 구분</th>
					<td>
					<div class="radioBtn_div">
						<input type="radio" class="searchbar_radioBtn_filter" name="bizType" value="전체" checked="checked" id="bizType_typeAll"  data-check-all="bizType_type">
						<label class="searchbar_radioBtn_lable" for="bizType_typeAll">전체</label>
						<input type="radio" class="searchbar_radioBtn_filter" name="bizType" value="법인" id="bizType_corporation"  data-filter="bizType_type">
						<label class="searchbar_radioBtn_lable" for="bizType_corporation">법인</label>
						<input type="radio" class="searchbar_radioBtn_filter" name="bizType" value="개인" id="bizType_individual"  data-filter="bizType_type">
						<label class="searchbar_radioBtn_lable" for="bizType_individual">개인</label>
					
					</div>
					</td>
					<td></td>
					<th>업태</th>
					<td>
						<select class="searchbar_selectbox_filter" name="searchBarBizStatus" id="searchBarBizStatus" style="text-align: center;">
							<option value="선택">선택</option>
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
			</div>
			
		
			<div class="download_to_excel_btn_div">
				<input type="file" class="custom-file-input" id="excelUpload" name="EXCEL" multiple="multiple" style="display: none;">
                <button type="button" class="btn btn-primary" id="uploadBtn">엑셀 업로드</button>
                <button type="button" class="btn btn-primary" id="downloadButton">엑셀 다운로드</button>
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
	 <form>
      <table class="list_div_tbl" id="company_tbl">
         <thead>
            <tr class="top_bar_of_list">
               <th>번호<button type="button" class="sort-btn" data-column="companyNo">🔽</button></th>
			   <th>기업명<button type="button" class="sort-btn" data-column="comName">🔽</button></th>
               <th>사업자 번호</th>
               <th>사업자 구분<button type="button" class="sort-btn" data-column="comBizType">🔽</button></th>
               <th>지역<button type="button" class="sort-btn" data-column="comArea">🔽</button></th>
               <th>주소</th>
               <th>연락처</th>
               <th>업태<button type="button" class="sort-btn" data-column="comBizStatus">🔽</button></th>
            </tr>
            </thead>
  			<tbody>
      			 <c:forEach var="vo" items="${companyVO }">
               <tr class="companyList" data-type="${vo.comArea}">
                  <td><a href="${vo.companyNo }">${vo.companyNo }</a></td>
				  <td>${vo.comName }</td>
                  <td>${vo.comBizNum }</td>
                  <td>${vo.comBizType }</td>
                  <td>${vo.comArea }</td>
                  <td>${vo.comAddr }</td>
                  <td>${vo.comContact }</td>
				  <td>${vo.comBizStatus }</td>
               </tr>
            </c:forEach>
            
         </tbody>
      </table>
</form>

</div>
<div id="pagination" class="page-wrap" style="width: 1200;">	
    <ul class="page-nation">
        <!-- 페이지네이션은 이곳에 동적으로 생성 -->
        
    </ul>
    </div>
</div>


</div>
	<div class="btn_div">
		<button type="button" class="companyListBtns" id="moveCompanyRegisterBtn" onclick="location.href='/moveCompanyRegister'">기업 등록</button>
		
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyFilter.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companySearch.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyMgmt.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyUpDownLoad.js"></script>
</body>
</html>