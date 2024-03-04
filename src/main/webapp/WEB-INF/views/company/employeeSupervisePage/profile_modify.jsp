<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../navBar.jsp" %> 
<link rel="stylesheet" href="/resources/css/company/employeeSupervisePage/profile_modify.css">

<body>
	
		<div>
			<h4> 프로필 편집 </h4>
		</div>
			<div class="profile_box" >
				<form action="" method="POST">
					<div id="profile-form">
						<div id="profile-all">
							<div id="img-box">
								<div id="profile-img">
									<svg id="img-icon" xmlns="http://www.w3.org/2000/svg" width="50" height="50" class="bi bi-person" viewBox="0 0 16 16" fill="white">
  										<path fill="white" d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
									</svg>
									<div id="img-white-line">
										<span id="img-change"> 프로필사진 변경 </span>
										<span id="img-save"> 저장 </span>
									</div>
								</div>
							</div>
								<table id="table1">
									<tr>
										<th> 이름 </th>
										<td><input class="input1" type="text" name="eName" readonly></td>
									</tr>
									<tr>
										<th> 이메일 주소 </th>
										<td><input class="input1" type="text" name="email" readonly></td>
									</tr>
									<tr>
										<th> 전화번호 </th>
										<td><input class="input1" type="text" name="ePhone"></td>
									</tr>
									<tr>
										<th> 생년월일 </th>
										<td><input class="input1" type="text" name="identyNum" readonly></td>
									</tr>
									<tr>
										<th> 비밀번호 </th>
										<td><input class="input1" type="text" name="ePw"></td>
									</tr>	
									<tr>
										<th> 비밀번호 확인 </th>
										<td><input class="input1" type="text" name="check-ePw"></td>
									</tr>
								</table>
								
								<table id="table2">	
									<tr>	
										<th> 입사일 </th>
										<td><input class="input1" class="hiredate" type="text" name="hireDt" readonly></td>
									</tr>
									<tr>
										<th> 부서 </th>
										<td><input class="input1" class="deptname" type="text" name="dName" readonly></td>
									</tr>
									<tr>
										<th> 직급 </th>
										<td><input class="input1" class="job" type="text" name="job" readonly></td>
									</tr>
									<tr>
										<th> 상세 주소 </th>
										<td>
											<div style="position: relative;">
        									<input class="input2" type="text" name="eAddr">
        										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="position: absolute; top: 60%; transform: translateY(-50%); right: 80px;">
            										<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
        										</svg>
    										</div>
											<input class="input3" type="text" name="eAddr2" value="${vo.EAddr2 }">
										</td>
									</tr>
								<tr>
									<th> 급여 계좌 </th>
									<td>
										<select id="bank-select">
											<option value="하나"> 하나은행 </option>
											<option value="우리"> 우리은행 </option>
											<option value="국민"> 국민은행 </option>
											<option value="기업"> 기업은행 </option>
											<option value="농협"> 농협은행 </option>
										</select>
									<div>
										<input class="input4" type="text" name="salAccount">
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="button-container">
					<input id="saveBtn" type="button" name="save" value="저장">
					<input id="closeBtn" type="button" name="close" value="닫기">
				</div>
			</form>
		</div>
		
	<script type="text/javascript" src="/resources/js/company/employeeSupervisePage/profile_modify.js"></script>
</body>
</html>