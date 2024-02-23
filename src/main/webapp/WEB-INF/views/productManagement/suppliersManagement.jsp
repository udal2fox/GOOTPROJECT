<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/productManagementPage/productManagement.css">
</head>
<body>
<jsp:include page="../navBar.jsp"/>
<div class="container-fluid"  style="padding-top: 100px;" align="center">	
    <h2 style="width: 1500px;" align="left">공급처관리</h2>
    <div class="" >
   		 <!--background: #eaeaea;
  	  	 border-spacing: 15px 30px;
   		 border-collapse: separate;  -->
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
                        <label>거래 상태</label>
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
                    	<div class="flex-div" style="padding-right:70px;">
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
                    	<div class="flex-div" style="padding-right: 255px;">
                        <label>거래처 일괄 편집</label>
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
			            <th>공급처구분</th>
			            <th>사업자등록번호</th>
			            <th>공급처주소</th>
			            <th>연락처</th>
			            <th>메일주소</th>
			            <th>상태<button type="button" class="sort-btn" data-column="prdSal">🔽</button></th>
			        </tr>
			    </thead>
			    <tbody>
			        <%-- <c:forEach var="ex" items="${list}">
			            <tr class="product" data-type="${ex.prdMajorCtg}" data-status="${ex.prdSt}">
			                <td><a href="moveSuppliersUpdate">${ex.supsCo}</a></td>
			                <td><a href="moveProductUpdate">${ex.prdNo }</a></td>
			                <td>${ex.prdSdc }</td>
			                <td>${ex.prdMajorCtg }</td>
			                <td>${ex.prdSubCtg }</td>
			                <td>
			                		<img alt="" src="${ex.prdImg}" align="left">
			                		<div id="tdTop">${ex.prdName }</div>
			                </td>
			                <td><fmt:formatNumber value="${ex.prdCstPri }" pattern="#,###"/></td>
              				<td><fmt:formatNumber value="${ex.prdSal }"	   pattern="#,###"/></td>
			                <td>${ex.prdMargin * 100 }%</td>
			            </tr>
			        </c:forEach> --%>
			    </tbody>
			</table>
			<!-- 나중에 스타일 안바꾸면디진다 -->
			<div style="width: 1500px;">
		        <button type="button" class="btn btn-primary" onclick="location.href='moveProductReg'">신규 등록</button>
		    </div>
        </form>
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
<script type="text/javascript" src="/resources/js/productPage/prdPageFilter.js"></script>
<script type="text/javascript" src="/resources/js/productPage/prdUpDownLoad.js"></script>
<script type="text/javascript" src="/resources/js/productPage/prdPageSearch.js"></script>

</html>