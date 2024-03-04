<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../navBar.jsp" %> 
<link rel="stylesheet" href="/resources/css/company/employeeSupervisePage/employee_insert.css">

<body>
	
		<div>
			<h4>임직원 등록</h4>
		</div>
			<div id="insert-form-box">
				<form method="POST">
					<div id="table1">
						<table id="top-table">
							<tr>
								<th> 이름 </th>
								<td><input class="input1" type="text" name="eName"></td>
								<th> 부서 </th>
								<td><input class="input2" type="text" name="dName"></td>
								<th> 상세주소 </th>
								<td>
									<div style="position: relative;">
										<input class="input3" type="text" name="eAddr">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="position: absolute; top: 60%; transform: translateY(-50%); right: 105px;">
            								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
        								</svg>
        							</div>
								</td>
							</tr>
							<tr>
								<th> 이메일 주소 </th>
								<td><input class="input1" type="text" name="email"></td>
								<th> 직급 </th>
								<td><input class="input2" type="text" name="job"></td>
								<th></th>
								<td><input class="input4" type="text" name="eAddr2"></td>
							</tr>
							<tr>
								<th> 전화번호 </th>
								<td><input class="input1" type="text" name="ePhone" placeholder="- 을 포함해서 입력하세요"></td>
								<th> 근무형태 </th>
								<td><input class="input2" type="text" name="workType"></td>
								<th> 급여계좌 </th>
								<td>
									<select id="bank-select" name="eBank">
										<option value="하나"> 하나은행 </option>
										<option value="우리"> 우리은행 </option>
										<option value="국민"> 국민은행 </option>
										<option value="기업"> 기업은행 </option>
										<option value="농협"> 농협은행 </option>
										<option value="카카오"> 카카오 뱅크 </option>
									</select>
								</td>
							</tr>
							<tr>
								<th> 생년월일 </th>
								<td><input class="input1" type="text" name="identyNum" placeholder="- 을 포함해서 입력하세요"></td>
								<th> 연봉 </th>
								<td><input class="input2" type="number" name="sal"></td>
								<th></th>
								<td><input class="input4" type="text" name="salAccount"></td>
							</tr>
						</table>
					</div>
				<hr style="border : 0.5px solid gray; width: 95%; margin: 0 auto;">
				<div id="table2">
					<table id="bottom-table">
						<tr>
							<th>입사일</th>
							<td><input class="input5" type="text" name="hireDt"></td>
							<th>퇴사일</th>
							<td><input class="input5" type="text" name="endDt"></td>
							<th>계정상태</th>
							<td><input class="input6" type="text" name="idStatus"></td>
						</tr>
					</table>
				</div>
		</form>
			<div class="button-container">
				<input id="saveBtn" type="button" name="save" value="저장">
				<input id="closeBtn" type="button" name="close" value="닫기">
			</div>
	</div>
	
	<script type="text/javascript" src="/resources/js/company/employeeSupervisePage/employee_insert.js"></script>
</body>
</html>