<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/spotMgmt.css">
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
		
		
		<div class="spot_update">
			<h5 class="spot_update_title" align="left">●지점 정보</h5>

			<table class="spot_update_tbl">
				<thead>
					<tr>
						<th>기업 연결</th>
						<td><input type="text"></td>
						<td>
							<input type="button" id="img_button_searchComName">
						</td>

						<th>지점명</th>
						<td>
							<input type="text">
						</td>
						<td rowspan="9"></td>
					</tr>

					<tr>
						<th rowspan="3">주소</th>
						<td>
							<input type="text" placeholder="주소">
						</td>
						<td>
							<input type="button" id="img_button_searchAddr">
						</td>
						<th></th>
						<td></td>
				
						<tr>
							<td colspan="2" rowspan="2">
							<input type="text" placeholder="상세 주소" id="detailedAddress"></td>
						
						<th>연락처</th>
						<td>
							<input type="text">
						</td>
						</tr>
						<tr>
							<th></th>
							<td></td>
						</tr>
						
						<tr>
						<th rowspan="2">계약서</th>
						<td><input type="text"></td>
						<td><input type="button" id="img_button_upload"></td>

						<th rowspan="2">계약 일자</th>
						<td rowspan="2"><input type="text"></td>
					</tr>
				

					<tr>
						<td>파일명</td>
						<td></td>
					</tr>

					<tr>
						<th>약정 기간</th>
						<td>
							<select name="AgreementDuration">
								<option value="6">6개월</option>
								<option value="12">12개월</option>
								<option value="24">24개월</option>
								<option value="36">36개월</option>
							
							</select>
						
						</td>
						
						<td></td>

						<th>자동 연장 여부</th>
						<td>
						
						<select name="autoRenewal">
								<option value="Y">Y</option>
								<option value="N">N</option>
							
							</select>
						
					</td>
					<td></td>
					</tr>
					<tr>
						<th>인당 예산</th>
						<td><input type="text"></td>
						<td></td>
						<th>계약 인원</th>
						<td><input type="text"></td>
						<td></td>
						
						
					</tr>
					<tr>
						<th>결제 방식</th>
						<td>
						
						
							<select name="paymentMethod">
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
			
				
				<h5 class="spot_update_title" align="left">●담당자 정보</h5>

			<table class="spot_update_tbl">
				<thead>
					<tr>
					<th>담당자</th>
					<td>
						<input type="text">
					</td>
					<td></td>
					<th>연락처</th>
					<td><input type="text"></td>
					<td></td>
					</tr>
					<tr>
					<tr>
					<th>이메일</th>
					<td>
						<input type="text">
					</td>
					<td></td>
					<th>비밀번호</th>
					<td><input type="text"></td>
					<td></td>
					</tr>
					<tr>
					<tr>
					<th colspan="3"></th>
					<th>비밀번호 확인</th>
					<td><input type="text"></td>
					<td></td>
					</tr>
				
				</thead>
				</table>
	
		</div>
	
	<div class="button_div">
				<input type="button" id="company_registration_update_button" value="등록">
				<input type="button" id="company_registration_reset_button" value="취소">
			</div>
	
	</div>
	</div>
</body>
</html>