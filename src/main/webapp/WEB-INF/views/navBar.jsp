<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Document</title>
	
    <style>
        /* GOOGLE FONTS */
        @font-face {
            font-family: "S-CoreDream-3Light";
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff") format("woff");
        }

        /* VARIABLES CSS */
        :root {
            --nav--width: 60px;

            /* Colores */
            --bg-color: #090035;
            --first-color: #362E63;
            --second-color: #665A95;
            --third-color: #998BC9;
            --fourth-color: #CFBFFF;
            --white-color: #fff;

            /* Fuente y tipografia */
            --body-font: "S-CoreDream-3Light";
            --normal-font-size: 1rem;
            --small-font-size: 0.875rem;
            --font-regular: 400;
            --font-medium: 500;
            --font-bold: 700;
            --font-black: 900;

            /* z index */
            --z-fixed: 100;
        }

        /* BASE */
        *,
        ::before,
        ::after {
            font-family: var(--body-font);
        }

        .navi {
            background-color: var(--bg-color);
            width: 100wh;
            height: 60px;
            position: relative;
        }

        .nav-link {
            color: var(--white-color);
            font-weight: var(--font-bold);
        }

        .nav-link:hover {
            background-color: var(--fourth-color);
            border-radius: 0.5rem;
        }

        #profile {
            color: var(--white-color);
            font-weight: var(--font-bold);
            font-size: 0.75rem;
        }

        .subMenu {
            width: 100%;
            background: var(--bg-color);
            position: absolute;
            left: 0;
            top: 60px;
            z-index: 999;
            color: var(--white-color);
            font-size: 1rem;
            font-weight: var(--font-bold);
            cursor: pointer;
            display: none;
        }

        .show {
            display: block;
        }

        .subMenu-category {
            width: 162.08px;
        }

        .menu_category {
            float: left;
            margin: 30px 0;
            text-align: center;
        }

        .category {
            padding: 8px 0;
            list-style-type: none;
        }

        .category:hover {
            background-color: var(--fourth-color);
            border-radius: 0.5rem;
            color: var(--bg-color);
        }

        .category-link {
            text-decoration: none;
            font-size: 0.8rem;
            color: var(--white-color);
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script> <!--데이트피커  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script><!-- 날짜 계산용 모먼트 라이브러리  -->
</head>

<body>
    <nav>
        <div class="navi">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
                <div class="col text-center" style="width: 10%;">
                    <a href="/moveSalesChart" class="d-inline-flex link-body-emphasis text-decoration-none align-middle">
                        <img src="/resources/images/rainbow_white.png" height="60px" alt="">
                    </a>
                </div>

                <ul class="nav col-12 col-md-auto justify-content-center text-center" style="width: 80%;">
                    <li><a href="#" class="nav-link px-5">상품 관리</a></li>
                    <li><a href="#" class="nav-link px-5">영업 관리</a></li>
                    <li><a href="#" class="nav-link px-5">정산 관리</a></li>
                    <li><a href="#" class="nav-link px-5">매출 관리</a></li>
                    <li><a href="#" class="nav-link px-5">인사 관리</a></li>
                </ul>

                <div class="d-flex align-items-center text-center" style="width: 10%;">
                    <div class="flex-shrink-0 dropdown">
                        <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <c:choose>
                            	<c:when test="${sessionScope.deptNo eq 0}">
                            		<c:set var="dept" value="대표"/>
                            	</c:when>
                            	<c:when test="${sessionScope.deptNo eq 1}">
                            		<c:set var="dept" value="인사팀"/>
                            	</c:when>
                            	<c:when test="${sessionScope.deptNo eq 2}">
                            		<c:set var="dept" value="영업팀"/>
                            	</c:when>
                            	<c:otherwise>
                            		<c:set var="dept" value="상품팀"/>
                            	</c:otherwise>
                            </c:choose>
                            <span id="profile">${dept} / ${sessionScope.eName}&nbsp;&nbsp;&nbsp;</span>
                            <img id="profilePicture" src="${sessionScope.profilePicture }" alt="profile" width="auto" height="32"
                                class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small shadow">
                            <li><a class="dropdown-item" href="/profile_modify">프로필 수정</a></li>
                            <li><a class="dropdown-item" href="/Gologout">로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="subMenu hide py-3">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
                <ul class="nav col-12 col-md-auto justify-content-center text-center" style="width: 80%; margin: auto;">
                    <li>
                        <ul class="subMenu-category px-5">
                            <li class="category" onclick="movePage('/moveSuppliers')"><a class="category-link" href="#">공급처 관리</a></li>
                            <li class="category" onclick="movePage('/moveProductPage')"><a class="category-link" href="#">상품 관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="subMenu-category px-5">
                      		<li class="category" onclick="movePage('/salesList')"><a class="category-link" href="#">신규영업</a></li>
                            <li class="category" onclick="movePage('/companyList')"><a class="category-link" href="#">기업관리</a></li>
                            <li class="category" onclick="movePage('/spotList')"><a class="category-link" href="#">지점관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="subMenu-category px-5">
                        	<li class="category" onclick="movePage('/TradeDetailPage')"><a class="category-link" href="#">거래명세</a></li>
                            <li class="category" onclick="movePage('/unrecoveredMGT')"><a class="category-link" href="#">미수관리</a></li>
                            <li class="category" onclick="movePage('/moveIoBill')"><a class="category-link" href="#">계산서발행</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="subMenu-category px-5">
                       		<li class="category" onclick="movePage('/moveSalesStatsCom')"><a class="category-link" href="#">기업별 통계</a></li>
                            <li class="category" onclick="movePage('/moveSalesStatsPrd')"><a class="category-link" href="#">상품별 통계</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="subMenu-category px-5">
                       		<li class="category" onclick="movePage('/orgchart')"><a class="category-link" href="#">조직도</a></li>
                            <li class="category" onclick="movePage('/searchEmployee')"><a class="category-link" href="#">직원관리</a></li>
                            <li class="category" onclick="movePage('')"><a class="category-link" href="#">전자결재</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


</body>
<script type="text/javascript">
    document.querySelector(".navi").addEventListener('click', (event) => {
        document.querySelector(".subMenu").classList.toggle("show")
    });
    
    profile();
    function profile() {
    	
    	var profilePictureSrc = "${sessionScope.profilePicture }";
        var defaultImageUrl = "/resources/images/profile_img.png"; // 기본 이미지 경로를 지정합니다.

        var profilePictureElement = document.getElementById("profilePicture");

        // 만약 profilePictureSrc 값이 null이라면 기본 이미지 경로를 사용합니다.
        if (!profilePictureSrc) {
            profilePictureElement.src = defaultImageUrl;
        } else {
            profilePictureElement.src = profilePictureSrc;
        }
    };
    
    function movePage(url) {
        location.href = url;
    }

    // 이벤트 리스너로 페이지 전환
    document.querySelectorAll('.category-link').forEach(item => {
        item.addEventListener('click', function() {
        	movePage();
        });
    });

</script>

</html>