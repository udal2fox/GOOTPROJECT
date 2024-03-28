<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/spotMgmt.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<title></title>
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
		
		<form method="post" enctype="multipart/form-data">
		<div class="spot_subject_div">
			<div align="left">
						<div class="subject_title_div">●지점 정보
						</div>
					</div>

			<table class="spot_subject_tbl">
				<thead>
					<tr>
						<th>기업명</th>
						<td><div class="input-with-image">
						<input type="text" name="comName" readonly value="${spotVO.comName }"><a href="#" id="open_takeComName_modal">
						<input type="hidden" name="companyNo" value="">
						<input type="button" id="imgBtnSearchComName"></a>
						</div></td>
						<td></td>
						<th>지점명</th>
						<td>
							<input type="text" name="spName" value="${spotVO.spName }">
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
							<input type="text" placeholder="상세 주소" name="spDetailAddr" id="detailedAddr" value="${spotVO.spDetailAddr }"></td>
						
						<th>연락처</th>
						<td>
							<input type="text" name="spContact" value="${spotVO.spContact }">
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
								
								 <input type="file" name="newFile" id="newFileInput" multiple="multiple" style="display: none;">
								</div>
								</td>
						<td></td>
						<th rowspan="2">계약 일자</th>
						<td rowspan="2"><input type="text" name ="spAgreementDate" readonly value="${spotVO.spAgreementDate }"></td>
					</tr>
				

				<tr>
				    <td id="uploadedFileName">
				        <a href="#" onclick="downloadFile('${spotVO.spAgreementFile}')">${spotVO.spAgreementFile}</a>
				    </td>
				    <td></td>
				</tr>

					<tr>
						<th>약정 기간</th>
						<td>
							<select name="spAgreementTerm">
								<option value="6" ${spotVO.spAgreementTerm == 6 ? 'selected' : ''}>6 개월</option>
								<option value="12" ${spotVO.spAgreementTerm == 12 ? 'selected' : ''}>12 개월</option>
								<option value="24" ${spotVO.spAgreementTerm == 24 ? 'selected' : ''}>24 개월</option>
								<option value="36" ${spotVO.spAgreementTerm == 36 ? 'selected' : ''}>36 개월</option>
							
							</select>
						
						</td>
						
						<td></td>

						<th>자동 연장 여부</th>
						<td>
						
						<select name="spAutoExtension">
								<option value="Y" ${spotVO.spAutoExtension eq 'Y' ? 'selected' : ''}>Y</option>
								<option value="N" ${spotVO.spAutoExtension eq 'N' ? 'selected' : ''}>N</option>
							
							</select>
						
					</td>
					<td></td>
					</tr>
					<tr>
						<th>인당 예산</th>
						<td><input type="text" name="spBdgt" value="${spotVO.spBdgt }"></td>
						<td></td>
						<th>계약 인원</th>
						<td><input type="text" name="spEmpNum" value="${spotVO.spEmpNum }"></td>
						<td></td>
						
						
					</tr>
					<tr>
						<th>결제 방식</th>
						<td>
						
						
							<select name="spPayMethod">
								<option value="계산서" ${spotVO.spAutoExtension eq '계산서' ? 'selected' : ''}>계산서</option>
								<option value="카드" ${spotVO.spAutoExtension eq '카드' ? 'selected' : ''}>카드</option>
							
							</select>
						
						
						</td>
						<td></td>
						<th></th>
						<td></td>
						<td></td>
					</tr>
				</thead>
			</table>
			
			<table class="spot_subject_tbl">
				<thead>
					<tr>
					<th>활동 여부</th>
					<td>
							<select name="spStatus">
								<option value="활동" ${spotVO.spStatus eq '활동' ? 'selected' : ''}>활동</option>
								<option value="중단" ${spotVO.spStatus eq '중단' ? 'selected' : ''}>중단</option>
								<option value="해지" ${spotVO.spStatus eq '해지' ? 'selected' : ''}>해지</option>
							</select>
							<input type="hidden" name="spChangeDate" id="spChangeDate" value="">
					</td>
					<td></td>
					<th></th>
					<td></td>
					<td></td>
					</tr>
					<tr class="termination-fields">
						<th>해지 처리자</th>
						
						<td><div class="input-with-image">
						<input type="text" name="spCancelEname" readonly value="${spotVO.spCancelEname }"><a href="#" id="open_spCancelEname_modal">
						<input type="button" id="imgBtnSearchEname"></a>
						</div></td>
						<td></td>
						<th>해지 사유</th>
						<td>
							<select name="spCancelReason">
								<option value="지점 변경/재등록" ${spotVO.spCancelReason eq '지점 변경/재등록' ? 'selected' : ''}>지점 변경/재등록</option>
								<option value="단가 불만족" ${spotVO.spCancelReason eq '단가 불만족' ? 'selected' : ''}>단가 불만족</option>
								<option value="상품 불만족" ${spotVO.spCancelReason eq '상품 불만족' ? 'selected' : ''}>상품 불만족</option>
								<option value="서비스 불만족" ${spotVO.spCancelReason eq '서비스 불만족' ? 'selected' : ''}>서비스 불만족</option>
								<option value="복지 예산 삭감" ${spotVO.spCancelReason eq '복지 예산 삭감' ? 'selected' : ''}>복지 예산 삭감</option>
								<option value="직원 만족도 불만" ${spotVO.spCancelReason eq '직원 만족도 불만' ? 'selected' : ''}>직원 만족도 불만</option>
							</select>
						
						</td>
						<td></td>

					</tr>
					<tr class="termination-fields">
						<th>상세 사유</th>
						<td colspan="5">
							<textarea placeholder="내용을 입력해주세요" style="resize: none" name="spCancelDetailReason">${spotVO.spCancelDetailReason }</textarea>
						</td>
					
					</tr>
				
				</thead>
				</table>
	
				<div align="left">
						<div class="subject_title_div" style="width:140px;">●담당자 정보
						</div>
					</div>

			<table class="spot_subject_tbl">
				<thead>
					<tr>
					<th>담당자명</th>
					<td><div class="input-with-image">
						<input type="text" name="userName" placeholder="담당자명 검색 또는 작성" value="${userVO.userName }"><a href="#" id="open_takeCsName_modal">
						<input type="button" id="imgBtnTakeCsName"></a>
						</div></td>
						<td></td>
					<th>연락처</th>
					<td><input type="text" name="userContact" value=${userVO.userContact }></td>
					<td></td>
					</tr>
					<tr>
					<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="userEmail" value=${userVO.userEmail }>
					</td>
					<td></td>
					<th>비밀번호</th>
					<td><input type="text" name="userPw" value=${userVO.userPw }></td>
					<td></td>
					</tr>
					<tr>
					<tr>
					<th colspan="3"></th>
					<th>비밀번호 확인</th>
					<td><input type="text"  value=${userVO.userPw }></td>
					<td></td>
					</tr>
				
				</thead>
				</table>
	
		</div>
	
	<div class="btn_div">
				<input type="button" id="spotUpdateBtn" value="수정">
				<input type="button" id="spotUpdateResetBtn" value="취소" onclick="backPage();">
				<input type="hidden" name="spotNo" value="${spotVO.spotNo }">
			</div>
	</form>
	
	
	
