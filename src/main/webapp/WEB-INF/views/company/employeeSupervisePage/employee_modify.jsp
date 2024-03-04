<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../navBar.jsp" %> 
<link rel="stylesheet" href="/resources/css/company/employeeSupervisePage/employee_modify.css">

<body>
	
		<div>
			<h4>임직원 편집</h4>
		</div>
			<div id="insert-form-box">
				<form action="" method="POST">
					<div id="table1">
						<table id="top-table">
							<tr>
								<th> 이름 </th>
								<td><input class="input1" type="text" name="eName" value="${vo.EName}" readonly></td>
								<th> 부서 </th>
								<td><input class="input2" type="text" name="dName" value="${vo.DName}"></td>
								<th> 상세주소 </th>
								<td>
									<div style="position: relative;">
										<input class="input3" type="text" name="eAddr" value="${vo.EAddr }" readonly>
        							</div>
								</td>
							</tr>
							<tr>
								<th> 이메일 주소 </th>
								<td><input class="input1" type="text" name="email" value="${vo.email }" readonly></td>
								<th> 직급 </th>
								<td><input class="input2" type="text" name="job" value="${vo.job }"></td>
								<th></th>
								<td><input class="input4" type="text" name="eAddr2" value="${vo.EAddr2 }"></td>
							</tr>
							<tr>
								<th> 전화번호 </th>
								<td><input class="input1" type="text" name="ePhone" value="${vo.EPhone }" readonly></td>
								<th> 근무형태 </th>
								<td><input class="input2" type="text" name="workType" value="${vo.workType }"></td>
								<th> 급여계좌 </th>
								<td><input class="input3" type="text" name="ebank" value="${vo.EBank }" readonly></td>
							</tr>
							<tr>
								<th> 생년월일 </th>
								<td><input class="input1" type="text" name="identyNum" value="${vo.identyNum }" readonly></td>
								<th> 연봉 </th>
								<td><input class="input2" type="number" name="sal" value="${vo.sal }"></td>
								<th></th>
								<td><input class="input4" type="text" name="salAccount" value="${vo.salAccount }" readonly></td>
							</tr>
						</table>
					</div>
				<hr style="border : 0.5px solid gray; width: 95%; margin: 0 auto;">
				<div id="table2">
					<table id="bottom-table">
						<tr>
							<th>입사일</th>
							<td><input class="input5" type="text" name="hireDt" value="${vo.hireDt}" readonly></td>
							<th>퇴사일</th>
							<td><input class="input5" type="text" name="endDt" value="${empty vo.endDt ? '-' : vo.endDt }"></td>
							<th>계정상태</th>
							<td><input class="input6" type="text" name="idStatus" value="${vo.idStatus}"></td>
						</tr>
					</table>
				</div>
					<div class="button-container">
						<input id="saveBtn" type="button" name="save" value="저장">
						<input id="closeBtn" type="button" name="close" value="닫기">
					</div>
				</form>
			</div>
	
	<script type="text/javascript" src="/resources/js/company/employeeSupervisePage/employee_modify.js"></script>
</body>
</html>