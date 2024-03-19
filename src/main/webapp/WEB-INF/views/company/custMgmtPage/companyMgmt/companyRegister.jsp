<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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


			<form action="/companyRegisterInsert" method="post"
				id="companyRegisterForm" enctype="multipart/form-data">
				<div class="companyMgmt_div">
					<h5 class="companyMgmt_title" align="left">●기업 등록</h5>
					<table class="companyMgmt_tbl">
						<thead>
							<tr>
								<td class="companyMgmt_tbl_title">기업명</td>
								
								<td><div class="input-with-image"><input type="text" name="comName" readonly>
								<a href="#" id="open_searchCompany_modal"><input
										type="button" id="imgBtnSearchComName"> </a>
								</div></td>
								<td></td>
								<td class="companyMgmt_tbl_title">기업 구분</td>
								<td><input type="radio" name="bizType" value="법인"
									id="corporateRadio">법인 <input type="radio"
									name="bizType" value="개인" id="individualRadio">개인</td>
								<td></td>
							
							</tr>

							<tr>
								<td class="companyMgmt_tbl_title" rowspan="2">사업자등록증</td>
								<td>
								<div class="input-with-image" id="fileUpDown">
								<input type="text" name="comBizLicenseFile" placeholder="사업자 등록증 업로드"  readonly>
								<input type="file" name="file" id="fileInput" multiple="multiple"
									style="display: none;" onchange="updateFileName()"> 
								<label for="fileInput" id="imgBtnBizLicenseFileUpload"></label>
								</div>
								</td>
								<td></td>
								<td class="companyMgmt_tbl_title" rowspan="2">사업자등록번호</td>
								<td rowspan="2">
								<div class="input-with-image">
								<input type="text" name="comBizNum" id="comBizNum">
								<input type="button"
									id="imgBtnSearchBizNum"></div></td>
								
							</tr>


							<tr>
								<td id="uploadedFileName"></td>
								<td></td>
							</tr>

							<tr>
								<td class="companyMgmt_tbl_title" rowspan="3">소재 지역</td>
								<td rowspan="3"><input type="text" name="comArea"
									id="comArea" readonly></td>
								<td rowspan="3"></td>

								<td class="companyMgmt_tbl_title" rowspan="3">주소</td>
							<td colspan="2">
								    <div class="input-with-image">
								        <input type="text" name="comAddr" id="comAddr" placeholder="주소" readonly>
								        <input type="button" id="imgBtnSearchAddr" onclick="openAddressPopup()">
								    </div>
								</td>


							</tr>
							<tr>
								<td><input type="text" name="comDetailAddr"
									id="comDetailAddr" placeholder="상세 주소 작성" id="detailedAddr"></td>
							</tr>
						</thead>
					</table>
					<table class="companyMgmt_tbl">
						<thead>
							<tr>
								<td class="companyMgmt_tbl_title">업태</td>
								<td>
								<div class="input-with-image">
								<input type="text" name="comBizStatus" readonly>
								
								<input type="button" id="imgBtnSearchBizStatus"
									onclick="searchBizStatus()"></div></td>
									<td></td>

								<td class="companyMgmt_tbl_title">업종</td>
								<td><input type="text" name="comBizCategory" readonly>
								</td>
								<td></td>
							</tr>
							<tr>
								<td class="companyMgmt_tbl_title">대표자</td>
								<td><input type="text" name="comCEO"></td>
								<td></td>
								<td class="companyMgmt_tbl_title">이메일</td>
								<td><input type="email" name="comEmail"></td>
								<td></td>
								
							</tr>
							<tr>
								<td class="companyMgmt_tbl_title">창립 기념일</td>
								<td><input type="date" name="comOpenningDate" class="inputTypeDate"
									placeholder="선택 입력"></td>
								<td></td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="btn_div">
					<input type="button" id="companyRegisterInsertBtn" value="기업 등록">
					<input type="button" id="companyRegisterResetBtn" value="취소"  onclick="backPage();">

				</div>
			</form>

			<!--------------------------------------- 기업명 탐색 버튼 모달창-->
			<div class="modal" id="searchCompany_modal">

				<div class="modal-content">
					<div class="modal-top">
						<table>
							<tr class="bordered-row">
								<td><input type="text" size="20" placeholder="기업명 찾기"></td>
								<td><input type="button" id="searchBtn" value="검색"></td>
							</tr>
						</table>
					</div>
					<div class="list_div_modal">
						<table class="list_div_tbl_modal" id="searchCompanyModal_tbl">
							<thead>
								<tr class="top_bar_of_list_modal">
									<td class="companyMgmt_tbl_title">기업명</td>
								</tr>
							</thead>
							<tbody>
								<tr class="list">
									<td></td>

								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" id="close_searchCompany_modal">닫기</button>
					</div>

				</div>
			</div>




		</div>


	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="/resources/js/company/custMgmtPage/companyMgmtModal.js"></script>
	<script type="text/javascript"
		src="/resources/js/company/custMgmtPage/companyRegister.js"></script>


</body>
</html>