<!--------------------------------------- 기업 연결 모달창-->
<div class="modal" id="takeComName_modal">
    <div class="modal-content">
    <div class="modal-top">
        <table>
            <tr class="bordered-row">
                <td><input type="text" name="searchComName" size="20" placeholder="기업명" style="border: 1px solid black;"></td>
                <td><input type="button" id="searchTakeComNameBtn" value="검색"></td>
            </tr>
        </table>
        </div>
        <div class="list_div_modal">
            <table class="list_div_tbl_modal" id="takeComName_tbl">
                <thead>
                    <tr class="top_bar_of_list_modal">
                        <th>기업명</th>
                    </tr>
                </thead>
                <tbody>
               
                </tbody>
            </table>
        <!-- 페이지 부분 제거 후 JS로 그릴 예정 -->
        <!-- page -->
        </div>
        <div id="pagination" class="page-wrap" align="center" style="width: 1500px;">
            <ul class="page-nation">
                <!-- 페이지네이션은 이곳에 동적으로 생성될 것입니다. -->
            </ul>
        </div>
        <div class="modal-bottom">
       
        	<input type="button" id="close_takeComName_modal" value="닫기" >
        </div>
    </div>
</div>



<!--------------------------------------- 담당자명 가져오기 모달창-->
<div class="modal" id="takeCsName_modal">
    <div class="modal-content">
    <div class="modal-top">
        <table>
            <tr class="bordered-row">
                <td><input type="text" name="searchTakeCsName" size="20" placeholder="담당자명" style="border: 1px solid black;"></td>
                <td><input type="button" id="searchTakeCsNameBtn" value="검색"></td>
            </tr>
        </table>
        </div>
        <div class="list_div_modal">
            <table class="list_div_tbl_modal" id="takeCsName_tbl">
                <thead>
                    <tr class="top_bar_of_list_modal">
                        <th>담당자명</th>
                    </tr>
                </thead>
                <tbody>
                
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
         <div class="modal-bottom">
       
        	<input type="button" id="close_takeCsName_modal" value="닫기">
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
		src="/resources/js/company/custMgmtPage/spotView.js"></script>
		<script type="text/javascript"
		src="/resources/js/company/custMgmtPage/spotViewModal.js"></script>
</body>
</html>