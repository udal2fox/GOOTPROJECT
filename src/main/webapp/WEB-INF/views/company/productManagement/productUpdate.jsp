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
		<h2 class="h2st">상품 관리</h2>
		<div>
			<form action="" method="post" enctype="multipart/form-data">
				<table class="prdinputTable">
					<tr>
						<td>상품코드</td><td colspan="3"><input type="text" class="form-control-plaintext randomPrdNo" name="prdNo" readonly value="${pvo.prdNo }"></td>
					    <td></td>
					    <td>원가</td><td colspan="3"><input type="text" class="form-control cost prdCri" placeholder="필수값" value="${pvo.prdCstPri}" name="prdCstPri"></td>
					</tr>
					<tr>
						<td>표준유통코드</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="prdSdc" value="${pvo.prdSdc}"></td>
					    <td></td>
					    <td>원가-공급액</td><td colspan="3"><input type="text" class="form-control criSub" readonly name="prdCstSup" value="${pvo.prdCstSup}"></td>
					</tr>
					<tr>
						<td>입점업체코드</td>
						<td colspan="3">
							<select class="form-select" id="supNo" name="supsNo">
							    <c:forEach var="no" items="${codes}">
							        <c:choose>
							            <c:when test="${no.supsNo eq pvo.supsNo}">
							                <option value="${no.supsNo}" selected>${no.supsNo}</option>
							            </c:when>
							            <c:otherwise>
							                <option value="${no.supsNo}">${no.supsNo}</option>
							            </c:otherwise>
							        </c:choose>
							    </c:forEach>
							</select>
					    </td>
					    <td></td>
					    <td>원가-세액</td><td colspan="3"><input type="text" class="form-control tax critax" readonly name="prdCstTax" value="${pvo.prdCstTax}" ></td>
					</tr>
					<tr>
						<td>상품명</td><td colspan="3"><input type="text" class="form-control" placeholder="필수값" name="prdName" value="${pvo.prdName}"></td>
					    <td></td>
					    <td>판매가</td><td colspan="3"><input type="text" class="form-control cost prdSal" placeholder="필수값" name="prdSal" value="${pvo.prdSal}"></td>
					</tr>
					<tr>	
						<td>비과세여부</td>
						<td>
  							<input class="form-check-input" type="radio" name="prdTaxExSt" id="exampleRadios1" value="O"
  							<c:if test="${pvo.prdTaxExSt eq 'O' }"> checked="checked" </c:if>>
						  	<label class="form-check-label" for="exampleRadios1">과세</label>
						</td> 	
						<td>
  							<input class="form-check-input taxX" type="radio" name="prdTaxExSt" id="exampleRadios1" value="X"
  							<c:if test="${pvo.prdTaxExSt eq 'X' }"> checked="checked" </c:if>>
						  	<label class="form-check-label" for="exampleRadios1">비과세</label>
						</td>
						<td></td>	
						<td></td>
						<td>판매가 공급액</td><td colspan="3"><input type="text" class="form-control salSub" readonly name="prdSalSup" value="${pvo.getPrdSalSup()}"></td> 
					</tr>
					<tr>
						<td>대분류</td>
						<td colspan="3">
						    <select class="form-select" id="prdMajor" name="prdMajorCtg">
							    <option value="상품권"<c:if test="${pvo.prdMajorCtg eq '상품권' }"> selected="selected" </c:if>>상품권</option>
							    <option value="현물" <c:if test="${pvo.prdMajorCtg eq '현물' }"> selected="selected" </c:if>>현물</option>
						    </select>
						</td>
					    <td></td>
					    <td>판매가-세액</td><td colspan="3"><input type="text" class="form-control tax saltax" readonly name="prdSalTax" value="${pvo.prdSalTax}"></td>
					</tr>
					<tr>
						<td>소분류</td>
						<td colspan="3">
						   <input type="text" class="form-control" name="prdSubCtg" value="${pvo.prdSubCtg}">
						</td>
					    <td></td>
					    <td>마진율</td><td colspan="3"><input type="text" class="form-control magin" readonly="readonly" value="${pvo.prdMargin}" name="prdMargin"></td>
					</tr>
					<tr>
						<td>상품이미지</td><td colspan="3"><input type="file" class="form-control" id="inputGroupFile02" name="file" value="${pvo.prdImg }"></td>
						<td>상품상태</td>
						<td>
  							<input class="form-check-input" type="radio" name="prdSt" id="exampleRadios1" value="판매중"
  							<c:if test="${pvo.prdSt eq '판매중' }"> checked="checked" </c:if>>
						  	<label class="form-check-label" for="exampleRadios1">판매중</label>
						</td> 	
						<td>
  							<input class="form-check-input" type="radio" name="prdSt" id="exampleRadios1" value="일시품절"
  							<c:if test="${pvo.prdSt eq '일시품절' }"> checked="checked" </c:if>>
						  	<label class="form-check-label" for="exampleRadios1">일시품절</label>
						</td>
						<td>
  							<input class="form-check-input" type="radio" name="prdSt" id="exampleRadios1" value="단종"
  							<c:if test="${pvo.prdSt eq '단종' }"> checked="checked" </c:if>>
						  	<label class="form-check-label" for="exampleRadios1">단종</label>
						</td>
					</tr>
				</table>
				<div class="prdRegBtn">
					<button type="button" class="btn btn-primary" onclick="prdUpdate(this.form);">수정</button>
					<button type="button" class="btn btn-secondary" onclick="prdDelte(this.form);">삭제</button>
					<button type="button" class="btn btn-primary" onclick="backPage();">취소</button>
				</div>
			</form>		
		</div>
	</div>
</body>
<script>
    let deptNo = <%= session.getAttribute("deptNo") %>;
</script>
<script type="text/javascript" src="/resources/js/company/productPage/prdUpdate.js"></script>

</html>

