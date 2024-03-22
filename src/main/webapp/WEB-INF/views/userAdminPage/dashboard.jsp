<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="/resources/images/favicon_rainbow.jpg"
        type="image/x-icon">
    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- chartjs-plugin-datalabels CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
    <title>Rainbow BirthDay</title>
    <style type="text/css">
        tr, td {
            width: 25%;
        }
    </style>
</head>
<body>

    <!-- SIDEBAR 페이지 공통내용 -->
    <!-- 사이드바 페이지를 포함합니다. -->
    <jsp:include page="sidebar.jsp"></jsp:include>

    <!-- 페이지별 개별 내용 소스코드-->
    <section class="p-2 mt-3">
        <div class="container">
            <div class="px-3">
                <div class="title mb-3">
                    <!-- 이벤트 정보를 나타내는 뱃지 -->
                    <span class="badge badge rounded-pill bg-danger">이벤트 정보</span>
                </div>

                <div class="table_inform">
                    <!-- 이벤트 정보를 표시하는 테이블 -->
                    <table class="table table-striped-columns table-bordered"
                        id="reg_info_table">
                        <tbody>
                            <!-- 서비스 시작일자 -->
                            <tr>
                                <th class="align-middle text-center">서비스 시작일자</th>
                                <!-- 서비스 시작일을 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatDate
                                        value="${dashboard.spAgreementDate}" pattern="yyyy년 MM월 dd일" /></td>
                                <!-- 전월 이용금액 -->
                                <th class="align-middle text-center">전월 이용금액</th>
                                <!-- 전월 이용금액을 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatNumber
                                        value="${dashboard.lastMonth}" pattern="###,###,###원" /></td>
                            </tr>
                            <!-- 1인당 예산 -->
                            <tr>
                                <th class="align-middle text-center">1인당 예산</th>
                                <!-- 1인당 예산을 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatNumber
                                        value="${dashboard.spBdgt}" pattern="#,###원" /></td>
                                <!-- 당월 이용금액 -->
                                <th class="align-middle text-center">당월 이용금액</th>
                                <!-- 당월 이용금액을 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatNumber
                                        value="${dashboard.thisMonth}" pattern="###,###,###원" /></td>
                            </tr>
                            <!-- 지점 임직원 수 -->
                            <tr>
                                <th class="align-middle text-center">지점 임직원 수</th>
                                <!-- 지점 임직원 수를 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatNumber
                                        value="${dashboard.spEmpNum}" pattern="###,###명" /></td>
                                <!-- 전년 이용금액 -->
                                <th class="align-middle text-center">전년 이용금액</th>
                                <!-- 전년 이용금액을 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatNumber
                                        value="${dashboard.lastYear}" pattern="###,###,###원" /></td>
                            </tr>
                            <!-- 임직원 업데이트 일자 -->
                            <tr>
                                <th class="align-middle text-center">임직원 업데이트 일자</th>
                                <!-- 임직원 업데이트 일자를 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatDate
                                        value="${dashboard.spEmpUpdate}" pattern="yyyy년 MM월 dd일" /></td>
                                <!-- 금년 이용금액 -->
                                <th class="align-middle text-center">금년 이용금액</th>
                                <!-- 금년 이용금액을 표시합니다. -->
                                <td class="align-middle text-center fw-bold"><fmt:formatNumber
                                        value="${dashboard.thisYear}" pattern="###,###,###원" /></td>
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
                <div class="title mb-3">
                    <!-- 이용현황을 나타내는 뱃지 -->
                    <span class="badge rounded-pill bg-danger">이용현황</span>
                </div>

                <div class="chart_inform">
                    <div class="container text-center">

                        <div class="row">

                            <div class="col m-2" id="chart_table">
                                <!-- 차트를 표시하는 테이블 -->
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">
                                            	<img width="48" height="48" src="https://img.icons8.com/color/48/statistics.png" alt="statistics"/>
                                            	<span class="fs-5 fw-bold"> 월별 사용 현황 |</span>&nbsp;<span>최근 6개월간 월별 지출 현황</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <!-- 차트 표시 영역 -->
                                            <td id="chart1" style="height: 335px">
												<div class="col m-2" id="chart_table">
    												<canvas id="monthlyChart" width="400" height="200"></canvas>
												</div>
											</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="col m-2" id="top5_table">
                                <!-- TOP 5 테이블 -->
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col" colspan="3"><img width="48" height="48" src="https://img.icons8.com/color/48/shopping-cart-loaded.png" alt="shopping-cart-loaded"/>
                                            	<span class="fs-5 fw-bold"> 우리 직원 BEST TOP 5 |</span>&nbsp;<span>수량기준</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- TOP 5 아이템 목록 표시 -->
                                        <c:forEach items="${bestTop5}" var="item" varStatus="loop">
                                            <tr class="text-center align-middle">
                                                <!-- 순위 표시 -->
                                                <td style="width: 10%">${loop.index + 1}위</td>
                                                <!-- 제품 이미지 및 이름 표시 -->
                                                <td class="text-start"
                                                    style="width: 80%; max-width: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">&nbsp;&nbsp;
                                                    <img src="${item.prdImg}" alt="product"
                                                    style="width: 50px; height: 50px;"><span>
                                                        ${item.prdName}</span>
                                                </td>
                                                <!-- 제품 판매 수량 표시 -->
                                                <td style="width: 10%"><span>${item.total_count}개</span></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
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
    
