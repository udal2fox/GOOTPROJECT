<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/company/productManagementPage/prd.css">
</head>
<body style="margin: 0 auto;">
	<jsp:include page="../../navBar.jsp"/>
	<div class="container-fluid" align="center">
		<h2 align="left" class = "h2st">공급처 신규등록</h2>
		<div>
			<form action="insertSupsReg" method="post">
				<table class="prdinputTable">
					<tr>
						<td>입점업체코드</td><td colspan="3"><input type="text" class="form-control" readonly="readonly" value="${NSN}" name="supsNo"></td>
					    <td></td>
					    <td>담당자 이름</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsName"></td>
					</tr>
					<tr>
						<td>공급처명</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsCo"></td>
					    <td></td>
					    <td>담당자 연락처</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsPhone"></td>
					</tr>
					<tr>
						<td>주소</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsAddr"></td>
					    <td></td>
					    <td>담당자메일주소</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsEmail"></td>
					</tr>
					<tr>
						<td>공급처구분</td>
						<td> 
  							<input class="form-check-input" type="radio" name="supsBnt" id="exampleRadios1" value="법인" checked>
						  	<label class="form-check-label" for="exampleRadios1">법인</label>
						</td> 	
						<td>
  							<input class="form-check-input" type="radio" name="supsBnt" id="exampleRadios1" value="개인">
						  	<label class="form-check-label" for="exampleRadios1">개인</label>
						</td> 	
					</tr>
					<tr>
						<td>사업자번호</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsBizRegNum"></td>
					    <td></td>
					    <td>담당자이름2</td><td colspan="3"><input type="text" class="form-control" placeholder="선택값" name="supsSubName"></td>
					</tr>
					<tr>
						<td>사업자등록증</td><td colspan="3"><input type="file" class="form-control" id="supsBizLic" name="supsBizLic" multiple="multiple"></td>
					    <td></td>
					    <td>담당자 연락처2</td><td colspan="3"><input type="text" class="form-control" placeholder="선택값" name="supsSubPhone"></td>
					</tr>
					<tr>
						<td>사업자 메일주소</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsCoEmail"></td>
					    <td></td>
					    <td>담당자 메일주소2</td><td colspan="3"><input type="text" class="form-control" placeholder="선택값" name="supsSubEmail"></td>
					</tr>
					<tr>
						<td>사업자 연락처</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="supsCt"></td>
					</tr>
				</table>
				<!--테이블 크기에 잘마추고 패딩줘  -->
					<div class="prdRegBtn">
						<input type="hidden" value="거래중" name="supsSt"> 
						<button type="button" class="btn btn-primary" onclick="supsReg(this.form);">등록</button>
						<button type="button" class="btn btn-primary" onclick="backPage();">취소</button>
					</div>
			</form>	
		</div>
	</div>
</body>
<script type="text/javascript" src="/resources/js/company/productPage/supsReg.js"></script> 
</html>
