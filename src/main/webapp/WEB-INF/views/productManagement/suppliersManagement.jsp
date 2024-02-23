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
<div class="product-top" style="padding-top: 100px">
	<p class="p_product">공급처관리</p>
    <div class="product-top-back">
        <table style="background:#eaeaea;">
            <tr>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="padding-top: 25px;padding-right: 215px;">
                        <label>공급처 구분</label>
                        <div class="form-check">
                            <input class="form-check-input" checked="checked" type="checkbox" data-filter="product-type" value="전체" id="product-typeAll">
                            <label class="form-check-label" for="product-typeAll">전체</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" checked="checked" type="checkbox" data-filter="product-type" value="상품권" id="voucher">
                            <label class="form-check-label" for="voucher">법인</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" checked="checked" type="checkbox" data-filter="product-type" value="현물" id="actualThing">
                            <label class="form-check-label" for="actualThing">개인</label>
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
                            <label class="form-check-label" for="onSale">거래중</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" data-filter="product-status" type="checkbox" value="일시품절" id="outOfStock" checked="checked">
                            <label class="form-check-label" for="outOfStock">거래중단</label>
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
                            <input type="text" class="form-control" placeholder="업체코드/공급처명/연락처" aria-label="키워드 입력" aria-describedby="test" id="keyword">
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
                        <th>입점업체코드<button type="button" class="sort-btn" data-column="supsCo">🔽</button></th>
			            <th>공급처명<button type="button" class="sort-btn" data-column="prdNo">🔽</button></th>
			            <th>공급처 구분<button type="button" class="sort-btn" data-column="prdSdc">🔽</button></th>
			            <th>사업자등록번호<button type="button" class="sort-btn" data-column="prdMajorCtg">🔽</button></th>
			            <th>공급처 주소<button type="button" class="sort-btn" data-column="prdSubCtg">🔽</button></th>
			            <th>연락처<button type="button" class="sort-btn" data-column="prdName">🔽</button></th>
			            <th>메일주소<button type="button" class="sort-btn" data-column="prdCstPri">🔽</button></th>
			            <th>상태<button type="button" class="sort-btn" data-column="prdSal">🔽</button></th>
			        </tr>
			    </thead>
			    <tbody>
			        <%-- <c:forEach var="ex" items="${list}"> --%>
			            <tr class="product" data-type="${ex.prdMajorCtg}" data-status="${ex.prdSt}">
			                <td>1</td>
			                <td>2</td>
			                <td>3</td>
			                <td>4</td>
			                <td>5</td>
			                <td>6</td>
			                <td>7</td>
              				<td>8</td>
			            </tr>
			       <%--  </c:forEach> --%>
			    </tbody>
		</table>
        </form>
    <div style="padding-left: 300px;">
        <button type="button" class="btn btn-primary">신규 등록</button>
    </div>
    </div>
    <!-- page -->
    <div class="page-wrap">
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

</html>