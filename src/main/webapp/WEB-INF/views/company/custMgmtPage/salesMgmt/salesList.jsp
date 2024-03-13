<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/salesMgmt.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title></title>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp"/>
	</div>
	<div class="container-fluid" align="center" style="padding: 100px;">
	<div class="entire" >
	<div class="title" align="left">
		<h3>신규 영업</h3>
	</div>

	<div class="searchBar_div">

		<table class="searchBar_tbl">
			<tr>
				<td>

				<div class="searchBar_section">

				<div class="searchBar_section_layout" style="">

				<label>키워드</label>
                        <div class="input-group mb-3" style="width: 320px;margin: 15px;">
                            
                            <input type="text" class="form-control" placeholder="기업명/담당자명/이메일/영업 담당자" aria-label="키워드 입력" aria-describedby="test" id="searchBarKeyword">
                        </div>

				<label>영업 상태</label>
				<div class="checkbox_div"> <!-- form-check -->
				<input type="checkbox" class="searchbar_checkbox" name="serviceStatus" value="전체" checked="checked" id="csStatus_typeAll"  data-check-all="csStatus_type">
				<label class="searchbar_checkbox_lable" for="csStatus_typeAll">전체</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox_filter"  name="serviceStatus" value="최초 인입" checked="checked" data-filter="csStatus_type" id="csStatus_firstIncoming" >
				<label class="searchbar_checkbox_lable" for="csStatus_firstIncoming">최초 인입</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox"  class="searchbar_checkbox_filter"  name="serviceStatus" value="응대 완료" checked="checked" data-filter="csStatus_type" id="csStatus_response">
				<label class="searchbar_checkbox_lable" for="csStatus_response">응대 완료</label>
				</div>
				<div class="checkbox_div">
				<input type="checkbox"  class="searchbar_checkbox_filter" name="serviceStatus" value="견적 발송 완료" checked="checked" data-filter="csStatus_type" id="csStatus_quotationSent">
				<label class="searchbar_checkbox_lable" for="csStatus_quotationSent">견적 발송 완료</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox_filter"  name="serviceStatus" value="미팅 완료" checked="checked" data-filter="csStatus_type"  id="csStatus_meeting">
				<label class="searchbar_checkbox_lable" for="csStatus_meeting">미팅 완료</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox_filter"  name="serviceStatus" value="계약 완료" checked="checked" data-filter="csStatus_type" id="csStatus_contractCompleted">
				<label class="searchbar_checkbox_lable" for="csStatus_contractCompleted">계약 완료</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox_filter"  name="serviceStatus" value="계약 실패" checked="checked"  data-filter="csStatus_type" id="csStatus_contractFailure">
				<label class="searchbar_checkbox_lable" for="csStatus_contractFailure">계약 실패</label>
				</div>
				</div>
				</div>
				</td>
				</tr>
				
				
				<tr>
				<td>


				<div class="searchBar_section">
				<div class="searchBar_section_layout" style="">


				<label>기간</label>
				<div>
				<input class="datePick1" type="text" placeholder=" 날짜를 선택하세요.." readonly="readonly" id="searchBar_startDate">
					 ~ 
					<input class="datePick2" type="text" placeholder=" 날짜를 선택하세요.." readonly="readonly" id="searchBar_endDate">
				
				</div>
				
				
				<input type="button" class="btn btn-secondary dateBtn" value="오늘">
				<input type="button" class="btn btn-secondary dateBtn" value="최근1주">
				<input type="button" class="btn btn-secondary dateBtn" value="이번달">
				<input type="button" class="btn btn-secondary dateBtn" value="지난달">
				<input type="button" class="btn btn-secondary dateBtn" value="지난분기">
				</div>
				</div>
				
				</td>
				</tr>

		</table>
		
			<input type="button" id="searchBarSearchBtn" value="검색">
			<input type="reset"  id="searchBarResetBtn" value="초기화">

	</div>
	
			<div class="download_to_excel_btn_div">
				<input type="button" id="downloadExcelBtn" value="엑셀로 내려받기">
			</div>
		
	
	<div class="list_div">
		<form>
      <table class="list_div_tbl" id="sales_tbl">
         <thead>
            <tr class="top_bar_of_list">
               <th>번호<button type="button" class="sort-btn" data-column="consultNo">🔽</button></th>
               <th>신청일<button type="button" class="sort-btn" data-column="csDate">🔽</button></th>
               <th>기업명<button type="button" class="sort-btn" data-column="csCompanyName">🔽</button></th>
               <th>신청인<button type="button" class="sort-btn" data-column="csName">🔽</button></th>
               <th>연락처</th>
               <th>이메일</th>
               <th>예산</th>
               <th>상태</th>
               <th>담당자<button type="button" class="sort-btn" data-column="csEname">🔽</button></th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="vo" items="${consultVO}" >
			   <tr class="salesList" data-type="${vo.csStatus}">
			      <td><a href="${vo.consultNo}">${vo.consultNo}</a></td>
			      <td>${vo.csDate}</td>
			      <td>${vo.csCompanyName}</td>
			      <td>${vo.csName}</td>
			      <td>${vo.csContact}</td>
			      <td>${vo.csEmail}</td>
			      <td>${vo.csBdgt}</td>
			      <td>${vo.csStatus}</td>
			      <td>${vo.csEname}</td>
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
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesSearch.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesFilter.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesMgmt.js"></script>
</body>
</html>