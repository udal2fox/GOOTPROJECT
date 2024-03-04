<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/companyMgmt.css">
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


		<div class="company_register_div">
			<h5 class="company_register_title" align="left">●기업 정보</h5>

			<table class="company_register_tbl">
				<thead>
					<tr>
						<th>기업명</th>
						<td><input type="text"></td>
						<td><input type="button" id="imgBtnSearchComName">
						</td>

						<th>기업 구분</th>
						<td><input type="radio" name="bizType" value="법인">법인
							<input type="radio" name="bizType" value="개인">개인
							</td>
						<td></td>
					</tr>

					<tr>
						<th rowspan="2">사업자등록증</th>
						<td><input type="text"></td>
						<td><input type="button" id="imgBtnBizLicenseFileUpload"></td>

						<th rowspan="2">사업자등록번호</th>
						<td rowspan="2"><input type="text"></td>
						<td rowspan="2"><input type="button"
							id="imgBtnSearchBizNum"></td>

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
						<td><input type="button" id="imgBtnSearchAddr">
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" placeholder="상세 주소"
							id="detailedAddr"></td>
					</tr>
				</thead>
			</table>
			<table class="company_register_tbl">
			<thead>
					<tr>
		                <th>업태</th>
		                <td>
		                   <input type="text" readonly>
		                </td>
		                <td><input type="button" id="imgBtnSearchBizStatus"></td>
		               
		                <th>업종</th>
		                <td>
		                    <input type="text" readonly>
		                </td>
		                <td></td>
		            </tr>
				<tr>
		                <th>이메일</th>
		                <td>
		                    <input type="email"> 
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
		                <td>
		                    <input type="date">
		                </td>
		                <td></td>
		            </tr>
				</thead>
			</table>
		</div>
			<div class="btn_div">
				<input type="button" id="companyUpdateBtn" value="수정">
				<input type="button" id="companyUpdateResetBtn" value="취소">
			</div>
	</div>


</div>


</body>
</html>