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
	<form method="get" >
		<table class="searchBar_tbl">
			<thead>
				<tr>
				<th>키워드</th>
				<td>
					<input type="text" name="searchBarKeyword" placeholder="기업명/담당자/메일주소/영업담당" style="text-align: center;">
				</td>
				<td></td>
				<th>영업 상태</th>
				<td>
					<select name="salesStatus" id="searchBarSalesStatus">
								<option value="선택">==선택==</option>
								<option value="최초 인입">최초 인입</option>
								<option value="응대 완료">응대 완료</option>
								<option value="견적 발송 완료">견적 발송 완료</option>
								<option value="미팅 완료">미팅 완료</option>
								<option value="계약 완료">계약 완료</option>
								<option value="계약 실패">계약 실패</option>
					</select>
				</td>
				<td></td>
				</tr>
				<tr>
				<th>기간</th>
				<td>
					<input type="date" > ~ <input type="date">
				</td>
				<td colspan="4">
				<button type="button" class="btn btn-secondary btn-sm">오늘</button>
				<button type="button" class="btn btn-secondary btn-sm">일주일</button>
				<button type="button" class="btn btn-secondary btn-sm">이번 달</button>
				<button type="button" class="btn btn-secondary btn-sm">지난 달</button>
				<button type="button" class="btn btn-secondary btn-sm">지난 분기</button>

				
				</td>
				</tr>
			</thead>
		</table>
		
			<input type="button" id="searchBarSearchBtn" value="검색">
			<input type="reset"  id="searchBarResetBtn" value="초기화">
		</form>
	</div>
	
			<div class="download_to_excel_btn_div">
				<input type="button" id="downloadExcelBtn" value="엑셀로 내려받기">
			</div>
		
	
	<div class="list_div">

      <table class="list_div_tbl">
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
               <tr>
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
<!-- page -->
		<div class="page-wrap">
			<ul class="page-nation">
				<c:if test="${pageMaker.prev }"> <!-- prev 라는 현재 페이지가 있으면 (이전 페이지로 이동하는 태그 생성)-->
					<li class="previous">
						<a href="${pageMaker.startPage-1 }">&lt;</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
					<li>
						<a href="${num }" class="${pageMaker.cri.pageNum == num ? 'active' : '' }">${num }</a>
						<!-- 여기서 href 라는 속성은 어디가기 위한 속성이 아니라 값을 가지고 오기위한 것임 -->
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next }"> <!-- next 라는 다음 페이지가 있으면 (다음 페이지로 이동하는 태그 생성)-->
					<li>
						<a href="${pageMaker.endPage + 1 }">&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>


</div>
</div>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesMgmt.js"></script>

</body>
</html>