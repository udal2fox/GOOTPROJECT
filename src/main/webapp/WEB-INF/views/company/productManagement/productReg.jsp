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
<<<<<<< HEAD
				<form action="">
					<table class="prdinputTable">
						<tr>
							<td>상품코드</td><td colspan="3"><input type="text" class="form-control randomPrdNo" readonly name="prdNo"></td>
=======
				<form action="/prdReg.do" method="post">
					<table class="prdinputTable">
						<tr>
							<td>상품코드</td><td colspan="3"><input type="text" class="form-control randomPrdNo" name="prdNo" readonly></td>
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
						    <td></td>
						    <td>원가</td><td colspan="3"><input type="text" class="form-control cost prdCri" placeholder="필수값" value="0" name="prdCstPri"></td>
						</tr>
						<tr>
							<td>표준유통코드</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="prdSdc"></td>
						    <td></td>
						    <td>원가-공급액</td><td colspan="3"><input type="text" class="form-control criSub" readonly name="prdCstSup"></td>
						</tr>
						<tr>
							<td>입점업체코드</td>
							<td colspan="3">
<<<<<<< HEAD
								<select class="form-select" id="supsNo" name="supsNo">
=======
								<select class="form-select" id="supNo" name="supsNo">
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
								    <c:forEach var="no" items="${codes}">
								    	<option value="${no.supsNo }">${no.supsNo}</option>
								    </c:forEach>
							    </select></td>
						    <td></td>
						    <td>원가-세액</td><td colspan="3"><input type="text" class="form-control tax critax" readonly disabled="disabled" name="prdCstTax"></td>
						</tr>
						<tr>
							<td>상품명</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="prdName"></td>
						    <td></td>
						    <td>판매가</td><td colspan="3"><input type="text" class="form-control cost prdSal" placeholder="필수값" value="0" name="prdSal"></td>
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
							<td>판매가 공급액</td><td colspan="3"><input type="text" class="form-control salSub" readonly name="prdSalSup"></td> 
						</tr>
						<tr>
							<td>대분류</td>
							<td colspan="3">
							    <select class="form-select" id="prdMajor" name="prdMajorCtg">
<<<<<<< HEAD
								    <option value="1" selected>상품권</option>
								    <option value="2">현물</option>
=======
								    <option value="상품권" selected>상품권</option>
								    <option value="현물">현물</option>
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
							    </select>
							</td>
						    <td></td>
						    <td>판매가-세액</td><td colspan="3"><input type="text" class="form-control tax saltax" readonly disabled="disabled" name="prdSalTax"></td>
						</tr>
						<tr>
							<td>소분류</td>
							<td colspan="3">
<<<<<<< HEAD
							    <select class="form-select" id="prdSub" name="prdSubCtg">
								    <c:forEach var="Ctg" items="${items}">
								    	<option value="${Ctg.prdSubCtg }">${Ctg.prdSubCtg }</option>
								    </c:forEach>
							    </select>
=======
								<input type="text" class="form-control" name="prdSubCtg">
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
							</td>
						    <td></td>
						    <td>마진율</td><td colspan="3"><input type="text" class="form-control magin" readonly="readonly" value="0" name="prdMargin"></td>
						</tr>
						<tr>
							<td>상품이미지</td><td colspan="3"><input type="file" class="form-control" id="inputGroupFile02" name="prdImg"></td>
						</tr>
					</table>
<<<<<<< HEAD
						<div class="prdRegBtn">
							<input type="hidden" value="판매중"> 
							<button type="button" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-primary">취소</button>
						</div>
				</form>	
=======
					<div class="prdRegBtn">
						<input type="hidden" value="판매중" name="prdSt"> 
						<button type="button" class="btn btn-primary" onclick="prdReg(this.form);">등록</button>
						<button type="button" class="btn btn-primary" onclick="backPage();">취소</button>
					</div>
				</form>		
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
			</div>
		</div>
	</body>
	<script type="text/javascript" src="/resources/js/company/productPage/prdInput.js"></script> 
	
	</html>