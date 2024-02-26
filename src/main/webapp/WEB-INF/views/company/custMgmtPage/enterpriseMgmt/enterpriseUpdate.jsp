<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/enterpriseMgmt.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>enterpriseRegistration.jsp</title>
</head>
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp" />
	</div>
	
	<div class="container-fluid" align="center" style="padding: 100px;">
	
	<div class="entire">

		<div class="title" align="left">
			<h3>기업 관리</h3>
		</div>


		<div class="company_registration">
			<h5 class="company_registration_title" align="left">●기업 정보</h5>

			<table class="company_registration_tbl" id="companyRegistrationTbl">
				<thead>
					<tr>
						<th>기업명</th>
						<td><input type="text"></td>
						<td><input type="button" id="img_button_searchComName">
						</td>

						<th>기업 구분</th>
						<td><input type="radio" name="businessType" value="법인">법인
							<input type="radio" name="businessType" value="개인">개인</td>
						<td></td>
					</tr>

					<tr>
						<th rowspan="2">사업자등록증</th>
						<td><input type="text"></td>
						<td><input type="button" id="img_button_upload"></td>

						<th rowspan="2">사업자등록번호</th>
						<td rowspan="2"><input type="text"></td>
						<td rowspan="2"><input type="button"
							id="img_button_searchBizRegNum"></td>

					</tr>


					<tr>
						<td>파일명</td>
						<td></td>
					</tr>

					<tr>
						<th rowspan="3">소재 지역</th>
						<td rowspan="3"><input type="text"></td>
						<td rowspan="3"></td>

						<th rowspan="3">주소</th>
						<td><input type="text" placeholder="주소"></td>
						<td><input type="button" id="img_button_searchAddr">
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" placeholder="상세 주소"
							id="detailedAddress"></td>
					</tr>
				</thead>
			</table>
			<table class="company_registration_tbl" id="companyRegistrationTbl_2">
			<thead>
				<tr>
		                <th>업태</th>
		                <td>
		                    <select name="businessCondition" id="selectBusinessCondition" style="text-align: center">
								<option value="선택">==선택==</option>
								<option value="농업 및 임업">농업 및 임업</option>
								<option value="어업">어업</option>
								<option value="광업">광업</option>
								<option value="제조업">제조업</option>
								<option value="전기,가스 및 수도사업">전기,가스 및 수도사업</option>
								<option value="건설업">건설업</option>
								<option value="도매 및 소매업">도매 및 소매업</option>
								<option value="숙박 및 음식점업">숙박 및 음식점업</option>
								<option value="운수업">운수업</option>
								<option value="통신업">통신업</option>
								<option value="금융 및 보험업">금융 및 보험업</option>
								<option value="부동산업 및 임대업">부동산업 및 임대업</option>
								<option value="사업서비스업">사업서비스업</option>
								<option value="공공행정,국방 및 사회보장행정">공공행정,국방 및 사회보장행정</option>
								<option value="교육 서비스업">교육 서비스업</option>
								<option value="보건 및 사회복지사업">보건 및 사회복지사업</option>
								<option value="오락,문화 및 운동관련산업">오락,문화 및 운동관련산업</option>
								<option value="기타 공공,수리 및 개인서비스 업">기타 공공,수리 및 개인서비스 업</option>
								<option value="기타">기타</option>
							</select>
		                </td>
		                <td ></td>
		               
		                <th>업종</th>
		                <td>
		                    <input type="text">
		                </td>
		                <td></td>
		            </tr>
				<tr>
		                <th>이메일</th>
		                <td>
		                    <input type="text">
		                </td>
		                <td></td>
		                <th></th>
		                <td></td>
		                <td></td>  
		            </tr>
		            <tr>
		                <th>대표자</th>
		                <td>
		                    <input type="text">
		                </td>
		                <td></td>
		                <th>창립 기념일</th>
		                <td id="td_foundationDay">
		                    <input type="date">
		                </td>
		                <td></td>
		            </tr>
				</thead>
			</table>
		</div>
			<div class="button_div">
				<input type="button" id="company_registration_update_button" value="수정">
				<input type="button" id="company_registration_reset_button" value="취소">
			</div>
	</div>


</div>


</body>
</html>