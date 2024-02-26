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
		<h2 align="left" class = "h2st">공급처 편집</h2>
		<div>
			<form action="">
				<table class="prdinputTable">
					<tr>
						<td>입점업체코드</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(readonnly)"></td>
					    <td></td>
					    <td>담당자 이름</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					</tr>
					<tr>
						<td>공급처명</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					    <td></td>
					    <td>담당자 연락처</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					</tr>
					<tr>
						<td>주소</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					    <td></td>
					    <td>담당자메일주소</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					</tr>
					<tr>
						<td>공급처구분</td>
						<td>
  							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
						  	<label class="form-check-label" for="exampleRadios1"> 법인</label>
						</td> 	
						<td>
  							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
						  	<label class="form-check-label" for="exampleRadios1"> 개인</label>
						</td> 	
					</tr>
					<tr>
						<td>사업자번호</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					    <td></td>
					    <td>담당자이름2</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(선택사항)"></td>
					</tr>
					<tr>
						<td>사업자등록증</td><td colspan="3"><input type="file" class="form-control" id="inputGroupFile02"></td>
					    <td></td>
					    <td>담당자 연락처2</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(선택사항)"></td>
					</tr>
					<tr>
						<td>사업자 메일주소</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					    <td></td>
					    <td>담당자 메일주소2</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(선택가능)"></td>
					</tr>
					<tr>
						<td>사업자 연락처</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					</tr>
				</table>
				<!--테이블 크기에 잘마추고 패딩줘  -->
					<div class="prdRegBtn">
							<button type="button" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-primary">취소</button>
					</div>
			</form>	
		</div>
	</div>
</body>
</html>
