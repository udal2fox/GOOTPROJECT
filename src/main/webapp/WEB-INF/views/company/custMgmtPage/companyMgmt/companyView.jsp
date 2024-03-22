<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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


			<form action="/updateCompany" method="post" id="companyRegisterForm" enctype="multipart/form-data">
				<div class="companyMgmt_div">
					<h5 class="companyMgmt_title" align="left">●기업 편집</h5>
					<table class="companyMgmt_tbl">
						<thead>
							<tr>
								<td class="companyMgmt_tbl_title">기업명</td>
								
								<td><div class="input-with-image"><input type="text" name="comName"  value="${companyVO.comName }" readonly>
								<a href="#" id="open_searchCompany_modal"><input
										type="button" id="imgBtnSearchComName"> </a>
								</div></td>
								<td></td>
											<td class="companyMgmt_tbl_title">기업 구분</td>
					<td>
					    <input type="radio" name="bizType" value="법인" id="corporateRadio" <c:if test="${companyVO.comBizType eq '법인'}">checked</c:if>>법인
					    <input type="radio" name="bizType" value="개인" id="individualRadio" <c:if test="${companyVO.comBizType eq '개인'}">checked</c:if>>개인
					</td>
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
								<input type="text" name="comBizNum" id="comBizNum"  value="${companyVO.comBizNum }">
								<input type="button"
									id="imgBtnSearchBizNum"></div></td>
								
							</tr>

				
							<tr>
							    <c:forEach var="file" items="${companyVO.comBizLicenseFile}">
							        <td id="uploadedFileName">${file}</td>
							    </c:forEach>
						
					
							   
							</tr>

							<tr>
								<td class="companyMgmt_tbl_title" rowspan="3">소재 지역</td>
								<td rowspan="3"><input type="text" name="comArea" value="${companyVO.comArea }"
									id="comArea" readonly></td>
								<td rowspan="3"></td>

								<td class="companyMgmt_tbl_title" rowspan="3">주소</td>
							<td colspan="2">
								    <div class="input-with-image">
								        <input type="text" name="comAddr" id="comAddr" placeholder="주소" readonly value="${companyVO.comAddr }">
								        <input type="button" id="imgBtnSearchAddr" onclick="openAddressPopup()">
								    </div>
								</td>


							</tr>
							<tr>
								<td><input type="text" name="comDetailAddr"
									id="comDetailAddr" placeholder="상세 주소 작성" id="detailedAddr" value="${companyVO.comDetailAddr }"
									></td>
							</tr>
						</thead>
					</table>
					<table class="companyMgmt_tbl">
						<thead>
							<tr>
								<td class="companyMgmt_tbl_title">업태</td>
								<td>
								<div class="input-with-image">
								<input type="text" name="comBizStatus" readonly value="${companyVO.comBizStatus }">
								<a href="#" id="open_searchBizStatus_modal"><input
										type="button" id="imgBtnSearchBizStatus"> </a>
								</div></td>
									<td></td>

								<td class="companyMgmt_tbl_title">업종</td>
								<td><input type="text" name="comBizCategory" readonly value="${companyVO.comBizCategory}">
								</td>
								<td></td>
							</tr>
							<tr>
								<td class="companyMgmt_tbl_title">대표자</td>
								<td><input type="text" name="comCEO" value="${companyVO.comCEO}"></td>
								<td></td>
								<td class="companyMgmt_tbl_title">이메일</td>
								<td><input type="email" name="comEmail"  value="${companyVO.comEmail}"></td>
								<td></td>
								
							</tr>
							<tr>
								<td class="companyMgmt_tbl_title">창립 기념일</td>
								<td><input type="date" name="comOpenningDate" class="inputTypeDate" value="${companyVO.comOpenningDate}"
									placeholder="선택 입력"></td>
								<td></td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="btn_div">
					<input type="button" id="companyRegisterInsertBtn" onclick="updateCompanyView()" value="기업 편집">
					<input type="button" id="companyRegisterResetBtn" value="취소" onclick="backPage();">

				</div>
			</form>
			
			
			
			
			
			
			
			
			
			
			
			
			
			

			<!--------------------------------------- 기업명 탐색 버튼 모달창-->
			<div class="modal" id="searchCompany_modal">

				<div class="modal-content">
					<div class="modal-top">
						<table>
							<tr class="bordered-row">
								<td><input type="text" name="companyName" size="20" placeholder="기업명"></td>
								<td><input type="button" id="searchBtn" value="검색"></td>
							</tr>
						</table>
					</div>
					<div class="list_div_modal">
						<table class="list_div_tbl_modal" id="searchCompanyModal_tbl">
							<thead>
								<tr class="top_bar_of_list_modal">
									<th>기업명</th>
								</tr>
							</thead>
							<tbody>
						
					</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" id="close_searchCompany_modal">닫기</button>
					</div>

				</div>
			</div>
			
				<!--------------------------------------- 업종/업태 모달창-->
			<div class="modal" id="searchBizStatus_modal">

				<div class="modal-content">
				
					<div class="list_div_modal">
						<table class="list_div_tbl_modal" id="searchCompanyModal_tbl">
							<thead>
								<tr class="top_bar_of_list_modal">
									<th>업태</th>
								</tr>
								<tr>
								<td>
							<select class="searchbar_selectbox_filter" name="searchBarBizStatus" id="searchBarBizStatus" style="text-align: center;">
							<option value="선택">업태 선택</option>
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
								</tr>
								<tr class="top_bar_of_list_modal">
									    <th>업종</th>
									</tr>
									<tr id="searchBarBizCategoryRow">
									    <td id="searchBarBizCategoryCell"></td>
									</tr>
				</thead>
							<tbody>
						
					</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" id="insert_searchBizStatus_modal">확인</button>
						<button type="button" id="close_searchBizStatus_modal">닫기</button>
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
		src="/resources/js/company/custMgmtPage/companyView.js"></script>
	<script type="text/javascript"
		src="/resources/js/company/custMgmtPage/companyMgmtModal.js"></script>


</body>
</html>