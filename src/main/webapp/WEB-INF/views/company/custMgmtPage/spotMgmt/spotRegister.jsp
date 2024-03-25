<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp"/>
	</div>
	<div class="container-fluid" align="center" style="padding: 100px;">
	<div class="entire">
		<div class="title" align="left">
			<h3>지점 관리</h3>
		</div>
		
			<form action="/spotRegisterInsert" method="post"
				id="spotRegisterForm" enctype="multipart/form-data">
		<div class="spot_subject_div">
			<h5 class="spot_subject_title" align="left">●지점 정보</h5>

			<table class="spot_subject_tbl">
				<thead>
					<tr>
						<th>기업 연결</th>
						<td><div class="input-with-image">
						<input type="text" name="comName" readonly><a href="#" id="open_takeComName_modal">
						<input type="button" id="imgBtnSearchComName"></a>
						<input type="hidden" name="companyNo">
						</div></td>
						<td></td>

						<th>지점명</th>
						<td>
							<input type="text" name="spName">
						</td>
						<td rowspan="9"></td>
					</tr>

					<tr>
							<th rowspan="3">주소</th>
			
						<td >
								    <div class="input-with-image">
								        <input type="text" name="spAddr" id="spAddr" placeholder="주소" readonly value="${spotVO.spAddr }">
								        <input type="button" id="imgBtnSearchAddr" onclick="openAddressPopup()">
								    </div>
								</td>
						<th></th>
						<td></td>
				
						<tr>
							<td colspan="2" rowspan="2">
							<input type="text" placeholder="상세 주소" name="spDetailAddr" id="detailedAddr"  value="${spotVO.spDetailAddr }"></td>
						
						
						<th>연락처</th>
						<td>
							<input type="text" name="spContact">
						</td>
						</tr>
						<tr>
							<th></th>
							<td></td>
						</tr>
						
						<tr>
						<th rowspan="2">계약서</th>
						
									<td>
								<div class="input-with-image" id="fileUpDown">
								<input type="text" name="spAgreementFile" placeholder="계약서 업로드"  readonly>
								<input type="file" name="file" id="fileInput" multiple="multiple"
									style="display: none;" onchange="updateFileName()"> 
								<label for="fileInput" id="imgBtnAgreementFileUpload"></label>
								</div>
								</td>
								
								
						<td></td>
						<th rowspan="2">계약 일자</th>
						<td rowspan="2"><input type="date" name ="spAgreementDate"></td>
					</tr>
				

					<tr>
						 <td id="uploadedFileName"></td>
								<td></td>
					</tr>

					<tr>
						<th>약정 기간</th>
						<td>
							<select name="spAgreementTerm">
								<option value="6">6개월</option>
								<option value="12">12개월</option>
								<option value="24">24개월</option>
								<option value="36">36개월</option>
							
							</select>
						
						</td>
						
						<td></td>

						<th>자동 연장 여부</th>
						<td>
						
						<select name="spAutoExtension">
								<option value="Y">Y</option>
								<option value="N">N</option>
							
							</select>
						
					</td>
					<td></td>
					</tr>
					<tr>
						<th>인당 예산</th>
						<td><input type="text" name="spBdgt"></td>
						<td></td>
						<th>계약 인원</th>
						<td><input type="text" name="spEmpNum"></td>
						<td></td>
						
						
					</tr>
					<tr>
						<th>결제 방식</th>
						<td>
						
						
							<select name="spAutoExtension">
								<option value="계산서">계산서</option>
								<option value="카드">카드</option>
							
							</select>
						
						
						</td>
						<td></td>
						<th></th>
						<td></td>
						<td></td>
					</tr>
				</thead>
			</table>
			
				
				<h5 class="spot_subject_title" align="left">●담당자 정보</h5>

			<table class="spot_subject_tbl">
				<thead>
					<tr>
					<th>담당자명</th>
					<td><div class="input-with-image">
						<input type="text" name="csName" placeholder="담당자명 검색 또는 작성"><a href="#" id="open_takeCsName_modal">
						<input type="button" id="imgBtnTakeCsName"></a>
						</div></td>
						<td></td>
					<th>연락처</th>
					<td><input type="text" name="userContact"></td>
					<td></td>
					</tr>
					<tr>
					<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="userEmail">
					</td>
					<td></td>
					<th></th>
					<td></td>
					<!-- <td><input type="text" name="userPw"></td> -->
					<td></td>
					</tr>
					<tr>
					<tr>
					<th colspan="3"></th>
					<th></th>
					<!-- <td><input type="text"></td> -->
					<td></td>
					<td></td>
					</tr>
				
				</thead>
				</table>
	
		</div>
	
	<div class="btn_div">
				<input type="button" id="spotRegisterInsertBtn" value="지점 등록">
				<input type="button" id="spotRegisterResetBtn" value="취소">
			</div>
	</form>
	
<!--------------------------------------- 기업 연결 모달창-->
<div class="modal" id="takeComName_modal">
    <div class="modal-content">
        <table>
            <tr class="bordered-row">
                <td><input type="text" name="searchComName" size="20" placeholder="기업명"></td>
                <td><input type="button" id="searchTakeComNameBtn" value="검색"></td>
            </tr>
        </table>
        <div class="list_div_modal">
            <table class="list_div_tbl_modal" id="takeComName_tbl">
                <thead>
                    <tr class="top_bar_of_list_modal">
                        <th>기업명</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 여기에 기업명을 표시할 행들이 동적으로 추가될 것입니다. -->
                </tbody>
            </table>
        </div>
        <!-- 페이지 부분 제거 후 JS로 그릴 예정 -->
        <!-- page -->
        <div id="pagination" class="page-wrap" align="center" style="width: 1500px;">
            <ul class="page-nation">
                <!-- 페이지네이션은 이곳에 동적으로 생성될 것입니다. -->
            </ul>
        </div>
        <div class="modal-footer">
            <button type="button" id="close_takeComName_modal">닫기</button>
        </div>
    </div>
</div>



<!--------------------------------------- 담당자명 가져오기 모달창-->
<div class="modal" id="takeCsName_modal">
    <div class="modal-content">
        <table>
            <tr class="bordered-row">
                <td><input type="text" name="searchTakeCsName" size="20" placeholder="담당자명"></td>
                <td><input type="button" id="searchTakeCsNameBtn" value="검색"></td>
            </tr>
        </table>
        <div class="list_div_modal">
            <table class="list_div_tbl_modal" id="takeCsName_tbl">
                <thead>
                    <tr class="top_bar_of_list_modal">
                        <th>담당자명</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 여기에 담당자명을 표시할 행들이 동적으로 추가될 것입니다. -->
                </tbody>
            </table>
        </div>
        <!-- 페이지 부분 제거 후 JS로 그릴 예정 -->
        <!-- page -->
        <div id="pagination" class="page-wrap" align="center" style="width: 1500px;">
            <ul class="page-nation">
                <!-- 페이지네이션은 이곳에 동적으로 생성될 것입니다. -->
            </ul>
        </div>
        <div class="modal-footer">
            <button type="button" id="close_takeCsName_modal">닫기</button>
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
		src="/resources/js/company/custMgmtPage/spotRegister.js"></script>
	<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotRegisterModal.js"></script>
</body>
</html>