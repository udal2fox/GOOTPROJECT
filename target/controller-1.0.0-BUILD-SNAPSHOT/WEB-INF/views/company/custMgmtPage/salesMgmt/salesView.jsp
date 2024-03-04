<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/salesMgmt.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>newSalesViewDetails.jsp</title>
</head>
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp"/>
	</div>
	
	<div class="container-fluid" align="center" style="padding: 100px;">
	
	<div class="entire">
	<div class="title" align="left">
		<h3>신규 영업</h3>
	</div>
	<h5 class="subject_title" align="left">●상담 신청 내용</h5>
	<table class="subject_content_tbl">
	<thead>
	<tr>
						<td class="tbl_subtitle">기업명</td>
						<td>
							<input type="text" name="csCompanyName" value="${consultVO.csCompanyName }" readonly>
						</td>
						<td rowspan="3"></td>
						<td class="tbl_subtitle">상담 신청일</td>
						<td>
							<input type="text" name="csDate" value="${consultVO.csDate }" readonly>
						</td>
						<td rowspan="3"></td>
						<td class="tbl_subtitle">지역</td>
						<td>
							<input type="text" name="csArea" value="${consultVO.csArea }" readonly>
						</td>
						<td rowspan="3"></td>
					</tr>
	
	<tr>
						<td class="tbl_subtitle">담당자</td>
						<td>
							<input type="text" name="csName" value="${consultVO.csName }" readonly>
						</td>
						
						<td class="tbl_subtitle">연락처</td>
						<td>
							<input type="text" name="csContact" value="${consultVO.csContact }" readonly>
						</td>
						
						<td class="tbl_subtitle">이메일</td>
						<td>
							<input type="email" name="csEmail" value="${consultVO.csEmail }" readonly>
						</td>
						
						
					</tr>	
					<tr>
						<td class="tbl_subtitle">직원 수</td>
						<td>
							<input type="text" name="csEmpNum" value="${consultVO.csEmpNum }" readonly>
						</td>
						
						<td class="tbl_subtitle">예상 예산</td>
						<td>
							<input type="text" name="csBdgt" value="${consultVO.csBdgt }" readonly>
						</td>
						
						<td colspan="3"></td>

					</tr>
					<tr>
						<td class="tbl_subtitle">문의 내용</td>
						<td colspan="8" id="inquiryDetails">
						<textarea rows="10"  style="width: 90%; resize: none" readonly>${consultVO.csContent}</textarea>
						
						</td>

					</tr>

	</thead>
	</table>
	
	
	<h5 class="subject_title" align="left">●영업 내용</h5>
	
	<form method="post">
	<table class="subject_content_tbl">
	<thead>
	
	<tr>
						<td class="tbl_subtitle">영업 담당자</td>
						<td>
							<input type="text" name="csEname" value="${consultVO.csEname }" readonly>
							
						</td>
						<td>
							<input type="button" class="salesViewBtns" id="imgBtnSearchEname">
						</td>
						<td class="tbl_subtitle">영업 상태</td>
						<td>
							<select name="selectSalesStatus" id="selectSalesStatus">
								<option value="최초 인입">최초 인입</option>
								<option value="응대 완료">응대 완료</option>
								<option value="견적 발송 완료">견적 발송 완료</option>
								<option value="미팅 완료">미팅 완료</option>
								<option value="계약 완료">계약 완료</option>
								<option value="계약 실패">계약 실패</option>
							</select>
						</td>
						<td></td>
						<td class="tbl_subtitle">응대일</td>
						<td>
							<input type="date" name="csResponseDate" value="${consultVO.csResponseDate }">
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="tbl_subtitle">영업 히스토리</td>	
						<td colspan="8" style="background-color: #EEEEEE;"></td>
					</tr>
					<tr>
						<td class="tbl_subtitle">날짜 </td>
						<td colspan="8"><input type="date" name="cshDate1" value="${cshVO.cshDate1 }"></td>
					</tr>
					<tr>
						<td class="tbl_subtitle">내용</td>
						<td colspan="8">
						<textarea rows="10"  style="width: 90%; resize: none" name="cshContent1" >${cshVO.cshContent1 }</textarea>
						</td>
					</tr>
	</thead>
	</table>
	
	<div class="space_img_btns">
				 <input type="button" class="salesViewBtns" id="imgBtnPlus">
				 <input type="button" class="salesViewBtns" id="imgBtnMinus">
				</div>
			<table class="subject_content_tbl" id="failReasonDiv" style="display:none">
				<thead>
				<tr>
						<td class="tbl_subtitle">계약 실패 사유</td>	
						<td>
							<select name="csFailReason" id="selectCsFailReason">
								<option value="단가 불만족">단가 불만족</option>
								<option value="상품 불만족">상품 불만족</option>
								<option value="서비스 불만족">서비스 불만족</option>
								<option value="경쟁사 이용">경쟁사 이용</option>
								<option value="중복인입">중복인입</option>
								<option value="허위인입">허위인입</option>
								<option value="기타">기타</option>
							</select>
						</td>
						<td colspan="7"></td>
						
					</tr>

				<tr>
						<td class="tbl_subtitle">내용</td>
						<td colspan="8">
						<textarea rows="10" style="width: 90%; resize: none" id="csFailDetailReason" placeholder="계약 실패 사유 상세 기재" name="csFailDetailReason"></textarea>
						</td>
					
					
					</tr>
				
				
				</thead>
				</table>
	
		<div class="btn_div">
		<input type="button" class="salesViewBtns" id="saveBtn" value="저장">
		<input type="hidden" name="consultNo" value="${consultVO.consultNo }">
		
		</div>
</form>
	</div>

</div>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesView.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesMgmt.js"></script>

</body>
</html>