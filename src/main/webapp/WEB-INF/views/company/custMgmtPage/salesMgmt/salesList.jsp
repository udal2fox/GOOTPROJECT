<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/company/custMgmtPage/salesMgmt.css">
    <title></title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
    <div class="navBar">
        <jsp:include page="../../../navBar.jsp"/>
    </div>
    <div class="container-fluid" align="center" style="padding: 100px;">
        <div class="entire">
            <div class="title" align="left">
                <h3>신규 영업</h3>
            </div>
            <div class="searchBar_div">
   				<table class="searchBar_tbl">
        			<thead>
			            <tr>
			                <td class="searchBar_tbl_title" style="text-align:left;">키워드</td>
			                <td style="text-align: left;">
			                    <input type="text" class="searchBarKeyword" id="keyword" name="searchBarKeyword" placeholder="기업명/담당자명/이메일/영업 담당자" size="50">
			                </td>
			                <td></td>
			                <td></td>
			             </tr>
			             <tr>
			                <td class="searchBar_tbl_title" style="text-align:left;">영업 상태</td>
			                <td colspan="2" style="text-align: left;"> 
			                    <div class="checkbox-container">
			                        <input class="form-check-input" type="checkbox" id="salesList-csStatusAll" value="전체" checked>전체 
									<input class="form-check-input filter-checkbox" type="checkbox" data-filter="salesList-csStatus" value="최초 인입" checked>최초 인입
			                        <input class="form-check-input filter-checkbox" type="checkbox" data-filter="salesList-csStatus" value="응대 완료" checked>응대 완료
			                        <input class="form-check-input filter-checkbox" type="checkbox" data-filter="salesList-csStatus" value="견적 발송 완료" checked>견적 발송 완료
			                        <input class="form-check-input filter-checkbox" type="checkbox" data-filter="salesList-csStatus" value="미팅 완료" checked>미팅 완료
			                        <input class="form-check-input filter-checkbox" type="checkbox" data-filter="salesList-csStatus" value="계약 완료" checked>계약 완료
			                        <input class="form-check-input filter-checkbox" type="checkbox" data-filter="salesList-csStatus" value="계약 실패" checked>계약 실패
			                    </div>
			                </td>
			                <td></td>
			             </tr>
			             <tr>
			                <td class="searchBar_tbl_title" style="text-align:left;">기간</td>
			                <td style="text-align: left;">
			                    <input type="text" class="datePick1" placeholder="시작일" style="width: 150px;"> ~ 
			                    <input type="text" class="datePick2" placeholder="종료일" style="width: 150px;">
			                </td>
			                <td style="text-align:left;">
			                	 <input type="button" class="btn btn-secondary dateBtn" value="오늘">
			                    <input type="button" class="btn btn-secondary dateBtn" value="최근1주">
			                    <input type="button" class="btn btn-secondary dateBtn" value="이번달">
			                    <input type="button" class="btn btn-secondary dateBtn" value="지난달">
			                    <input type="button" class="btn btn-secondary dateBtn" value="지난분기">
			                </td>
			                <td></td> 
			             </tr>
			        </thead>
   				</table>
   			<div class="searchBar_btns">
	    		<input type="button" id="searchBarSearchBtn" value="검색">
	    		<input type="reset" id="searchBarResetBtn" value="초기화">
   			</div>	
		</div>
		<div class="download_to_excel_btn_div">
			<input type="file" class="custom-file-input" id="excelUpload" name="EXCEL" multiple="multiple" style="display: none;">
            <button type="button" class="btn btn-primary" id="uploadBtn">엑셀 업로드</button>
            <button type="button" class="btn btn-primary" id="downloadButton">엑셀 다운로드</button>
		</div>
		<div class="viewAFew_div">
			<select name="viewAFew" id="selectViewAFew">
				<option value="10">10</option>
				<option value="25">25</option>
				<option value="50">50</option>
				<option value="75">75</option>
				<option value="100">100</option>			
			</select>
				개씩 보기
		</div>
        <div class="list_div">
        	<form>
            	<table class="list_div_tbl" id="sales_tbl">
                	<thead>
                    	<tr class="top_bar_of_list">
                        	<th>번호</th>
                            <th>신청일<button type="button" class="sort-btn" data-column="csDate">🔽</button></th>
                            <th>기업명<button type="button" class="sort-btn" data-column="csCompanyName">🔽</button></th>
                            <th>신청인<button type="button" class="sort-btn" data-column="csName">🔽</button></th>
                            <th>연락처</th>
                            <th>이메일</th>
                            <th>예산</th>
                            <th>상태</th>
                            <th>담당자<button type="button" class="sort-btn" data-column="csEname">🔽</button></th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach var="vo" items="${consultVO}">
							<tr class="salesList" data-type="${vo.csStatus}">
								<td><a href="${vo.consultNo}">${vo.consultNo}</a></td>
							    <td>${vo.csDate}</td>
							    <td>${vo.csCompanyName}</td>
							    <td>${vo.csName}</td>
							    <td>${vo.csContact}</td>
							    <td>${vo.csEmail}</td>
							    <td><fmt:formatNumber value="${vo.csBdgt}" pattern="###,###"/></td>
							    <td>${vo.csStatus}</td>
							    <td>${vo.csEname}</td>
							 </tr>
						</c:forEach>
                    </tbody>
             </table>
         </form>
       </div>
	   <div id="pagination" class="page-wrap" style="width: 1200;">	
			<ul class="page-nation">
			 	<!-- 페이지네이션은 이곳에 동적으로 생성 -->  
		    </ul>
	  </div>
	</div>
	</div>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesFilter.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesSearch.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/salesMgmt.js"></script>
</body>
</html>