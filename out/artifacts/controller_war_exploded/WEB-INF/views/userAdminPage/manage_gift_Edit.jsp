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

	<!-- 여기부터 페이지별 개별 내용 소스코드-->
	<div class="container mt-5 px-5">

		<section>

			<article class="container text-center">

				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">전체</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">1만원</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">2만원</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">3만원</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">5만원</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">7만원</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">10만원</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">15만원</button>
					</div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary w-100">20만원</button>
					</div>
					<div class="col-2">
						<input type="text" class="form-control w-100" name="search">
					</div>
					<div class="col">
						<button type="button" class="btn btn-primary w-100">검색</button>
					</div>
				</div>
			</article>
			<hr>

			<article>
				<div class="mt-3">
					<div class="overflow-auto mt-3" style="height: 530px;">
						<div class="row row-cols-1 row-cols-md-6 g-4 p-2 mt-3"
							style="width: 1200px;">
							<div class="col p-1">
								<div class="form-check">
									<!--기본선물 편집으로 들어올 경우 type radio로 변경-->
									<input class="form-check-input" type="checkbox" value=""
										id="${productNo}"> <label class="form-check-label"
										for="${productNo}">
										<div class="card" style="width: 150px;">
											<img src="/image/card_blue.png"
												class="card-img-top object-fit-fill border rounded"
												alt="product" width="150px" height="150px">
											<div class="card-body">
												<span class="card-text" style="font-size: 0.7rem;">신세계
													상품권 10만원</span>
											</div>
										</div>
									</label>
								</div>
							</div>
							<!-- 임시 데이터 (삭제예정)-->

						</div>
					</div>
				</div>
			</article>

			<article class="mt-5">
				<div class="d-flex">

					<div class="p-2 flex-grow-1">
						<div class="row g-3 align-items-center">
							<div class="col-auto">
								<label for="selectGift" class="col-form-label fw-bold">선택한
									선물 수 : &nbsp</label>
							</div>
							<div class="col-auto">
								<input type="text" id="selectGift" class="form-control" readonly>
							</div>
						</div>
					</div>

					<div class="p-2">
						<button type="button" class="btn btn-secondary"
							style="width: 200px">초기화</button>
					</div>

					<div class="p-2">
						<button type="button" class="btn btn-primary" style="width: 200px">저장</button>
					</div>

				</div>
			</article>

		</section>
	</div>



	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>


</body>


</html>