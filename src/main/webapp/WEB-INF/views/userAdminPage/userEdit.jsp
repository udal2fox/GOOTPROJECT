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
	<section class="container">
		<div class="row mt-5">
			<article class="col p-5">
				<div>
					<div class="card" style="width: 90%;">
						<img src="/image/CI_png_2021.png" class="card-img-top mt-4 p-4"
							alt="company CI">
						<div class="card-header mt-4 pt-3 border-top">
							<h5 class="card-title fw-bold">회사 로고 업로드</h5>
						</div>
						<div class="card-body mt-4">
							<span class="card-text">회사 또는 지점 로고를 업로드 할 수 있습니다.</span><br>
							<span class="card-text">확장자가 ai 또는 png 파일로 업로드 해주세요.</span>
							<div class="my-4">
								<label for="formFile" class="form-label">로고 올리기</label> <input
									class="form-control" type="file" id="formFile">
							</div>
						</div>
					</div>
				</div>
			</article>

			<article class="col p-5">
				<div>

					<div class="mb-4">
						<label for="userEmail" class="form-label px-2 fw-bold">이메일
							주소</label> <input type="email" class="form-control" id="userEmail"
							placeholder="${userEmail}">
					</div>
					<div class="mb-4">
						<label for="userCallNumber" class="form-label px-2 fw-bold">연락처
							(H.P)</label> <input type="email" class="form-control"
							id="userCallNumber" placeholder="${userCallNumber}">
					</div>
					<div class="mb-4">
						<label for="userPw" class="form-label px-2 fw-bold">새 비밀번호</label>
						<input type="email" class="form-control" id="userPw"
							placeholder="(8자리이상/대문자/특수문자 포함)">
					</div>
					<div class="mb-4">
						<label for="userPwCheck" class="form-label px-2 fw-bold">비밀번호
							확인</label> <input type="email" class="form-control" id="userPwCheck"
							placeholder="(8자리이상/대문자/특수문자 포함)">
					</div>
					<div class="mb-4 text-end">
						<button type="button" class="btn btn-primary"
							style="width: 200px;">변경사항 저장하기</button>
					</div>

				</div>
			</article>
		</div>
	</section>

	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>

</body>
</html>