<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../navBar.jsp" %> 
<link rel="stylesheet" href="/resources/css/company/employeeSupervisePage/employee_modify.css">

<body>
	
		<div>
			<h4>임직원 편집</h4>
		</div>
			<div id="insert-form-box">
				<form method="POST">
					<div id="table1">
						<table id="top-table">
							<tr>
								<th> 이름 </th>
								<td><input class="input1" type="text" name="eName" value="${vo.EName}" readonly></td>
								<th> 부서 </th>
								<td>
									<select id="dName-select" name="deptNo">
    									<option value="1" ${dName.equals("인사") ? "selected" : ""}>인사</option>
    									<option value="2" ${dName.equals("재무") ? "selected" : ""}>재무</option>
    									<option value="3" ${dName.equals("영업") ? "selected" : ""}>영업</option>
    									<option value="4" ${dName.equals("상품") ? "selected" : ""}>상품</option>
    									<option value="0" ${dName.equals("대표") ? "selected" : ""}>대표</option>
									</select>
								<%-- <input class="input2" type="text" name="dName" value="${dName}"> --%>
								</td>
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
								<td>
								 	<select id="job-select" name="job">
    									<option value="팀장" ${vo.job == '팀장' ? 'selected' : ''}>팀장</option>
    									<option value="과장" ${vo.job == '과장' ? 'selected' : ''}>과장</option>
    									<option value="대리" ${vo.job == '대리' ? 'selected' : ''}>대리</option>
    									<option value="팀원" ${vo.job == '팀원' ? 'selected' : ''}>팀원</option>
    									<option value="인턴" ${vo.job == '인턴' ? 'selected' : ''}>인턴</option>
									</select> 
								<%-- <input class="input2" type="text" name="job" value="${vo.job }"> --%>
								</td>
								<th></th>
								<td><input class="input4" type="text" name="eAddr2" value="${vo.EAddr2 }" readonly></td>
							</tr>
							<tr>
								<th> 전화번호 </th>
								<td><input class="input1" type="text" name="ePhone" value="${vo.EPhone }" readonly></td>
								<th> 근무형태 </th>
								<td>
									<select id="workType-select" name="workType">
    									<option value="정규직" ${vo.workType == '정규직' ? 'selected' : ''}>정규직</option>
    									<option value="비정규직" ${vo.workType == '비정규직' ? 'selected' : ''}>비정규직</option>
									</select>
								
								<%-- <input class="input2" type="text" name="workType" value="${vo.workType }"> --%>
								</td>
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
							<td>
								<select id="idStatus-select" name="idStatus">
									<option value="활성" ${vo.idStatus == '활성' ? 'selected' : ''}>활성</option>
									<option value="비활성" ${vo.idStatus == '비활성' ? 'selected' : ''}>비활성</option>
								</select>
		
							<%-- <input class="input6" type="text" name="idStatus" value="${vo.idStatus}"> --%>
							</td>
						</tr>
					</table>
				</div>
				<input type="hidden" name="eno" value="${vo.eno }">
			</form>
				<div class="button-container">
					<input id="saveBtn" type="button" name="save" value="저장">
					<input id="closeBtn" type="button" name="close" value="닫기">
				</div>
			</div>
	
	<script type="text/javascript" src="/resources/js/company/employeeSupervisePage/employee_modify.js"></script>
</body>
</html>