<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="/resources/images/favicon_rainbow.jpg" type="image/x-icon">
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/userAdminPage/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <!-- IONICONS -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <title>Rainbow BirthDay</title>
</head>

<body>
    <div class="d-flex flex-row">
        <aside class="d-flex flex-column">
            <div class="sidebar" id="sidebar">
                <nav class="side">
                    <div class="sidebar_container">
                        <div class="sidebar_brand">
                            <a href="#" id="dashboard" class="sidebar_logo">
                                <span>관리자페이지</span></a>
                        </div>
                        <div class="sidebar_list">
                            <a href="#" id="dashboard" class="sidebar_link"> <ion-icon name="pie-chart"
                                    class="nav__icon"></ion-icon> <span class="sidebarname">대시보드</span></a> <a
                                href="#" id="manage_member" class="sidebar_link"> <ion-icon name="people"
                                    class="nav__icon"></ion-icon> <span class="sidebarname">직원관리</span></a> <a
                                href="#" id="usageHistory_list" class="sidebar_link"> <ion-icon name="receipt"
                                    class="nav__icon"></ion-icon> <span class="sidebarname">이용현황</span></a> <a
                                href="#" id="inquiryBoard" class="sidebar_link"> <ion-icon name="chatbubbles"
                                    class="nav__icon"></ion-icon> <span class="sidebarname">고객지원</span></a>
                        </div>
                        <a href="#" id="logout" class="sidebar_link"> <ion-icon name="log-out"
                                class="nav__icon"></ion-icon> <span class="sidebarname">로그아웃</span></a>
                        <hr>
                        <div class="advertisement">
                            <a href="https://jejubeer.co.kr/shopxx/?idx=23"> 
                            <img src="/resources/images/jejunubo.jpg" width="160" alt="banner1">
                            </a>
                        </div>
                        <hr>
                        <div class="advertisement">
                            <a href="/userAdminPage/advertisement"> <img src="/resources/images/852x622.png"
                                    width="160" alt="banner2"></a>
                        </div>
                    </div>
                </nav>
            </div>
        </aside>


        <main>
            <div class="mainContainer d-flex flex-column">
                <header class="p-2 text-end">
                    <!-- 회사 정보 및 사용자 정보 -->
                    <span class="px-2" id="companyInfo"></span> <a href="/userAdminPage/userEdit/${sessionScope.spotNo}" id="userEdit">
                       <img width="48" height="48" src="https://img.icons8.com/color/48/conference-call--v1.png" alt="conference-call--v1"/> <span id="userName">' ${sessionScope.userName} ' </span>님
                        반갑습니다.
                    </a>

                </header>


                <nav class="p-2">
                    <div class="container">
                        <!-- 네비게이션 메뉴 -->
                        <div class="d-flex justify-content-center border-bottom mt-2">
                            <ul class="nav nav-pills">
                                <li class="nav-item rounded-2 px-1"><a href="#" id="dashboard"
                                        class="nav-link">대시보드</a></li>
                                <li class="nav-item rounded-2 px-1"><a href="#" id="manage_member"
                                        class="nav-link">직원관리</a></li>
                                <li class="nav-item rounded-2 px-1"><a href="#" id="manage_gift"
                                        class="nav-link">선물관리</a></li>
                                <li class="nav-item rounded-2 px-1"><a href="#" id="manage_card"
                                        class="nav-link">카드관리</a></li>
                                <li class="nav-item rounded-2 px-5"><a href="#" id="manage_recipients"
                                        class="nav-link">이번달 대상자 현황</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>


            <script src="/resources/js/userAdminPage/sidebar.js"></script>
</body>

</html>
