<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- prd result -->
	<!-- 상품 개별등록  -->
	<c:choose>
		<c:when test="${prdInsertresult eq  'prdInsertSuccess'}">
			<script type="text/javascript">
				alert("상품 개별등록 성공");
				location.href = '/moveProductPage';
			</script>
		</c:when>
		<c:when test="${prdInsertresult eq  'prdInsertfail'}">
			<script type="text/javascript">
				alert("상품 개별등록 실패");
				location.href = '/moveProductPage';
			</script>
		</c:when>
	</c:choose>
	<!-- 상품 수정  -->
	<c:choose>
		<c:when test="${prdUpdateResult eq  'prdUpdateSuccess'}">
			<script type="text/javascript">
				alert("상품  수정 성공");
				location.href = '/moveProductPage';
			</script>
		</c:when>
		<c:when test="${prdUpdateResult eq  'prdUpdatefail'}">
			<script type="text/javascript">
				alert("상품 수정 실패");
				location.href = '/moveProductPage';
			</script>
		</c:when>
	</c:choose>
	<!-- 상품 삭제  -->
	<c:choose>
		<c:when test="${prdDelResult eq 'prdDelSuccess'}">
			<script type="text/javascript">
				alert("상품 삭제 성공");
				location.href = '/moveProductPage';
			</script>
		</c:when>
		<c:when test="${prdDelResult eq 'prdDelfail'}">
			<script type="text/javascript">
				alert("상품 삭제 실패");
				location.href = '/moveProductPage';
			</script>
		</c:when>
	</c:choose>
	
	
	<!-- sups result  -->
	<!-- 공급처 개별등록  -->
	<c:choose>
		<c:when test="${supInsertReulst eq  'supInsertSuccess'}">
			<script type="text/javascript">
				alert("공급처 개별등록 성공");
				location.href = '/moveSuppliers';
			</script>
		</c:when>
		<c:when test="${supInsertReulst eq  'supInsertfail'}">
			<script type="text/javascript">
				alert("공급처 개별등록 실패");
				location.href = '/moveSuppliers';
			</script>
		</c:when>
	</c:choose>
	<!-- 공급처 수정  -->
	<c:choose>
		<c:when test="${subUpResult eq  'supUpSuccess'}">
			<script type="text/javascript">
				alert("공급처 수정 성공");
				location.href = '/moveSuppliers';
			</script>
		</c:when>
		<c:when test="${subUpResult eq  'supUpfail'}">
			<script type="text/javascript">
				alert("공급처 수정 실패");
				location.href = '/moveSuppliers';
			</script>
		</c:when>
	</c:choose>
	<!-- 공급처 삭제  -->
	<c:choose>
		<c:when test="${supDelResult eq  'subDelSuccess'}">
			<script type="text/javascript">
				alert("공급처 삭제 성공");
				location.href = '/moveSuppliers';
			</script>
		</c:when>
		<c:when test="${supDelResult eq  'subDelfail'}">
			<script type="text/javascript">
				alert("공급처 삭제 실패");
				location.href = '/moveSuppliers';
			</script>
		</c:when>
	</c:choose>

</body>
</html>