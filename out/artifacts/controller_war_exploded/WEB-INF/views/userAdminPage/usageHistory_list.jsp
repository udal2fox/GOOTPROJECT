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

	<div class="container mt-5">

		<section class="row">
			<section class="col ps-5">

				<div class="my-3">
					<h5 class="fw-bold">이용현황</h5>
				</div>
				<div class="my-3">
					<span>과거 상세 이용현황을 보실 수 있습니다.</span>
				</div>
				<div class="my-3">
					<a href="" class="fw-semibold">레인보우컴퍼니 사업자등록증 다운받기</a>
				</div>
				<div class="my-3">
					<a href="" class="fw-semibold">가상계좌 증명서 다운받기</a>
				</div>

			</section>

			<section class="col pe-5">

				<article>
					<div class="text-end" style="margin-right: 10%;">
						<button class="btn btn-primary">전체 거래명세서 내려받기</button>
					</div>
				</article>

				<article>
					<div class="my-3">
						<div class="overflow-auto" style="height: 600px;">
							<div style="width: 90%;">

								<div class="my-2">
									<a href="" class="text-decoration-none" style="color: black;">
										<div class="row bg-danger-subtle p-3 rounded-2">
											<div class="col" style="width: 100px;">
												<ion-icon name="receipt" class="fs-3 p-2"></ion-icon>
											</div>
											<div class="col">
												<div>
													<span class="py-1">${date}</span><span>거래명세서</span>
												</div>
												<div>
													<span class="py-1">${count}</span><span>건의 주문</span>
												</div>
											</div>
											<div class="col">
												<span class="py-1">${totalprice}</span><span
													class="fs-5 p-1">원</span>
											</div>
										</div>
									</a>
								</div>

							</div>
						</div>
					</div>
				</article>

			</section>

		</section>

	</div>

	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>
</body>
</html>