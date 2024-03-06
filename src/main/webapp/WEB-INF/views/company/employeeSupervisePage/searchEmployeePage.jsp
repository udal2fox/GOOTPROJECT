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
				<input class="searchBar" type="text" name="search" placeholder="이름/팀명/이메일">
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
				<thead>
					<tr id="table_header">
						<th>사번</th>
						<th>이름</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>부서</th>
						<th>직급</th>
						<th>재직상태</th>
						<th>입사일</th>
						<th>퇴사일</th>
						<th>계정상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td><a href="${vo.eno }">${vo.eno }</a></td>
							<td>${vo.EName }</td>
							<td>${vo.email }</td>
							<td>${vo.EPhone }</td>
							<td>${vo.DName }</td>
							<td>${vo.job }</td>
							<td>${empty vo.endDt ? '재직 중' : '퇴사' }</td>
							<td>${vo.hireDt }</td>
							<td>${empty vo.endDt ? '-' : vo.endDt }</td>
							<td>${vo.idStatus }</td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<div class="insertEmployeeBtn">
					<button id="insertBtn" name="insertEmployee">신규등록</button>
				</div>
		</div>
	</div>	
	
	<script type="text/javascript" src="/resources/js/company/employeeSupervisePage/searchEmployeePage.js"></script>
</body>
</html>