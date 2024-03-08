<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/companyMgmt.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<link rel="shortcut icon" href="#">

<title></title>
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


<form action="/companyRegisterInsert" method="post" id="companyRegisterForm" enctype="multipart/form-data">
		<div class="company_register_div">
			<h5 class="company_register_title" align="left">●기업 등록</h5>
			<table class="company_register_tbl">
				<thead>
					<tr>
						<th>기업명</th>
						<td><input type="text" name="comName" readonly></td>
						<td><input type="button" id="imgBtnSearchComName">
						</td>

						<th>기업 구분</th>
						<td><input type="radio" name="bizType" value="법인" id="corporateRadio">법인
							<input type="radio" name="bizType" value="개인" id="individualRadio">개인
						</td>
						<td></td>
					</tr>

					<tr>
						<th rowspan="2">사업자등록증</th>
						    <td><input type="text" name="comBizLicenseFile" readonly></td>
						    <td>
						        <input type="file" name="file" id="fileInput" style="display:none;" onchange="updateFileName()">
						        <label for="fileInput" id="imgBtnBizLicenseFileUpload"></label>
						    </td>

						<th rowspan="2">사업자등록번호</th>
						<td rowspan="2"><input type="text" name="comBizNum" id="comBizNum"></td>
						<td rowspan="2"><input type="button"
							id="imgBtnSearchBizNum"></td>

					</tr>


					<tr>
						<td>파일명</td>
						<td></td>
					</tr>

					<tr>
						<th rowspan="3">소재 지역</th>
						<td rowspan="3"><input type="text" name="comArea" id="comArea" readonly></td>
						<td rowspan="3"></td>

						<th rowspan="3">주소</th>
				<td colspan="2"><input type="text" name="comAddr" id="comAddr" placeholder="주소" readonly><br>
				<input type="button" id="imgBtnSearchAddr" onclick="openAddressPopup()"></td>


					</tr>
					<tr>
						<td><input type="text" name="comDetailAddr" id="comDetailAddr" placeholder="상세 주소 작성"
							id="detailedAddr"></td>
					</tr>
				</thead>
			</table>
			<table class="company_register_tbl">
			<thead>
				<tr>
		                <th>업태</th>
		                <td>
		                   <input type="text" name="comBizStatus" readonly>
		                </td>
		                <td><input type="button" id="imgBtnSearchBizStatus" onclick="searchBizStatus()"></td>
		               
		                <th>업종</th>
		                <td>
		                    <input type="text" name="comBizCategory" readonly>
		                </td>
		                <td></td>
		            </tr>
				<tr>
		                <th>이메일</th>
		                <td>
		                    <input type="email" name="comEmail"> 
		                </td>
		                <td></td>
		                <th></th>
		                <td></td>
		                <td></td>  
		            </tr>
		            <tr>
		                <th>대표자</th>
		                <td>
		                    <input type="text" name="comCEO">
		                </td>
		                <td></td>
		                <th>창립 기념일</th>
		                <td>
		                    <input type="date" name="comOpenningDate" placeholder="선택 입력">
		                </td>
		                <td></td>
		            </tr>
				</thead>
			</table>
		</div>
			<div class="btn_div">
				<input type="button" id="companyRegisterInsertBtn" value="기업 등록">
				<input type="button" id="companyRegisterResetBtn" value="취소">

			</div>
		</form>
	
	</div>


</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="/resources/js/company/custMgmtPage/companyRegister.js"></script>


</body>
</html>