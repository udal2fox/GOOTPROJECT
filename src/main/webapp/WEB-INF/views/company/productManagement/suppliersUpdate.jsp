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
<body style="margin: 0 auto;">
	<jsp:include page="../../navBar.jsp"/>
	<div class="container-fluid" align="center">
		<h2 align="left" class = "h2st">공급처 편집</h2>
		<div>
			<form method="post" enctype="multipart/form-data">
				<table class="prdinputTable">
					<tr>
						<td>입점업체코드</td><td colspan="3"><input type="text" class="form-control" readonly="readonly" value="${GSV.supsNo}" name="supsNo"></td>
					    <td></td>
					    <td>담당자 이름</td><td colspan="3"><input type="text" class="form-control" name="supsName" value="${GSV.supsName }"></td>
					</tr>
					<tr>
						<td>공급처명</td><td colspan="3"><input type="text" class="form-control" name="supsCo" value="${GSV.supsCo }"></td>
					    <td></td>
					    <td>담당자 연락처</td><td colspan="3"><input type="text" class="form-control" name="supsPhone" value="${GSV.supsPhone }"></td>
					</tr>
					<tr>
						<td>주소</td><td colspan="3"><input type="text" class="form-control" name="supsAddr" value="${GSV.supsAddr }"></td>
					    <td></td>
					    <td>담당자메일주소</td><td colspan="3"><input type="text" class="form-control" name="supsEmail" value="${GSV.supsEmail }"></td>
					</tr>
					<tr>
				    <td>공급처구분</td>
				    <td>
				        <c:choose> 
				            <c:when test="${GSV.supsBnt eq '법인'}">
				                <input class="form-check-input" type="radio" name="supsBnt" id="exampleRadios1_corp" value="법인" checked>
				                <label class="form-check-label" for="exampleRadios1_corp">법인</label>
				            </c:when>
				            <c:otherwise>
				                <input class="form-check-input" type="radio" name="supsBnt" id="exampleRadios1_corp" value="법인">
				                <label class="form-check-label" for="exampleRadios1_corp">법인</label>
				            </c:otherwise>
				        </c:choose>
				    </td> 	
				    <td>
				        <c:choose> 
				            <c:when test="${GSV.supsBnt eq '개인'}">
				                <input class="form-check-input" type="radio" name="supsBnt" id="exampleRadios1_indiv" value="개인" checked>
				                <label class="form-check-label" for="exampleRadios1_indiv">개인</label>
				            </c:when>	
				            <c:otherwise>
				                <input class="form-check-input" type="radio" name="supsBnt" id="exampleRadios1_indiv" value="개인">
				                <label class="form-check-label" for="exampleRadios1_indiv">개인</label>
				            </c:otherwise>
				        </c:choose>
				    </td> 	
				    <td></td>
				    <td></td>
				    <td>거래 상태</td> 
				    <td>
				        <c:choose> 
				            <c:when test="${GSV.supsSt eq '거래중'}">
				                <input class="form-check-input" type="radio" name="supsSt" id="exampleRadios2_deal" value="거래중" checked>
				                <label class="form-check-label" for="exampleRadios2_deal">거래중</label>
				            </c:when>
				            <c:otherwise>
				                <input class="form-check-input" type="radio" name="supsSt" id="exampleRadios2_deal" value="거래중">
				                <label class="form-check-label" for="exampleRadios2_deal">거래중</label>
				            </c:otherwise>
				        </c:choose>
				    </td> 	
				    <td>
				        <c:choose> 
				            <c:when test="${GSV.supsSt eq '거래중단'}">
				                <input class="form-check-input" type="radio" name="supsSt" id="exampleRadios2_stop" value="거래중단" checked>
				                <label class="form-check-label" for="exampleRadios2_stop">거래중단</label>
				            </c:when>
				            <c:otherwise>
				                <input class="form-check-input" type="radio" name="supsSt" id="exampleRadios2_stop" value="거래중단">
				                <label class="form-check-label" for="exampleRadios2_stop">거래중단</label>
				            </c:otherwise>
				        </c:choose>
				    </td>	
				</tr>
									<tr>
						<td>사업자번호</td><td colspan="3"><input type="text" class="form-control" name="supsBizRegNum" value="${GSV.supsBizRegNum }"></td>
					    <td></td>
					    <td>담당자이름2</td><td colspan="3"><input type="text" class="form-control" name="supsSubName" value="${GSV.supsSubName }"></td>
					</tr>
					<tr>
						<td>사업자등록증</td><td colspan="3">
						<input type="file" class="form-control" id="inputGroupFile02" name="file">
					    <input type="hidden" name="existingImage" value="${GSV.supsBizLic}">
						</td>
					    <td></td>
					    <td>담당자 연락처2</td><td colspan="3"><input type="text" class="form-control"name="supsSubPhone" value="${GSV.supsSubPhone }"></td>
					</tr>
					<tr>
						<td>사업자 메일주소</td><td colspan="3"><input type="text" class="form-control" name="supsCoEmail" value="${GSV.supsCoEmail }"></td>
					    <td></td>
					    <td>담당자 메일주소2</td><td colspan="3"><input type="text" class="form-control" name="supsSubEmail" value="${GSV.supsSubEmail }"></td>
					</tr>
					<tr>
						<td>사업자 연락처</td><td colspan="3"><input type="text" class="form-control" name="supsCt" value="${GSV.supsCt}"></td>
					</tr>
				</table>
				<!--테이블 크기에 잘마추고 패딩줘  -->
					<div class="prdRegBtn">
						<button type="button" class="btn btn-primary" onclick="supsUpdate(this.form);">수정</button>
						<button type="button" class="btn btn-secondary" onclick="supsDel(this.form);">삭제</button>
						<button type="button" class="btn btn-primary" onclick="backPage();">취소</button>
					</div>
			</form>	
		</div>
	</div>
</body>
<script>
    let deptNo = <%= session.getAttribute("deptNo") %>;
</script>
<script type="text/javascript" src="/resources/js/company/productPage/supsUpdate.js"></script> 
</html>
