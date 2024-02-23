<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/productManagementPage/productManagement.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<jsp:include page="../navBar.jsp"/>
<body>
<div class="product-top container-fluid" >
	<p class="p_product container">상품관리</p>
    <div class="product-top-back">
        <table style="background:#eaeaea;">
            <tr>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="padding-top: 25px;padding-right: 215px;">
                        <label>상품 분류</label>
                        <div class="form-check">
                            <input class="form-check-input" checked="checked" type="checkbox" data-filter="product-type" value="전체" id="product-typeAll">
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
                    	<div class="flex-div" style="padding-top:25px">
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
                    	<div class="flex-div" style="padding-right:22px;">
                        <label>키워드</label>
                        <div class="input-group mb-3" style="width: 320px;margin: 20px;">
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
                    	<div class="flex-div" style="padding-right: 208px;">
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
			            <th>상품명<button type="button" class="sort-btn" data-column="prdName">🔽</button></th>
			            <th>원가<button type="button" class="sort-btn" data-column="prdCstPri">🔽</button></th>
			            <th>판매가<button type="button" class="sort-btn" data-column="prdSal">🔽</button></th>
			            <th>마진율<button type="button" class="sort-btn" data-column="prdMargin">🔽</button></th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="ex" items="${list}">
			            <tr class="product" data-type="${ex.prdMajorCtg}" data-status="${ex.prdSt}">
			                <td>${ex.supsCo}</td>
			                <td>${ex.prdNo }</td>
			                <td>${ex.prdSdc }</td>
			                <td>${ex.prdMajorCtg }</td>
			                <td>${ex.prdSubCtg }</td>
			                <td><img alt="" src="${ex.prdImg}"><br>${ex.prdName }</td>
			                <td><fmt:formatNumber value="${ex.prdCstPri }" pattern="#,###"/></td>
              				<td><fmt:formatNumber value="${ex.prdSal }"	   pattern="#,###"/></td>
			                <td>${ex.prdMargin * 100 }%</td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>
			<div class="container">
		        <button type="button" class="btn btn-primary">신규 등록</button>
		    </div>
        </form>
    </div>
    <!-- page -->
    <div class="page-wrap container">
        <ul class="page-nation">
            <c:if test="${pageMaker.prev }">
                <li class="previous">
                    <a href="${pageMaker.startPage -1 }"> &lt; </a>
                </li>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
                <li>
                    <a href="${num}" class="${pageMaker.cri.pageNum == num ? 'active' : '' }">${num }</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next }">
                <li>
                    <a href="${pageMaker.endPage +1 }"> &gt; </a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

</body>
<script type="text/javascript" src="/resources/js/productPage/prdUpDownLoad.js"></script>
<script type="text/javascript" src="/resources/js/productPage/prdPageFilter.js"></script>
<script type="text/javascript" src="/resources/js/productPage/prdPageSearch.js"></script>
</html>