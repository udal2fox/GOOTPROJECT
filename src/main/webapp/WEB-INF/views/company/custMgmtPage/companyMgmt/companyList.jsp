<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/companyMgmt.css">
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
					<td></td>
					<th>키워드</th>
					<td>
						<input type="text" class="searchBarKeyword" id="keyword" name="searchBarKeyword" placeholder="기업명/사업자번호/주소/연락처" style="text-align: center;">
					</td>
					<td></td>
					<th>기업 구분</th>
					<td> 
					
					<input class="form-check-input" type="checkbox" id="td-BusinessAll" value="전체" checked>전체
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business" value="법인" checked>법인   
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="td-Business" value="개인" checked>개인
					
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
               <th>번호</th>
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
              <tr class="td" data-type="${vo.comBizType}">
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
</div>
    <!--페이지 부분제거후 js 로 그릴예정 -->
    <!-- page -->
    <div id="pagination" class="page-wrap" align="center" style="width: 1500px;">	
    <ul class="page-nation">
        <!-- 페이지네이션은 이곳에 동적으로 생성 -->
        
    </ul>
</div>



	<div class="btn_div">
		<button type="button" class="companyListBtns" id="moveCompanyRegisterBtn" onclick="location.href='/moveCompanyRegister'">기업 등록</button>
		
	</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyFilter.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companySearch.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyMgmt.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyUpDownLoad.js"></script>
</body>
</html>