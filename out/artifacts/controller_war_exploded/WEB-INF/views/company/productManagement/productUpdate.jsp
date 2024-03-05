<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/company/productManagementPage/prd.css">
</head>
<body>
	<jsp:include page="../../navBar.jsp"/>
	<div class="container-fluid" align="center">
		<h2 class="h2st">상품 관리</h2>
		<div>
			<form action="">
				<table class="prdinputTable">
					<tr>
						<td>상품코드</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(리드온니)"></td>
					    <td></td>
					    <td>원가</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(자동계산?)"></td>
					</tr>
					<tr>
						<td>표준유통코드</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					    <td></td>
					    <td>원가-공급액</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					</tr>
					<tr>
						<td>입점업체코드</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값"></td>
					    <td></td>
					    <td>원가-세액</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					</tr>
					<tr>
						<td>상품명</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					    <td></td>
					    <td>판매가</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(계산가능)"></td>
					</tr>
					<tr>
						<td>비과세여부</td>
						<td>
  							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
						  	<label class="form-check-label" for="exampleRadios1"> 과세</label>
						</td> 	
						<td>
  							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
						  	<label class="form-check-label" for="exampleRadios1"> 비과세</label>
						</td>
						<td></td>
						<td></td>
						<td>판매가 공급액</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td> 
					</tr>
					<tr>
						<td>대분류</td>
						<td colspan="3">
						    <select class="form-select" id="inputGroupSelect01">
							    <option selected>기존내용에서 밸류받아서</option>
							    <option value="1">상품권</option>
							    <option value="2">현물</option>
						    </select>
						</td>
					    <td></td>
					    <td>판매가-세액</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용(수정가능)"></td>
					</tr>
					<tr>
						<td>소분류</td>
						<td colspan="3">
						    <select class="form-select" id="inputGroupSelect01">
							    <option selected>기존내용에서 밸류받아서</option>
							    <option value="1">과일</option>
							    <option value="2">주류</option>
						    </select>
						</td>
					    <td></td>
					    <td>마진율</td><td colspan="3"><input type="text" class="form-control" placeholder="기존내용((판매 가격 - 구매 가격) / 판매 가격) * 100"></td>
					</tr>
					<tr>
						<td>상품이미지</td><td colspan="3"><input type="file" class="form-control" id="inputGroupFile02"></td>
					</tr>
				</table>
					<div class="prdRegBtn">
						<button type="button" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-secondary">삭제</button>
						<button type="button" class="btn btn-primary">취소</button>
					</div>
			</form>	
		</div>
	</div>
</body>
</html>