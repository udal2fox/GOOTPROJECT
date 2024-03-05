<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/company/productManagementPage/productManagement.css">
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<jsp:include page="../../navBar.jsp"/>
<div class="container-fluid"  style="padding-top: 30px;" align="center">	
    <h2 style="width: 1500px;" align="left">상품관리</h2>
    <div class="" >
        <table class="prdTable" style="background:#eaeaea;">
            <tr>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="">
                        <label>상품 분류</label>
                        <div class="form-check">
                            <input class="form-check-input" checked="checked" type="checkbox" value="전체" id="product-typeAll">
                            <label class="form-check-label" for="product-typeAll">전체</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" checked="checked" type="checkbox" data-filter="product-type" value="상품권" id="voucher">
                            <label class="form-check-label" for="voucher">상품권</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" checked="checked" type="checkbox" data-filter="product-type" value="현물" id="actualThing">
                            <label class="form-check-label" for="actualThing">현물</label>
                        </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="">
                        <label>상품 상태</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="전체" id="product-statusAll" checked="checked">
                            <label class="form-check-label" for="product-statusAll">전체</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" data-filter="product-status" type="checkbox" value="판매중" id="onSale" checked="checked">
                            <label class="form-check-label" for="onSale">판매중</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" data-filter="product-status" type="checkbox" value="일시품절" id="outOfStock" checked="checked">
                            <label class="form-check-label" for="outOfStock">일시품절</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" data-filter="product-status" type="checkbox" value="단종" id="soldOut" checked="checked">
                            <label class="form-check-label" for="soldOut">단종</label>
                        </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="">
                        <label>키워드</label>
                        <div class="input-group mb-3" style="width: 320px;margin: 15px;">
                            <span class="input-group-text" id="test">🔍</span>
                            <input type="text" class="form-control" placeholder="공급처명/상품코드/대분류/소분류/상품명" aria-label="키워드 입력" aria-describedby="test" id="keyword">
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary" id="search">검색</button>
                            <button type="button" class="btn btn-primary" id="reset">초기화</button>
                        </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="">
                        <label>상품 일괄 편집</label>
                        <div>
                       		<input type="file" class="custom-file-input" id="excelUpload" name="EXCEL" multiple="multiple" style="display: none;">
                            <button type="button" class="btn btn-primary" id="uploadBtn">엑셀 업로드</button>
                            <button type="button" class="btn btn-primary" id="downloadButton">엑셀 다운로드</button>
                        </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div style="padding-top: 40px">
        <form>
            <table border="1" class="table" id="table-prd">
			    <thead class="table-light">
			        <tr>
                        <th>공급처명<button type="button" class="sort-btn" data-column="supsCo">🔽</button></th>
			            <th>상품코드<button type="button" class="sort-btn" data-column="prdNo">🔽</button></th>
			            <th>표준유통코드<button type="button" class="sort-btn" data-column="prdSdc">🔽</button></th>
			            <th>대분류<button type="button" class="sort-btn" data-column="prdMajorCtg">🔽</button></th>
			            <th>소분류<button type="button" class="sort-btn" data-column="prdSubCtg">🔽</button></th>
			            <th width="490px;">상품명<button type="button" class="sort-btn" data-column="prdName">🔽</button></th>
			            <th>원가<button type="button" class="sort-btn" data-column="prdCstPri">🔽</button></th>
			            <th>판매가<button type="button" class="sort-btn" data-column="prdSal">🔽</button></th>
			            <th>마진율<button type="button" class="sort-btn" data-column="prdMargin">🔽</button></th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="ex" items="${list}">
			            <tr class="product" data-type="${ex.prdMajorCtg}" data-status="${ex.prdSt}">
			                <td><a href="moveSuppliersUpdate?supsNo=${ex.supsNo }">${ex.supsCo}</a></td>
			                <td><a href="moveProductUpdate">${ex.prdNo }</a></td>
			                <td>${ex.prdSdc }</td>
			                <td>${ex.prdMajorCtg }</td>
			                <td>${ex.prdSubCtg }</td>
			                <td>
			                		<img alt="" src="${ex.prdImg}" align="left">
			                		<div id="tdTop">${ex.prdName }</div>
			                </td>
			                <td><fmt:formatNumber value="${ex.prdCstPri }" type="currency"/></td>
              				<td><fmt:formatNumber value="${ex.prdSal }"	   pattern="#,###"/></td>
              				<td><fmt:formatNumber value="${ex.prdMargin * 100}"	pattern=".00"/>%</td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>
			<div style="width: 1500px;" align="left">
		        <button type="button" class="btn btn-primary" onclick="location.href='moveProductReg'">신규 등록</button>
		    </div>
        </form>
    </div>
    <!--페이지 부분제거후 js 로 그릴예정 -->
    <!-- page -->
    <div id="pagination" class="page-wrap" align="center" style="width: 1500px;">
    <ul class="page-nation">
        <!-- 페이지네이션은 이곳에 동적으로 생성 -->
        
    </ul>
</div>

</div>

<script type="text/javascript" src="/resources/js/company/productPage/prdPageFilter.js"></script> 
<script type="text/javascript" src="/resources/js/company/productPage/prdPageSearch.js"></script>
<script type="text/javascript" src="/resources/js/company/productPage/prdUpDownLoad.js"></script>

</html>