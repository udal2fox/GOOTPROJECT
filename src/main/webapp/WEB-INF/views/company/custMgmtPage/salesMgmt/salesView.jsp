<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/salesMgmt.css">
<title>newSalesViewDetails.jsp</title>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp"/>
	</div>
	
	<div class="container-fluid" align="center" style="padding: 100px;">
	
	<div class="entire">
	<div class="title" align="left">
		<h3>신규 영업</h3>
	</div>
	<div align="left">
	<div class="subject_title_div" style="width:162px;">● 상담 신청 내용
	</div>
	</div>
	<table class="subject_content_tbl" id="consult_tbl">
	<thead>
	<tr>
						<td class="tbl_subtitle">기업명</td>
						<td>
							<input type="text" name="csCompanyName" value="${consultVO.csCompanyName }" readonly 
							>
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
						<td></td>
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
						<td colspan="2" >
							<input type="email" name="csEmail" value="${consultVO.csEmail }" readonly style="width:250px;">
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
						<textarea rows="10"  style="width: 95%; resize: none" readonly>${consultVO.csContent}</textarea>
						
						</td>

					</tr>

	</thead>
	</table>

	<div align="left">
	<div class="subject_title_div">● 영업 내용
	</div>
	</div>
	
	<form method="post">
	<table class="subject_content_tbl">
	<thead>
	
						<tr>
						<td class="tbl_subtitle">영업 담당자</td>
						<td><div class="input-with-image">
						<input type="text" name="csEname" value="${consultVO.csEname }" readonly><a href="#" id="open_searchEname_modal">
						<input type="button" id="imgBtnSearchEname"></a>
						</div></td>
						<td></td>
						<td class="tbl_subtitle">영업 상태</td>
						<td>
							<select name="csStatus" id="selectSalesStatus">
							<option value="최초 인입" ${consultVO.csStatus eq '최초 인입' ? 'selected' : ''}>최초 인입</option>
							<option value="응대 완료" ${consultVO.csStatus eq '응대 완료' ? 'selected' : ''}>응대 완료</option>
							<option value="견적 발송 완료" ${consultVO.csStatus eq '견적 발송 완료' ? 'selected' : ''}>견적 발송 완료</option>
							<option value="미팅 완료" ${consultVO.csStatus eq '미팅 완료' ? 'selected' : ''}>미팅 완료</option>
							<option value="계약 완료" ${consultVO.csStatus eq '계약 완료' ? 'selected' : ''}>계약 완료</option>
							<option value="계약 실패" ${consultVO.csStatus eq '계약 실패' ? 'selected' : ''}>계약 실패</option>
							
		
							</select>
						</td>
						<td></td>
						<td class="tbl_subtitle">응대일</td>
						<td>
							<input type="date" name="csResponseDate" placeholder="날짜 입력" value="${consultVO.csResponseDate }" >
						</td>
						<td></td>
					</tr>
					 <tr>
		                <td class="tbl_subtitle">영업 히스토리</td>
		                <td colspan="8" style="background-color: #EEEEEE;"></td>
		            </tr>
			</thead>
			</table>		
		    <div class="salesHistory">
		        <table class="subject_content_tbl">
		            <tr>
		                <td class="tbl_subtitle">날짜 </td>
		                <td colspan="8">
		                    <input type="date" name="cshDate1" placeholder="영업 날짜 선택" value="${cshVO.cshDate1 }" style="width: 150px">
		                </td>
		            </tr>
		            <tr>
		                <td class="tbl_subtitle">내용</td>
		                <td colspan="8">
		                    <textarea rows="10" placeholder="영업 내용 입력" style="width: 90%; resize: none" name="cshContent1">${cshVO.cshContent1 }</textarea>
		                </td>
		            </tr>
		        </table>
		    </div>
		    
		    
			<div class="salesHistoryEntry" style="display: none;">
		        <table class="subject_content_tbl">
		            <tr>
		                <td class="tbl_subtitle">날짜 </td>
		                <td colspan="8">
		                    <input type="date" name="cshDate2" placeholder="영업 날짜 선택" value="${cshVO.cshDate2 }" style="width: 150px">
		                </td>
		            </tr>
		            <tr>
		                <td class="tbl_subtitle">내용</td>
		                <td colspan="8">
		                    <textarea rows="10" placeholder="영업 내용 입력" style="width: 90%; resize: none" name="cshContent2">${cshVO.cshContent2 }</textarea>
		                </td>
		            </tr>
		        </table>
		    </div>
		    	    <div class="salesHistoryEntry" style="display: none;">
		        <table class="subject_content_tbl">
		            <tr>
		                <td class="tbl_subtitle">날짜 </td>
		                <td colspan="8">
		                    <input type="date" name="cshDate3" placeholder="영업 날짜 선택" value="${cshVO.cshDate3 }" style="width: 150px">
		                </td>
		            </tr>
		            <tr>
		                <td class="tbl_subtitle">내용</td>
		                <td colspan="8">
		                    <textarea rows="10" placeholder="영업 내용 입력" style="width: 90%; resize: none" name="cshContent3">${cshVO.cshContent3 }</textarea>
		                </td>
		            </tr>
		        </table>
		    </div>
		    	    <div class="salesHistoryEntry" style="display: none;">
		        <table class="subject_content_tbl">
		            <tr>
		                <td class="tbl_subtitle">날짜 </td>
		                <td colspan="8">
		                    <input type="date" name="cshDate4" placeholder="영업 날짜 선택" value="${cshVO.cshDate4 }" style="width: 150px">
		                </td>
		            </tr>
		            <tr>
		                <td class="tbl_subtitle">내용</td>
		                <td colspan="8">
		                    <textarea rows="10" placeholder="영업 내용 입력" style="width: 90%; resize: none" name="cshContent4">${cshVO.cshContent4 }</textarea>
		                </td>
		            </tr>
		        </table>
		    </div>
		    	    <div class="salesHistoryEntry" style="display: none;">
		        <table class="subject_content_tbl">
		            <tr>
		                <td class="tbl_subtitle">날짜 </td>
		                <td colspan="8">
		                    <input type="date" name="cshDate5" placeholder="영업 날짜 선택" value="${cshVO.cshDate5 }" style="width: 150px">
		                </td>
		            </tr>
		            <tr>
		                <td class="tbl_subtitle">내용</td>
		                <td colspan="8">
		                    <textarea rows="10" placeholder="영업 내용 입력" style="width: 90%; resize: none" name="cshContent5">${cshVO.cshContent5 }</textarea>
		                </td>
		            </tr>
		        </table>
		    </div>

	
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
		<input type="hidden" name="consultHistoryNo" value="${cshVO.consultHistoryNo }">
		</div>
</form>
	</div>

</div>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesView.js"></script>
</body>
</html>