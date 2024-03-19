<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/favicon_rainbow.jpg" type="image/x-icon">
<title>Rainbow BirthDay</title>
</head>
<body>

	<!-- SIDEBAR 페이지 공통내용 -->

	<jsp:include page="sidebar.jsp"></jsp:include>
	<section class="container">
		<div class="row">
			<section class="col-4 p-5">
				<div class="">
					<div class="card">
						<h5 class="card-header fw-bolder">문의하기</h5>
						<div class="card-body px-5">
							<p class="card-text text-start">문의사항이 있으시면</p>
							<p class="card-text text-start">아래 문의 남기기 버튼을</p>
							<p class="card-text text-start">이용해주세요.</p>
							<br>
							<p class="card-text text-start">빠르게 답변드리도록 하겠습니다.</p>
							<br>
							<p class="card-text text-start">유선 문의를 희망하시면</p>
							<p class="card-text text-start">아래 콜센터로 연락주세요.</p>
							<br>
							<p class="card-text text-start">TEL: 02-1588-3082</p>
							<p class="card-text text-start">운영시간: 오전 09시 ~ 오후 06시</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary w-100"
								data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
								aria-controls="offcanvasRight">문의 남기기</a>
						</div>
					</div>
				</div>
			</section>

			<section class="col-8 p-5">
				<div class="overflow-auto" style="height: 650px;">
					<div class="accordion accordion-flush p-2" id="inquiryBoard">
						<div class="accordion-item" id="QnA">

						</div>


					</div>
				</div>
			</section>
		</div>
	</section>

	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>

	<!-- 오프캔버스 관련 소스 -->

	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
		aria-labelledby="offcanvasRightLabel" style="width: 1000px;">
		<div class="offcanvas-header m-4">
			<h3 class="offcanvas-title fw-bold" id="offcanvasRightLabel">문의하기</h3>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<form id="inputQnA">
				<div class="m-4">
					<label for="inquiryTitle" class="form-label fw-bold">문의제목</label> <input
						type="text" class="form-control border border-dark-subtle"
						id="inquiryTitle" name="inquiryTitle" placeholder="제목을 입력해주세요.">
				</div>
				<div class="m-4">
					<label for="inquiryBody" class="form-label fw-bold">문의내용</label>
					<textarea class="form-control border border-dark-subtle" id="customMessege" name="customMessege" placeholder="내용을 입력해주세요." rows="15"></textarea>
				</div>
				<div class="text-end m-4">
					<button type="button" class="btn btn-primary" style="width: 150px;" id="inputBtn">문의 남기기</button>
				</div>
			</form>
		</div>
	</div>

</body>
<script src="/resources/js/userAdminPage/inquiryBoard.js"></script>
</html>