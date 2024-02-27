<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
		<div class="subject_content">
			<h5 class="subject_title" align="left">●상담 신청 내용</h5>

			<table class="subject_content_tbl">
				<thead>
					<tr>
						<th>신청일</th>
						<td>
							
						</td>
						<th>응대일</th>
						<td>
						
						</td>
						<th>지역</th>
						<td>
							
						</td>
					</tr>
					<tr>
						<th>기업명</th>
						<td>
							
						</td>
						<th>직원수</th>
						<td>
							
						</td>
						<th>예산</th>
						<td>
							
						</td>
					</tr>
					<tr>
						<th>신청인</th>
						<td>
							
						</td>
						<th>연락처</th>
						<td>
							
						</td>
						<th>이메일</th>
						<td>
							
						</td>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td colspan="5" id="inquiryDetails">
						</td>
					</tr>
				
				</thead>
			
			</table>
			
			
		<h5 class="subject_title" align="left">●영업 내용</h5>

			<table class="subject_content_tbl_2">
				<thead>
					<tr>
						<th>영업 담당자</th>
						<td>
							<input type="text" id="searchEname" placeholder="영업 담당자" >
						</td>
							<th>영업 상태</th>
						<td>
							<select name="businessStatus" id="selectBusinessStatus">
								<option value="최초 인입">최초 인입</option>
								<option value="응대 완료">응대 완료</option>
								<option value="견적 발송 완료">견적 발송 완료</option>
								<option value="미팅 완료">미팅 완료</option>
								<option value="계약 완료">계약 완료</option>
								<option value="계약 실패">계약 실패</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>영업 히스토리</th>	
						<td colspan="3" style="background-color: #EEEEEE;"></td>
					</tr>
					<tr>
						<th>날짜 </th>
						<td colspan="3"><input type="date" ></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="10"  style="resize: none" id="history" placeholder="영업 히스토리"></textarea></td>
					</tr>
				</thead>
			</table>
				<div class="space_img_buttons">
				 <input type="button" class="img_button" id="img_button_plus">
				 <input type="button" class="img_button" id="img_button_minus">
				</div>

			<table class="subject_content_tbl_2">
				<thead>
					<tr>
						<th>계약 실패 사유</th>	
						<td>
							<select name="failureReasons" id="selectFailureReasons">
								<option value="단가 불만족">단가 불만족</option>
								<option value="상품 불만족">상품 불만족</option>
								<option value="서비스 불만족">서비스 불만족</option>
								<option value="경쟁사 이용">경쟁사 이용</option>
								<option value="중복인입">중복인입</option>
								<option value="허위인입">허위인입</option>
								<option value="기타">기타</option>
							</select>
						</td>
						<td colspan="2" style="background-color: #EEEEEE;"></td>
					</tr>
		
					<tr>
						<th>내용</th>
						<td colspan="3">
						<textarea rows="10" style="resize: none" id="FailureReasonsCmt" placeholder="계약 실패 사유 상세 기재"></textarea>
						</td>
					
					
					</tr>
					
				</thead>
			
			</table>
		
		</div>
		<div class="button_div">
		<input type="button" id="save_button" value="저장">
		</div>

	</div>

</div>

</body>
</html>