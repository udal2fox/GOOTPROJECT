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
		<section class="container text-center">
			<div class="row">
				
				<!-- 화면 좌측 콘텐츠 -->
				<article class="col">
					<div class="row">
						<div class="col d-flex align-items-center justify-content-center">
							<span class="fw-bold fs-5">현재 선물 리스트</span>
						</div>
						<div class="col">
							<button type="button" class="btn btn-outline-primary w-100">엑셀로
								다운</button>
						</div>
						<div class="col">
							<button type="button" class="btn btn-outline-primary w-100">편집</button>
						</div>
					</div>
					<div class="overflow-auto m-3" style="height: 600px;">
						<ul class="text-start" style="list-style: none;">
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>

							<!--임시 데이터 (삭제예정)-->

							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
							<li class="my-2 bg-secondary-subtle p-2 rounded-2"><img
								src="" alt="productimg" width="auto" height="40px">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
						</ul>
					</div>
				</article>

				<!-- 화면 우측 콘텐츠 -->
				<!-- 기본지정선물 -->
				<article class="col">
					<div class="row">
						<div
							class="col col-sm-8 d-flex align-items-center justify-content-center">
							<span class="fw-bold fs-5">기본 지정 선물</span>
						</div>
						<div class="col col-sm-4">
							<button type="button" class="btn btn-outline-primary w-100">편집</button>
						</div>
					</div>
					<div class="overflow-auto m-3">
						<ul class="text-start" style="list-style: none;">
							<li class="my-2 bg-secondary-subtle rounded-2"><img src=""
								alt="productimg" width="auto" height="40px" class="p-2">&nbsp&nbsp&nbsp
								<span>${productName}</span></li>
						</ul>
					</div>

					<!-- 가격노출여부 -->
					<div class="row">
						<div
							class="col col-sm-8 d-flex align-items-center justify-content-center">
							<span class="fw-bold fs-5">가격 노출 여부</span>
						</div>
						<div class="col col-sm-4"></div>
					</div>

					<div class="btn-group my-2 p-2 ps-4" role="group"
						aria-label="Basic radio toggle button group" style="width: 560px;">
						<input type="radio" class="btn-check" name="btnradio"
							id="btnradio1" autocomplete="off" checked> <label
							class="btn btn-outline-danger" for="btnradio1">선물 가격 공개</label> <input
							type="radio" class="btn-check" name="btnradio" id="btnradio2"
							autocomplete="off"> <label class="btn btn-outline-danger"
							for="btnradio2">선물 가격 비공개</label>
					</div>

					<div style="display: block; height: 370px;"></div>

					<!-- 저장버튼 -->
					<div>
						<button type="button" class="btn btn-primary my-2 p-2 ps-4"
							style="width: 524px; margin-left: 12px;">변경내용 저장하기</button>
					</div>
				</article>
			
			</div>
		</section>
	</div>



	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>


</body>


</html>