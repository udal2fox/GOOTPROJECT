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

	<!-- 직원 리스트 페이지 -->
	<section class="p-2 mt-5">
		<div class="container">

			<div class="row px-5">
				<div id="search_group" class="col">
					<form class="d-flex" role="search">
						<input class="form-control" type="search" placeholder="직원검색"
							aria-label="Search">
						<button class="btn btn-outline-primary" type="submit">Search</button>
					</form>

				</div>
				<div id="button_group" class="col text-end">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" data-bs-target="#add_memeber"
						style="width: 120px;">추가</button>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" data-bs-target="#edit_member"
						style="width: 120px;">편집</button>
					<button type="button" class="btn btn-outline-danger"
						style="width: 120px;">선택삭제</button>
					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" data-bs-target="#all_member"
						style="width: 120px;">일괄 업로드</button>
				</div>
			</div>

		</div>
	</section>

	<section class="p-2">
		<div class="container">
			<div class="overflow-auto" style="height: 600px;">
				<div class="px-3">
					<table class="table table-sm" id="member_table">
						<thead class="table-danger">
							<tr class="text-center">
								<th><input class="form-check-input" type="checkbox"></th>
								<th>No.</th>
								<th>이름</th>
								<th>직급</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>생년월일</th>
								<th>1인당 예산</th>
								<th>선물 수령여부</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<td><input class="form-check-input" type="checkbox"></td>
								<td>${member_seq}</td>
								<td>${member_name}</td>
								<td>${member_grade}</td>
								<td>${member_phone}</td>
								<td>${member_email}</td>
								<td>${member_birth}</td>
								<td>${member_budget}</td>
								<td>${member_gift}</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- 직원 리스트 페이지 끝 -->


	<!-- 직원 추가 모달-->
	<div class="modal fade modal-xl" id="add_memeber"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">직원 추가하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div style="width: 1000px; margin: auto;">
						<table class="table table-sm table-bordered" id="member_table"
							style="width: 1000px;">
							<thead class="table-danger">
								<tr class="text-center">
									<th>이름</th>
									<th>직급</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>생년월일</th>
								</tr>
							</thead>
							<tbody>
								<tr class="text-center">
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="number" placeholder="숫자(-제외)"></td>
									<td><input type="mail"></td>
									<td><input type="date"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">변경사항 저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 직원 추가 모달 끝 -->

	<!-- 직원 수정 모달-->
	<div class="modal fade" id="edit_member" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable position-relative">
			<div class="modal-content"
				style="width: 1400px; position: absolute; top: 150px; left: -450px;">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">직원 수정하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="overflow-auto" style="height: 300px;">
						<table class="table table-sm table-bordered" id="member_table">
							<thead class="table-danger">
								<tr class="text-center">
									<th>No.</th>
									<th>이름</th>
									<th>직급</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>생년월일</th>
									<th>1인당 예산</th>
									<th>선물 수령여부</th>
								</tr>
							</thead>
							<tbody>
								<tr class="text-center align-middle">
									<td>${seq}</td>
									<td class=""><input type="text" value="${name}"></td>
									<td><input type="text" value="${name}"></td>
									<td><input type="number" value="${phone}"></td>
									<td><input type="mail" value="${value}"></td>
									<td><input type="date" value="${date}"></td>
									<td><input type="number" value="${budget}" readonly></td>
									<td><select class="form-select" aria-label="status">
											<option selected>여부</option>
											<option value="1">O</option>
											<option value="2">X</option>
									</select></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">변경사항 저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 직원 수정 모달 끝-->

	<!-- 일괄업로드 모달-->
	<div class="modal fade" id="all_member" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">일괄업로드</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">변경사항 저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 일괄업로드 모달 끝 -->


	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>


</body>


</html>