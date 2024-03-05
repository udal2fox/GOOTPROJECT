<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- SIDEBAR 페이지 공통내용 -->

	<jsp:include page="sidebar.jsp"></jsp:include>


	<!-- 페이지별 개별 내용 소스코드-->

	<div class="container mt-5 px-5">

		<section>
			<article>
				<div class="row">
					<div class="col my-3 px-2 d-flex align-items-center">
						<span class="fw-bold">{OOOO년 OO월} 거래명세서</span>
					</div>
					<div
						class="col my-3 px-2 d-flex flex-row-reverse align-items-center">
						<button type="button" class="btn btn-primary">엑셀로 내려받기</button>
					</div>
				</div>

				<div>
					<table class="table table-secondary text-center fw-semibold">
						<tr>
							<th>
								<h5>상품권</h5>
							</th>
							<td><span>{totalPrice}</span></td>
						</tr>
						<tr>
							<th>
								<h5>현물상품</h5>
							</th>
							<td><span>{totalPrice}</span></td>
						</tr>
					</table>
				</div>

				<div class="mt-3 mb-1 px-2 fw-semibold">
					<span>상품권</span>
				</div>

				<div class="overflow-auto">
					<table class="table table-secondary text-center">
						<tr>
							<td>{date}</td>
							<td>{name}</td>
							<td><img src="" alt="product"></td>
							<td>{product}</td>
							<td>{count}</td>
							<td>{price}</td>
						</tr>
					</table>
				</div>

				<div class="mt-3 mb-1 px-2 fw-semibold">
					<span>현물상품</span>
				</div>

				<div class="overflow-auto">
					<table class="table table-secondary text-center">
						<tr>
							<td>{date}</td>
							<td>{name}</td>
							<td><img src="" alt="product"></td>
							<td>{product}</td>
							<td>{count}</td>
							<td>{price}</td>
						</tr>
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