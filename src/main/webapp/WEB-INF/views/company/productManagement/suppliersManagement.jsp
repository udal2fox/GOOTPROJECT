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
    <h2 style="width: 1500px;" align="left">공급처관리</h2>
    <div class="" >
        <table class="prdTable" style="background:#eaeaea;">
            <tr>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="">
                        <label>공급처 구분</label>
                        <div class="form-check">
                            <input class="form-check-input" checked="checked" type="checkbox" value="전체" id="sups-typeAll">
                            <label class="form-check-label" for="sups-typeAll">전체</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" checked="checked" type="checkbox" data-filter="sups-type" value="법인" id="corporation">
                            <label class="form-check-label" for="corporation">법인</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" checked="checked" type="checkbox" data-filter="sups-type" value="개인" id="individual">
                            <label class="form-check-label" for="individual">개인</label>
                        </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="section">
                    	<div class="flex-div" style="">
                        <label>상품 상태</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="전체" id="sups-statusAll" checked="checked">
                            <label class="form-check-label" for="sups-statusAll">전체</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" data-filter="sups-status" type="checkbox" value="거래중" id="onTrade" checked="checked">
                            <label class="form-check-label" for="onTrade">거래중</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input filter-checkbox" data-filter="sups-status" type="checkbox" value="거래중단" id="outTrade" checked="checked">
                            <label class="form-check-label" for="outTrade">거래중단</label>
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
                    	<div class="flex-div" style="">
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
                        <th>입점업체코드<button type="button" class="sort-btn" data-column="supsNo">🔽</button></th>
			            <th>공급처명<button type="button" class="sort-btn" data-column="supsCo">🔽</button></th>
			            <th>공급처구분<button type="button" class="sort-btn" data-column="supsBnt">🔽</button></th>
			            <th>사업자등록번호</th>
			            <th>공급처주소</th>
			            <th>연락처</th>
			            <th>메일주소</th>
			            <th>상태<button type="button" class="sort-btn" data-column="supsSt">🔽</button></th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="ex" items="${list}">
			            <tr class="sups" data-type="${ex.supsBnt}" data-status="${ex.supsSt}">
				        	<td><a href="moveSuppliersUpdate?supsNo=${ex.supsNo }">${ex.supsNo}</a></td>
				        	<td>${ex.supsCo}</td>
				        	<td>${ex.supsBnt}</td>
				        	<td>${ex.supsBizRegNum}</td>
				        	<td>${ex.supsAddr}</td>
				        	<td>${ex.supsCt}</td>
				        	<td>${ex.supsCoEmail}</td>
				        	<td>${ex.supsSt}</td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>
			<div style="width: 1500px;" align="left">
		        <button type="button" class="btn btn-primary" onclick="location.href='moveSuppliersRegist'">신규 등록</button>
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

<script type="text/javascript" src="/resources/js/company/productPage/supsPageFilter.js"></script> 
<script type="text/javascript" src="/resources/js/company/productPage/supsPageSearch.js"></script>
<script type="text/javascript" src="/resources/js/company/productPage/supsUpDownLoad.js"></script>

</html>