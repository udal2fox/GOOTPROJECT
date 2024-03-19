<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <section class="container">
        <div class="row mt-5">
            <article class="col p-5">
                <div>
                    <form class="userEditForm">
                        <div class="mb-4">
                            <label for="userEmail" class="form-label px-2 fw-bold">이메일
                                주소</label> <input type="email" class="form-control" id="userEmail" name="userEmail"
                                placeholder="${result.userEmail}">
                        </div>
                        <div class="mb-4">
                            <label for="userCallNumber" class="form-label px-2 fw-bold">연락처
                                (H.P)</label> <input type="text" class="form-control" id="userContact"
                                name="userContact" placeholder="${result.userContact}">
                        </div>
                        <div class="mb-4">
                            <label for="userPw" class="form-label px-2 fw-bold">새 비밀번호</label>
                            <input type="password" class="form-control" id="userPw" name="userPw"
                                placeholder="(8자리이상/대문자/특수문자 포함)">
                        </div>
                        <div class="mb-4">
                            <label for="userPwCheck" class="form-label px-2 fw-bold">비밀번호
                                확인</label> <input type="password" class="form-control" id="userPwCheck" name="userPwCheck"
                                placeholder="(8자리이상/대문자/특수문자 포함)">
                        </div>
                        <div class="mb-4 text-end">
                            <button type="button" class="btn btn-primary" id="submitBtn" style="width: 200px;">변경사항 저장하기</button>
                        </div>
                    </form>
                </div>
            </article>
        </div>
    </section>

    <!-- SIDEBAR 닫힌태그 -->
    </main>
    </div>

</body>
<script src="/resources/js/userAdminPage/userEdit.js"></script>

</html>
