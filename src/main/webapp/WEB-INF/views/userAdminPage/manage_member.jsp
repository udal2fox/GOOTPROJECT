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

<!-- 페이지별 개별 내용 소스코드-->
<!-- 직원 리스트 페이지 -->
<section class="p-2 mt-5">
    <div class="container">
        <div class="row px-5">
            <!-- 직원 검색 폼 -->
            <div id="search_group" class="col">
                <form class="d-flex" role="search" onsubmit="return false;">
                    <input id="searchInput" class="form-control" type="search" placeholder="직원검색" aria-label="Search">
                    <button class="btn btn-outline-primary" type="button" id="searchBtn">Search</button>
                </form>
            </div>
            <!-- 버튼 그룹 -->
            <div id="button_group" class="col text-end">
                <!-- 직원 추가 버튼 -->
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#add_memeber" style="width: 120px;">추가</button>
                <!-- 직원 편집 버튼 -->
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#edit_member" style="width: 120px;">편집</button>
                <!-- 선택 삭제 버튼 -->
                <button type="button" class="btn btn-outline-danger" id="checkDelete" style="width: 120px;">선택삭제</button>
                <!-- 일괄 업로드 버튼 -->
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#all_member" style="width: 120px;">일괄 업로드</button>
            </div>
        </div>
    </div>
</section>

<section class="p-2">
    <div class="container">
        <div class="overflow-auto" style="height: 700px;">
            <div class="px-3">
                <!-- 직원 리스트 테이블 -->
                <table class="table table-hover table-sm" id="member_table">
                    <thead class="table-danger">
                        <tr class="text-center">
                            <th><input class="form-check-input" type="checkbox" onclick="checkAll()"></th>
                            <th>No.</th>
                            <th>이름</th>
                            <th>직급</th>
                            <th>연락처</th>
                            <th>이메일</th>
                            <th>생년월일</th>
                        </tr>
                    </thead>
                    <tbody id="empList">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<!-- 직원 리스트 페이지 끝 -->

<!-- 직원 추가 모달-->
<div class="modal fade modal-xl" id="add_memeber" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">직원 추가하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div style="width: 1000px; margin: auto;">
                    <form id="addEmp">
                        <table class="table table-sm table-bordered" id="member_table" style="width: 1000px;">
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
                                    <td><input type="text" name="cEmpName"></td>
                                    <td><input type="text" name="cEmpPosition"></td>
                                    <td><input type="number" placeholder="숫자(-제외)" name="cEmpTel"></td>
                                    <td><input type="email" name="cEmpEmail"></td>
                                    <td><input type="date" name="cEmpBirth"></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="addEmpBtn">추가하기</button>
            </div>
        </div>
    </div>
</div>
<!-- 직원 추가 모달 끝 -->

<!-- 직원 수정 모달-->
<div class="modal fade" id="edit_member" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable position-relative">
        <div class="modal-content" style="width: 1400px; position: absolute; top: 150px; left: -450px;">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">직원 수정하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                            </tr>
                        </thead>
                        <tbody id="editList">
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeUpdateModal">닫기</button>
                <button type="button" class="btn btn-primary" id="editMemberBtn">변경사항 저장</button>
            </div>
        </div>
    </div>
</div>
<!-- 직원 수정 모달 끝-->

<!-- 일괄업로드 모달-->
<div class="modal fade" id="all_member" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            	<img width="48" height="48" src="https://img.icons8.com/color/48/add-user-group-woman-man-skin-type-7.png" alt="add-user-group-woman-man-skin-type-7"/>
                <h1 class="modal-title fs-5" id="staticBackdropLabel">&nbsp;&nbsp;&nbsp;직원 일괄 업로드</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
				<div class="input-group">
  					<input type="file" class="form-control" id="inputGroupFile04" aria-describedby="allMemberInsert" aria-label="Upload">
				</div>
  					<hr>
  					<p> 아래 링크에서 양식을 다운받고</p>
  					<p> 해당 엑셀파일에 메모에 맞춰 입력해주세요.</p>
  					<a href="#" id="excelDown"> ▶ 업로드 양식 다운로드</a>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeExcelModal">닫기</button>
                <button type="button" class="btn btn-primary" id="allMemberInsert">변경사항 저장</button>
            </div>
        </div>
    </div>
</div>
<!-- 일괄업로드 모달 끝 -->

<!-- SIDEBAR 닫힌태그 -->
</main>
</div>

</body>
<script src="/resources/js/userAdminPage/manage_member.js"></script>
</html>
