<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- page style -->
<style>
.themePreview {
	background-image: url(/image/card_balloon.png);
	width: 90%;
	height: 90%;
}

.messegePreview {
	width: 100%;
	height: max-content;
}
</style>
</head>
<body>
	<!-- SIDEBAR 페이지 공통내용 -->

	<jsp:include page="sidebar.jsp"></jsp:include>


	<!-- 페이지별 개별 내용 소스코드-->
	<div class="d-flex flex-row w-75" style="margin: auto;">

		<!-- 화면 좌측 콘텐츠 -->
		<div class="leftContent w-50">
			<div class="d-flex flex-column">

				<!-- 카드 배경선택 -->
				<section id="card" class="p-2 mt-3">
					<div class="card_template">
						<div class="px-3">
							<div class="title">
								<h5>
									<span class="badge badge rounded-pill bg-danger">카드 템플릿</span>
								</h5>
							</div>
							<div class="cardGroup ">
								<div class="row row-cols-4 g-2 m-4">
									<div class="col ">
										<a href="" class="text-decoration-none">
											<div class="card h-100">
												<img src="/resources/images/card_balloon.png"
													class="card-img-top" alt="...">
												<div class="card-body">
													<span style="font-size: 0.8rem; font-weight: bold;">풍선
														테마</span>
												</div>
											</div>
										</a>
									</div>
									<div class="col">
										<a href="" class="text-decoration-none">
											<div class="card h-100">
												<img src="/resources/images/card_black.png"
													class="card-img-top" alt="...">
												<div class="card-body">
													<span style="font-size: 0.8rem; font-weight: bold;">블랙
														테마</span>
												</div>
											</div>
										</a>
									</div>
									<div class="col">
										<a href="" class="text-decoration-none">
											<div class="card h-100">
												<img src="/resources/images/card_blue.png"
													class="card-img-top" alt="...">
												<div class="card-body">
													<span style="font-size: 0.8rem; font-weight: bold;">블루
														테마</span>
												</div>
											</div>
										</a>
									</div>
									<div class="col">
										<a href="" class="text-decoration-none">
											<div class="card h-100">
												<img src="/resources/images/card_pink.png"
													class="card-img-top" alt="...">
												<div class="card-body">
													<span style="font-size: 0.8rem; font-weight: bold;">핑크
														테마</span>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>

				<!-- 카드 커스텀 메세지 편집 -->
				<section id="messege" class="p-2 mt-3">
					<div class="messege_template">
						<div class="px-3">
							<div class="title mb-4">
								<h5>
									<span class="badge rounded-pill bg-danger">메세지 템플릿</span>
								</h5>
							</div>
							<form action="">
								<div class="m-4">
									<label for="sendName" class="form-label fw-bold">발신자명</label> <input
										type="text" class="form-control border border-dark-subtle"
										id="sendName" placeholder="기업명 또는 대표자명">
								</div>
								<div class="btn-group m-4" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="btnradio"
										id="basic" autocomplete="off" checked> <label
										class="btn btn-outline-danger" for="basic"
										style="width: 100px;">기본</label> <input type="radio"
										class="btn-check" name="btnradio" id="custom"
										autocomplete="off"> <label
										class="btn btn-outline-danger" for="custom"
										style="width: 100px;">맞춤</label>
								</div>
								<div class="m-3">
									<label for="customMessege" class="form-label fw-bold">메세지
										편집</label>
									<textarea class="form-control border border-dark-subtle"
										id="customMessege" rows="3"></textarea>
								</div>
							</form>
						</div>
					</div>
				</section>

			</div>
		</div>

		<!-- 화면 우측 콘텐츠 -->
		<div class="rightContent w-50">
			<div class="d-flex flex-column">
				<section class="col p-2 mt-3 w-30" style="margin: auto;">
					<div class="container">
						<div class="title mb-4">
							<h5>
								<span class="badge rounded-pill bg-danger">미리보기</span>
							</h5>
						</div>
						<div style="position: relative;">
							<img
								src="/resources/images/571931a4-3fe7-4a0c-b7ef-557371934c9f-removebg-preview.png"
								alt="phone_layout" style="position: relative; z-index: 100;">
							<div id="themePreview" class="rounded-5"
								style="background-image: url(/resources/images/card_balloon\ -\ 복사본.png); background-size: cover; width: 260px; height: 530px; position: absolute; top: 41px; left: 35px;">
							</div>
							<div id="messegePreview" class="text-wrap"
								style="width: 200px; height: 250px; position: absolute; top: 200px; left: 70px;">
								<span class="text-break" style="color: white;"> 안녕하세요
									{name} {rank}님! {발신자명} 에서 {name} {rank} 님의 행복한 날을 위해 선물을 준비했어요.
									언제나 행복 가득한 날이 되시길 바랄게요.<br> <br> ▶ 선물 선택하러 가기
								</span>

							</div>
						</div>
						<div>
							<button type="button" class="btn btn-danger w-100">저장</button>
						</div>
					</div>
				</section>
			</div>
		</div>

	</div>

	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>

</body>


</html>