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
    <!-- 공통 사이드바를 포함합니다. -->
    <jsp:include page="sidebar.jsp"></jsp:include>

    <!-- 메인 콘텐츠 -->
    <div class="container mt-5 px-5">
        <section>
            <article class="container text-center">
                <!-- 선물 가격대별 필터링 버튼 -->
                <div class="row">
                    <div class="col text-center align-middle">
                        <span>가격대 선택</span>
                    </div>
                    <!-- 시작 가격 선택 -->
                    <div class="col-2">
                        <select class="form-select" aria-label="Default select example" id="start_scope">
                            <option selected value="0">0</option>
                            <option value="10000">10,000</option>
                            <option value="20000">20,000</option>
                            <option value="30000">30,000</option>
                            <option value="50000">50,000</option>
                            <option value="70000">70,000</option>
                            <option value="80000">80,000</option>
                            <option value="100000">100,000</option>
                            <option value="150000">150,000</option>
                            <option value="200000">200,000</option>
                        </select>
                    </div>
                    <div class="col text-center align-middle">
                        <span> ~ </span>
                    </div>
                    <!-- 끝 가격 선택 -->
                    <div class="col-2">
                        <select class="form-select" aria-label="Default select example" id="end_scope">
                            <option value="0">0</option>
                            <option value="10000">10,000</option>
                            <option value="20000">20,000</option>
                            <option value="30000">30,000</option>
                            <option value="50000">50,000</option>
                            <option value="70000">70,000</option>
                            <option value="80000">80,000</option>
                            <option value="100000">100,000</option>
                            <option value="150000">150,000</option>
                            <option selected value="200000">200,000</option>
                        </select>
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col-2">
                        <input type="text" class="form-control w-100" name="search">
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-primary w-100" id="searchKeyword">검색</button>
                    </div>
                </div>
            </article>
            <hr>
            <!-- 선물 옵션을 표시합니다. -->
            <article>
                <div class="mt-3">
                    <div class="overflow-auto mt-3" style="height: 530px;">
                        <div class="row row-cols-1 row-cols-md-6 g-4 p-2 mt-3" id="productList" style="width: 1200px;">
                            <div class="col p-1">
                                <!-- 각 선물 옵션에 대한 체크박스 -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="1">
                                    <label class="form-check-label" for="1"> <!-- 선물 이미지와 설명을 표시합니다. -->
                                        <div class="card" style="width: 150px;">
                                            <img src="" class="card-img-top object-fit-fill border rounded" alt="product" width="150px" height="150px">
                                            <div class="card-body">
                                                <span class="card-text" style="font-size: 0.7rem;">신세계 상품권 10만원</span>
                                            </div>
                                        </div>
                                    </label>
                                </div>
                            </div>
                            <!-- 추가 선물 옵션 -->
                            <!-- 각 선물마다 체크박스와 카드를 추가합니다. -->
                        </div>
                    </div>
                </div>
            </article>
            <!-- 선택한 선물과 작업 버튼을 표시합니다. -->
            <article class="mt-5">
                <div class="d-flex">
                    <div class="p-2 flex-grow-1">
                        <div class="row g-3 align-items-center">
                            <div class="col-auto">
                                <label for="selectGift" class="col-form-label fw-bold" id="checkCount">선택한 선물 수 : </label>
                            </div>
                            <div class="col-auto">
                                <input type="text" id="selectGift" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="p-2">
						<!-- 닫기 버튼 -->
						<button type="button" class="btn btn-secondary" style="width: 200px" id="cancleButton">취소</button>
					</div>
                    <div class="p-2">
                        <!-- 선택 사항 초기화 버튼 -->
                        <button type="button" class="btn btn-secondary" style="width: 200px" id="resetButton">초기화</button>
                    </div>
                    <div class="p-2">
                        <!-- 선택 사항 저장 버튼 -->
                        <button type="button" class="btn btn-primary" style="width: 200px" id="saveButton">저장</button>
                    </div>
                </div>
            </article>
        </section>
    </div>
</body>
<!-- 사용자 정의 선물 기능을 위한 스크립트를 포함합니다. -->
<script src="/resources/js/userAdminPage/giftCustom.js"></script>
</html>
