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
	<section class="container">
		<div class="row">
			<section class="col p-5">
				<div class="">
					<div class="card">
						<h5 class="card-header fw-bolder">문의하기</h5>
						<div class="card-body px-5">
							<p class="card-text text-start">문의사항이 있으시면</p>
							<p class="card-text text-start">아래 문의 남기기 버튼을 이용해주세요.</p>
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

			<section class="col p-5">
				<div class="overflow-auto" style="height: 650px;">
					<div class="accordion accordion-flush p-2" id="inquiryBoard">

						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#${1}">
									<span class="fst-italic">2024-01-20</span>&nbsp; &nbsp; &nbsp;
									<span class="fw-bolder text-break">23년 미납금액이 있다고
										연락받았습니다.</span>
								</button>
							</h2>
							<div id="${1}" class="accordion-collapse collapse"
								data-bs-parent="#inquiryBoard">
								<div class="accordion-body">
									<p>[문의]</p>
									<span class="text-break">${inquiryBody} 작년 미납한 금액이 있다고
										연락 받았습니다. 모두 결제 한 것으로 알고 있는데 확인 부탁드려요</span>
								</div>
							</div>
							<div id="${1}" class="accordion-collapse collapse"
								data-bs-parent="#inquiryBoard">
								<div class="accordion-body">
									<p>[답변]</p>
									<span class="text-break">${inquiryBody} 23년 10월 12일에
										'신정우'임직원이 선택한 선물에 대해서 결제가 되지 않았습니다. 거래처원장 담당자님 메일로 전달드리도록
										하겠습니다. 감사합니다.</span>
								</div>
							</div>
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
			<form action="#">
				<div class="m-4">
					<label for="inquiryTitle" class="form-label fw-bold">문의제목</label> <input
						type="text" class="form-control border border-dark-subtle"
						id="inquiryTitle" placeholder="제목을 입력해주세요.">
				</div>
				<div class="m-4">
					<label for="inquiryBody" class="form-label fw-bold">문의내용</label>
					<textarea class="form-control border border-dark-subtle"
						id="customMessege" placeholder="내용을 입력해주세요." rows="15"></textarea>
				</div>
				<div class="text-end m-4">
					<button type="button" class="btn btn-primary" style="width: 150px;">문의
						등록하기</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>