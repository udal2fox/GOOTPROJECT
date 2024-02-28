<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../navBar.jsp" %> 
<body>

	<div id="pull-wrap">
	<h3> 직원조회 </h3>
		<div id="searchBar-select">
			<div id="searchBar" style="position: relative;">
				<span>키워드</span>
				<input class="searchBar" type="text" name="" placeholder="이름/팀명/이메일">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px;">
            		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
        		</svg>
			</div>
			<div id="selectDept">
				<span>조직별 구분</span>
				<select class="dept-sb">
					<option value="인사"> 인사 </option>
					<option value="재무"> 재무 </option>
					<option value="영업"> 영업 </option>
					<option value="상품"> 상품 </option>
				</select>
			</div>
			<button id="execelBtn"> 엑셀로 내려받기 </button>
		</div>
		<hr style="border : 0.5px solid gray; width: 98%; margin: 0 auto; margin-top: 10px; margin-bottom: 10px;">
		
		<div id="searchResult_table">
			<table id="searchResult">
				<tr id="table_header">
					<td>사번</td>
					<td>이름</td>
					<td>이메일</td>
					<td>연락처</td>
					<td>부서</td>
					<td>직급</td>
					<td>재직상태</td>
					<td>입사일</td>
					<td>퇴사일</td>
					<td>계정상태</td>
				</tr>
				<tr>
					<td><a href="/employee_modify">001</a></td>
        			<td>홍길동</td>
       		 		<td>hong@example.com</td>
        			<td>010-1234-5678</td>
        			<td>인사팀</td>
        			<td>대리</td>
        			<td>재직중</td>
        			<td>2023-01-01</td>
        			<td> - </td>  <!-- null 일 시 기본값  -  -->
        			<td>활성</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
				<div class="insertEmployeeBtn">
					<button id="insertBtn" name="insertEmployee">신규등록</button>
				</div>
				
				<!-- page -->
				<div class="page-wrap">
					<ul class="page-nation">
						<c:if test="${pageMaker.prev }">
							<li class="previous">
								<a href="${pageMaker.startPage-1 }"> &lt; </a>
							</li>
						</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
						<li>
							<a href="${num }" class="${pageMaker.cri.pageNum == num ? 'active' : '' }"> ${num } </a>
						</li>
							</c:forEach>
								<c:if test="${pageMaker.next }">
						<li>
							<a href="${pageMaker.endPage + 1 }"> &gt; </a>
						</li>
				</c:if>
			</ul>
		</div>
		</div>
	</div>	
	
	<script type="text/javascript" src="/resources/js/company/employeeSupervisePage/searchEmployeePage.js"></script>
</body>
</html>