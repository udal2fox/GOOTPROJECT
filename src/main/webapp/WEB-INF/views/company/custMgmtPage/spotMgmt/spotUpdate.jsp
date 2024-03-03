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
		
		
		<div class="spot_subject_div">
			<h5 class="spot_subject_title" align="left">●지점 정보</h5>

			<table class="spot_subject_tbl">
				<thead>
					<tr>
						<th>기업 연결</th>
						<td><input type="text"></td>
						<td>
							<input type="button" id="imgBtnSearchComName">
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
							<input type="button" id="imgBtnSearchAddr ">
						</td>
						<th></th>
						<td></td>
				
						<tr>
							<td colspan="2" rowspan="2">
							<input type="text" placeholder="상세 주소" id="detailedAddr"></td>
						
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
						<td><input type="text" readonly></td>
						<td><input type="button" id="imgBtnAgreementFileUpload"></td>

						<th rowspan="2">계약 일자</th>
						<td rowspan="2"><input type="text" readonly></td>
					</tr>
				

					<tr>
						<td>파일명</td>
						<td></td>
					</tr>

					<tr>
						<th>약정 기간</th>
						<td>
							<select name="agreementTerm">
								<option value="6">6개월</option>
								<option value="12">12개월</option>
								<option value="24">24개월</option>
								<option value="36">36개월</option>
							
							</select>
						
						</td>
						
						<td></td>

						<th>자동 연장 여부</th>
						<td>
						
						<select name="autoExtension">
								<option value="Y">Y</option>
								<option value="N">N</option>
							
							</select>
						
					</td>
					<td></td>
					</tr>
					<tr>
						<th>인당 예산</th>
						<td><input type="number"></td>
						<td></td>
						<th>계약 인원</th>
						<td><input type="text"></td>
						<td></td>
						
						
					</tr>
					<tr>
						<th>결제 방식</th>
						<td>
						
						
							<select name="payMethod">
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
			
			<table class="spot_subject_tbl">
				<thead>
					<tr>
					<th>활동 여부</th>
					<td>
							<select name="serviceStatus">
								<option value="활동">활동</option>
								<option value="중단">중단</option>
								<option value="해지">해지</option>
							</select>

					</td>
					<td></td>
					<th></th>
					<td></td>
					<td></td>
					</tr>
					<tr>
						<th>해지 처리자</th>
						<td><input type="text"></td>
						<td>
							<input type="button" id="imgBtnSearchEname">
						</td>
						<th>해지 사유</th>
						<td>
							<select name="cancelReason">
								<option value="지점 변경/재등록">지점 변경/재등록</option>
								<option value="단가 불만족">단가 불만족</option>
								<option value="상품 불만족">상품 불만족</option>
								<option value="서비스 불만족">서비스 불만족</option>
								<option value="복지 예산 삭감">복지 예산 삭감</option>
								<option value="직원 만족도 불만">직원 만족도 불만</option>
							</select>
						
						</td>
						<td></td>

					</tr>
					<tr>
						<th>상세 사유</th>
						<td colspan="5">
							<textarea placeholder="내용을 입력해주세요" style="resize: none"></textarea>
						</td>
					
					</tr>
				
				</thead>
				</table>
	
				<h5 class="spot_subject_title" align="left">●담당자 정보</h5>

			<table class="spot_subject_tbl">
				<thead>
					<tr>
					<th>담당자명</th>
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
						<input type="email">
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
	
	<div class="btn_div">
				<input type="button" id="spotUpdateBtn" value="수정">
				<input type="button" id="spotUpdateResetBtn" value="취소">
			</div>
	
	</div>
	</div>
</body>
</html>