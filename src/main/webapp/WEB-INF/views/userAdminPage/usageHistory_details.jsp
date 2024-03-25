<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/favicon_rainbow.jpg"
	type="image/x-icon">
<title>Rainbow BirthDay</title>
<style type="text/css">
table {
	width: 100%;
}

#prdName {
	max-width: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>

	<!-- SIDEBAR 페이지 공통내용 -->
	<jsp:include page="sidebar.jsp"></jsp:include>

	<!-- 페이지별 개별 내용 소스코드 -->
	<div class="container mt-5 px-5">
		<section>
			<article>
				<!-- 상단 타이틀 및 엑셀 다운로드 버튼 -->
				<div class="row">
					<div class="col my-3 px-2 d-flex align-items-center">
						<!-- 페이지 타이틀 -->
						<c:set var="recDate" value="${detailUsageData[0]['recDate']}" />
						<c:set var="yearMonth" value="${fn:substring(recDate, 0, 7)}" />
						<h5> <span class="badge text-bg-danger fw-bold">${yearMonth}</span></h5>
					</div>
					<div
						class="col my-3 px-2 d-flex flex-row-reverse align-items-center">
						<!-- 엑셀 다운로드 버튼 -->
						<button type="button" class="btn btn-primary">엑셀로 내려받기</button>
					</div>
				</div>

				<!-- 상품권 및 현물상품 정보 테이블 -->
				<div>
					<table class="table table-info table-bordered text-center mb-5 align-middle fw-bold">
						<tr>
							<th>
								<h5>상 품 권</h5>
							</th>
							<%-- totalPrice 변수 초기화 --%>
							<c:set var="totalPrice" value="0" />
							<%-- 상품권 합계 계산 --%>
							<c:forEach var="item" items="${detailUsageData}">
								<c:if test="${item['prdMajorCtg'] == '상품권'}">
									<c:set var="totalPrice"
										value="${totalPrice + item['totalAmount']}" />
								</c:if>
							</c:forEach>
							<%-- 포맷팅된 totalPrice 표시 --%>
							<td><span><fmt:formatNumber value="${totalPrice}"
										pattern="###,###원" /></span></td>
						</tr>
						<tr>
							<th>
								<h5>현물 상품</h5>
							</th>
							<%-- totalPrice 변수 초기화 --%>
							<c:set var="totalPrice" value="0" />
							<%-- 상품권 합계 계산 --%>
							<c:forEach var="item" items="${detailUsageData}">
								<c:if test="${item['prdMajorCtg'] == '현물'}">
									<c:set var="totalPrice"
										value="${totalPrice + item['totalAmount']}" />
								</c:if>
							</c:forEach>
							<%-- 포맷팅된 totalPrice 표시 --%>
							<td><span><fmt:formatNumber value="${totalPrice}"
										pattern="###,###원" /></span></td>
						</tr>
					</table>
				</div>

				<!-- 상품권 목록 -->
				<div class="mt-3 mb-1 px-2 fw-semibold">
					<span class="badge text-bg-danger">상 품 권</span>
				</div>

				<div class="overflow-auto">
					<table class="table table-bordered text-center align-middle">
						<thead>
							<tr class="table-primary">
								<th style="width: 15%">날짜</th>
								<th style="width: 15%">이름</th>
								<th style="width: 15%">상품 이미지</th>
								<th style="width: 40%">상품 이름</th>
								<th style="width: 5%">수량</th>
								<th style="width: 10%">가격</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="hasItem" value="false" />
							<c:forEach var="item" items="${detailUsageData}">
								<c:if test="${item['prdMajorCtg'] == '상품권'}">
									<tr>
										<td>${item['recDate']}</td>
										<td>${item['cEmpName']}</td>
										<td><img src="${item['prdImg']}" alt="product"
											style="width: 50px; height: 50px;"></td>
										<td id="prdName">${item['prdName']}</td>
										<td>1</td>
										<td><fmt:formatNumber value="${item['totalAmount']}"
												pattern="###,###원" /></td>
									</tr>
									<c:set var="hasItem" value="true" />
								</c:if>
							</c:forEach>
							<c:if test="${not hasItem}">
								<tr>
									<td colspan="6" style="text-align: center;">주문내역이 없습니다</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>

				<!-- 현물상품 목록 -->
				<div class="mt-3 mb-1 px-2 fw-semibold">
					<span class="badge text-bg-danger">현물 상품</span>
				</div>

				<div class="overflow-auto">
					<table class="table table-bordered text-center align-middle">
						<thead>
							<tr class="table-primary">
								<th style="width: 15%">날짜</th>
								<th style="width: 15%">이름</th>
								<th style="width: 15%">상품 이미지</th>
								<th style="width: 40%">상품 이름</th>
								<th style="width: 5%">수량</th>
								<th style="width: 10%">가격</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="hasItem" value="false" />
							<c:forEach var="item" items="${detailUsageData}">
								<c:if test="${item['prdMajorCtg'] == '현물'}">
									<tr>
										<td>${item['recDate']}</td>
										<td>${item['cEmpName']}</td>
										<td><img src="${item['prdImg']}" alt="product"
											style="width: 50px; height: 50px;"></td>
										<td id="prdName">${item['prdName']}</td>
										<td>1</td>
										<td><fmt:formatNumber value="${item['totalAmount']}"
												pattern="###,###원" /></td>
									</tr>
									<c:set var="hasItem" value="true" />
								</c:if>
							</c:forEach>
							<c:if test="${not hasItem}">
								<tr>
									<td colspan="6" style="text-align: center;">주문내역이 없습니다</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</article>
		</section>
	</div>

	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>
</body>
</html>