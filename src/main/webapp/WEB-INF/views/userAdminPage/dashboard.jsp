<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <section class="p-2 mt-3">
        <div class="container">
            <div class="px-3">
                <div class="title">
                    <span class="badge badge rounded-pill bg-danger">이벤트 정보</span>
                </div>

                <div class="table_inform">
                    <table class="table" id="reg_info_table">
                        <tbody>
                            <!-- 서비스 시작일자 -->
                            <tr>
                                <th class="align-middle text-center">서비스 시작일자</th>
                                <td class="align-middle text-center">${result.spAgreementDate}</td>
                                <!-- 전월 이용금액 -->
                                <th class="align-middle text-center">전월 이용금액</th>
                                <td class="align-middle text-center">${0}<span>원</span></td>
                                <td class="text-center"><button type="button"
                                        class="btn btn-outline-primary">거래명세서 내려받기</button></td>
                            </tr>
                            <!-- 1인당 예산 -->
                            <tr>
                                <th class="align-middle text-center">1인당 예산</th>
                                <td class="align-middle text-center">
                                    <fmt:formatNumber value="${result.spBdgt}" pattern="#,###" /><span>원</span>
                                </td>
                                <!-- 당월 이용금액 -->
                                <th class="align-middle text-center">당월 이용금액</th>
                                <td class="align-middle text-center">${0}<span>원</span></td>
                                <td class="text-center"><button type="button"
                                        class="btn btn-outline-primary">거래명세서 내려받기</button></td>
                            </tr>
                            <!-- 지점 임직원 수 -->
                            <tr>
                                <th class="align-middle text-center">지점 임직원 수</th>
                                <td class="align-middle text-center">${result.spEmpNum}<span>명</span></td>
                                <!-- 전년 이용금액 -->
                                <th class="align-middle text-center">전년 이용금액</th>
                                <td class="align-middle text-center">${0}<span>원</span></td>
                                <td class="text-center text-center"><button type="button"
                                        class="btn btn-outline-primary">거래명세서 내려받기</button></td>
                            </tr>
                            <!-- 임직원 업데이트 일자 -->
                            <tr>
                                <th class="align-middle text-center">임직원 업데이트 일자</th>
                                <td class="align-middle text-center">${result.spEmpUpdate}</td>
                                <!-- 금년 이용금액 -->
                                <th class="align-middle text-center">금년 이용금액</th>
                                <td class="align-middle text-center">${0}<span>원</span></td>
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