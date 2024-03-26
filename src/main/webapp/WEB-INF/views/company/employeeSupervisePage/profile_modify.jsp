<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../navBar.jsp" %> 
<link rel="stylesheet" href="/resources/css/company/employeeSupervisePage/profile_modify.css">
<script>
    var profilePictureSrc = "${vo.profilePicture}";
</script>

<body>
		<div>
			<h4> 프로필 편집 </h4>
		</div>
			<div class="profile_box" >
				<form method="POST" enctype="multipart/form-data">
					<div id="profile-form">
						<div id="profile-all">
							<div id="img-box">
								<div id="profile-img">
								 	<img id="profilePicture" src="${vo.profilePicture}" width="302px" height="152px" onerror="this.src='/resources/images/profile_img.png';" >
								</div>
								<div id="img-white-line">
									<span id="img-change"> 프로필사진 변경 </span>
									<span id="img-save"> 저장 </span>
									<input type="file" id="img-upload" name="profilePicture" style="display: none" accept="image/*">
								</div>
							</div>
								<table id="table1">
									<tr>
										<th> 이름 </th>
										<td><input class="input1" type="text" name="eName" value="${vo.EName }" readonly></td>
									</tr>
									<tr>
										<th> 이메일 주소 </th>
										<td><input class="input1" type="text" name="email" value="${vo.email }" readonly></td>
									</tr>
									<tr>
										<th> 전화번호 </th>
										<td><input class="input1" type="text" name="ePhone" value="${vo.EPhone }"></td>
									</tr>
									<tr>
										<th> 생년월일 </th>
										<td><input class="input1" type="text" name="identyNum" value="${vo.identyNum }" readonly></td>
									</tr>
									<tr>
										<th> 비밀번호 </th>
										<td><input class="input1" type="text" name="ePw" value="${vo.EPw }"></td>
									</tr>	
									<tr>
										<th> 비밀번호 확인 </th>
										<td><input class="input1" type="text" name="checkEPw"></td>
									</tr>
								</table>
								
								<table id="table2">	
									<tr>	
										<th> 입사일 </th>
										<td><input class="input1" class="hiredate" type="text" name="hireDt" value="${vo.hireDt }" readonly></td>
									</tr>
									<tr>
										<th> 부서 </th>
										<td><input class="input1" class="deptname" type="text" name="dName" value="${dName }" readonly></td>
									</tr>
									<tr>
										<th> 직급 </th>
										<td><input class="input1" class="job" type="text" name="job" value="${vo.job }" readonly></td>
									</tr>
									<tr>
										<th> 상세 주소 </th>
										<td>
											<div style="position: relative;">
        									<input id="sample6_postcode" class="input2" type="text" name="eAddr" value="${vo.EAddr }">
        										<svg id="searchIcon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="position: absolute; top: 60%; transform: translateY(-50%); right: 100px;">
            										<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
        										</svg>
    										</div>
											<input id="sample6_address" class="input3" type="text" name="eAddr2" value="${vo.EAddr2 }">
											<input type="hidden" id="sample6_extraAddress">
										</td>
									</tr>
								<tr>
									<th> 급여 계좌 </th>
									<td>
										<select id="bank-select" name="eBank">
											<option value="하나은행" ${vo.EBank == '하나은행' ? 'selected' : ''}>하나은행</option>
    										<option value="우리은행" ${vo.EBank == '우리은행' ? 'selected' : ''}>우리은행</option>
    										<option value="국민은행" ${vo.EBank == '국민은행' ? 'selected' : ''}>국민은행</option>
    										<option value="기업은행" ${vo.EBank == '기업은행' ? 'selected' : ''}>기업은행</option>
    										<option value="농협은행" ${vo.EBank == '농협은행' ? 'selected' : ''}>농협은행</option>
    										<option value="카카오 뱅크" ${vo.EBank == '카카오 뱅크' ? 'selected' : ''}>카카오 뱅크</option>
										</select>
									<div>
										<input class="input4" type="text" name="salAccount" value="${vo.salAccount }">
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="button-container">
					<input type="hidden" name="eno" value="${vo.eno }">
					<input type="hidden" name="deptNo" value="${vo.deptNo }">
					<input id="saveBtn" type="button" name="save" value="저장">
					<input id="closeBtn" type="button" name="close" value="닫기">
				</div>
			</form>
		</div>
	
	
	<script type="text/javascript" src="/resources/js/company/employeeSupervisePage/profile_modify.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_postcode").value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


</body>
</html>