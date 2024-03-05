	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
			<h2 class="h2st">상품 신규등록</h2>
			<div>
				<form action="">
					<table class="prdinputTable">
						<tr>
							<td>상품코드</td><td colspan="3"><input type="text" class="form-control randomPrdNo" readonly></td>
						    <td></td>
						    <td>원가</td><td colspan="3"><input type="text" class="form-control cost prdCri" placeholder="필수값" value="0"></td>
						</tr>
						<tr>
							<td>표준유통코드</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값"></td>
						    <td></td>
						    <td>원가-공급액</td><td colspan="3"><input type="text" class="form-control criSub" readonly></td>
						</tr>
						<tr>
							<td>입점업체코드</td>
							<td colspan="3">
								<select class="form-select" id="supsNo" name="supsNo">
								    <c:forEach var="no" items="${codes}">
								    	<option value="${no.supsNo }">${no.supsNo}</option>
								    </c:forEach>
							    </select></td>
						    <td></td>
						    <td>원가-세액</td><td colspan="3"><input type="text" class="form-control tax critax" readonly disabled="disabled"></td>
						</tr>
						<tr>
							<td>상품명</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값"></td>
						    <td></td>
						    <td>판매가</td><td colspan="3"><input type="text" class="form-control cost prdSal" placeholder="필수값" value="0"></td>
						</tr>
						<tr>	
							<td>비과세여부</td>
							<td>
	  							<input class="form-check-input" type="radio" name="prdTaxExSt" id="exampleRadios1" value="O" checked>
							  	<label class="form-check-label" for="exampleRadios1">과세</label>
							</td> 	
							<td>
	  							<input class="form-check-input" type="radio" name="prdTaxExSt" id="exampleRadios1" value="X" checked>
							  	<label class="form-check-label" for="exampleRadios1">비과세</label>
							</td>
							<td></td>
							<td></td>
							<td>판매가 공급액</td><td colspan="3"><input type="text" class="form-control salSub" readonly></td> 
						</tr>
						<tr>
							<td>대분류</td>
							<td colspan="3">
							    <select class="form-select" id="prdMajor" name="prdMajorCtg">
								    <option value="1" selected>상품권</option>
								    <option value="2">현물</option>
							    </select>
							</td>
						    <td></td>
						    <td>판매가-세액</td><td colspan="3"><input type="text" class="form-control tax saltax" readonly disabled="disabled"></td>
						</tr>
						<tr>
							<td>소분류</td>
							<td colspan="3">
							    <select class="form-select" id="prdSub" name="prdSubCtg">
								    <c:forEach var="Ctg" items="${items}">
								    	<option value="${Ctg.prdSubCtg }">${Ctg.prdSubCtg }</option>
								    </c:forEach>
							    </select>
							</td>
						    <td></td>
						    <td>마진율</td><td colspan="3"><input type="text" class="form-control magin" readonly="readonly" value="0"></td>
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
	<script type="text/javascript" src="/resources/js/company/productPage/prdInput.js"></script> 
	
	</html>