<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/resources/images/favicon_rainbow.jpg" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/userAdminPage/userLogin.css">
    <title>Admin Login</title>

</head>

<body>

    <header>
        <div class="container">
            <div class="d-flex flex-wrap justify-content-center py-3 mb-4">
                <a href="#"
                    class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img class="img-fluid" src="/resources/images/rainbow_white.png" width="50" height="40" alt="brandLogo">
                    <span class="nav-logo">Rainbow Birthday</span>
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="/landingPage/main" class="nav-link">소개페이지</a></li>
                    <li class="nav-item"><a href="/landingPage/application" class="nav-link">서비스신청</a></li>
                    <li class="nav-item"><a href="/landingPage/FAQ" class="nav-link">자주하는질문</a></li>
                </ul>
            </div>
        </div>
    </header>

    <main class="row">

        <!-- Image section -->
        <section class="image-section col-8">
            <a href="#">
                <div class="card card-cover h-100 rounded-1 shadow-lg"
                    style="background-image: url('/resources/images/887_1409_2033.jpg');background-size: cover;">
                </div>
            </a>
        </section>

        <!-- Login section -->
        <section class="col-4">
            <div class="container">
                <form class="login-form">
                    <div class="fir-span"><span>관리자페이지 로그인</span></div>
                    <div class="sub-span"><span>Rainbow Birthday 관리자페이지는 서비스 계약 후 이용하실 수 있습니다.</span></div>
                    <div class="sub-span"><span>간편한 임직원 생일 복지 서비스를 이용해 보세요.</span></div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" name="uEmail" placeholder="name@example.com">
                        <label for="floatingInput">
                            <ion-icon name="mail"></ion-icon>
                            &ensp; 이메일 주소
                        </label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" name="uPw" placeholder="Password">
                        <label for="floatingPassword">
                            <ion-icon name="key"></ion-icon>
                            &ensp; 비밀번호
                        </label>
                    </div>

                    <div class="form-check text-start my-3">
                        <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                            아이디 기억하기
                        </label>
                    </div>
                    <button class="btn w-100 py-2" type="button" id="login_btn">로그인</button>
                </form>
            </div>
        </section>
    </main>

    <footer class="footer py-3 my-4 bg-body-tertiary border-top">
        <div class="container">
            <span class="text-body-secondary">&copy; Rainbow. Inc</span>
        </div>
    </footer>

    <!-- IONICONS -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <!-- script -->
    <script src="/resources/js/userAdminPage/userLogin.js"></script>
</body>

</html>