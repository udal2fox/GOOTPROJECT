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

	<section class="p-2 mt-3">
		<div class="container">
			<div class="px-3">
				<div class="title">
					<span class="badge badge rounded-pill bg-danger">이벤트 정보</span>
				</div>

				<div class="table_inform">
					<table class="table" id="reg_info_table">
						<tbody>
							<tr>
								<th class="align-middle text-center">서비스 시작일자</th>
								<td class="align-middle text-center">${test}</td>
								<th class="align-middle text-center">전월 이용금액</th>
								<td class="align-middle text-center">${price}<span>원</span></td>
								<td class="text-center"><button type="button"
										class="btn btn-outline-primary">거래명세서 내려받기</button></td>
							</tr>
							<tr>
								<th class="align-middle text-center">1인당 예산</th>
								<td class="align-middle text-center">${sVO.sBdgt}<span>원</span></td>
								<th class="align-middle text-center">당월 이용금액</th>
								<td class="align-middle text-center">${price}<span>원</span></td>
								<td class="text-center"><button type="button"
										class="btn btn-outline-primary">거래명세서 내려받기</button></td>
							</tr>
							<tr>
								<th class="align-middle text-center">지점 임직원 수</th>
								<td class="align-middle text-center">${sVO.sEmpNum} <span>명</span></td>
								<th class="align-middle text-center">전년 이용금액</th>
								<td class="align-middle text-center">${price}<span>원</span></td>
								<td class="text-center text-center"><button type="button"
										class="btn btn-outline-primary">거래명세서 내려받기</button></td>
							</tr>
							<tr>
								<th class="align-middle text-center">임직원 업데이트 일자</th>
								<td class="align-middle text-center">${sVO.updateDate}</td>
								<th class="align-middle text-center">금년 이용금액</th>
								<td class="align-middle text-center">${price}<span>원</span></td>
								<td class="text-center"><button type="button"
										class="btn btn-outline-primary">거래명세서 내려받기</button></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</section>

	<section class="p-2 mt-3">
		<div class="container">
			<div class="px-3">
				<div class="title">
					<span class="badge rounded-pill bg-danger">이용현황</span>
				</div>
			</div>
		</div>

	</section>

	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>

</body>
<script src="/resources/js/userAdminPage/dashboard.js"></script>
</html>