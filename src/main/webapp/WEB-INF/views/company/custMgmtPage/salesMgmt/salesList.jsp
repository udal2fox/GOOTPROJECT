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
				<label for="csStatus_all">전체</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox"  name="serviceStatus" value="최초 인입" checked="checked" data-filter="csStatus_type" id="csStatus_firstIncoming" >
				<label for="csStatus_firstIncoming">최초 인입</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox"  class="searchbar_checkbox"  name="serviceStatus" value="응대 완료" checked="checked" data-filter="csStatus_type" id="csStatus_response">
				<label for="csStatus_response">응대 완료</label>
				</div>
				<div class="checkbox_div">
				<input type="checkbox"  class="searchbar_checkbox" name="serviceStatus" value="견적 발송 완료" checked="checked" data-filter="csStatus_type" id="csStatus_quotationSent">
				<label for="csStatus_quotationSent">견적 발송 완료</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox"  name="serviceStatus" value="미팅 완료" checked="checked" data-filter="csStatus_type"  id="csStatus_meeting">
				<label for="csStatus_meeting">미팅 완료</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox"  name="serviceStatus" value="계약 완료" checked="checked" data-filter="csStatus_type" id="csStatus_contractCompleted">
				<label for="csStatus_contractCompleted">계약 완료</label>
				</div>
				
				<div class="checkbox_div">
				<input type="checkbox" class="searchbar_checkbox"  name="serviceStatus" value="계약 실패" checked="checked"  data-filter="csStatus_type" id="csStatus_contractFailure">
				<label for="csStatus_contractFailure">계약 실패</label>
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
				<input type="date" id="searchBar_startDate"> ~ <input type="date"  id="searchBar_endDate">
				</div>
				
				
				<button type="button" class="btn btn-secondary btn-sm">오늘</button>
				<button type="button" class="btn btn-secondary btn-sm">일주일</button>
				<button type="button" class="btn btn-secondary btn-sm">이번 달</button>
				<button type="button" class="btn btn-secondary btn-sm">지난 달</button>
				<button type="button" class="btn btn-secondary btn-sm">지난 분기</button>
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

      <table class="list_div_tbl" id="sales_tbl">
         <thead>
            <tr class="top_bar_of_list">
               <th>번호</th>
               <th>신청일</th>
               <th>기업명</th>
               <th>신청인</th>
               <th>연락처</th>
               <th>이메일</th>
               <th>예산</th>
               <th>상태</th>
               <th>담당자</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="vo" items="${consultVO }">
               <tr class="salesList">
                  <td><a href="${vo.consultNo }">${vo.consultNo }</a></td>
                  <td>${vo.csDate }</td>
                  <td>${vo.csCompanyName }</td>
                  <td>${vo.csName }</td>
                  <td>${vo.csContact }</td>
                  <td>${vo.csEmail }</td>
                  <td>${vo.csBdgt }</td>
                  <td>${vo.csStatus }</td>
				  <td>${vo.csEname }</td>
               </tr>
            </c:forEach>
    
            
         </tbody>
      </table>
</div>
</div>
</div>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesMgmt.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesSearch.js"></script>
</body>
</html>