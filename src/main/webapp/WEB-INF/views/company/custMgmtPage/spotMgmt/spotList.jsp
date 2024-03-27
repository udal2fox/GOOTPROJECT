<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp"/>
	</div>
	<div class="container-fluid" align="center" style="padding: 100px;">
	<div class="entire">

	<div class="title" align="left">
		<h3>지점 관리</h3>
	</div>
	<div class="searchBar_div">
	<form method="post">
		<table class="searchBar_tbl">
			<thead>
				<tr>
					<tr>
					<th>키워드</th>
					<td>
					<input type="text" class="searchBarKeyword" id="keyword" name="searchBarKeyword" placeholder="기업명/지점명/담당자/주소" style="text-align: center;">
					</td>
					<td rowspan="2"></td>
					<th rowspan="2"></th>
					<td rowspan="2"></td>
					<td rowspan="2"></td>
			
				</tr>
				<tr>
					<th>이용 상태</th>
				<td>
					<div class="checkbox_div">
					<input class="form-check-input" type="checkbox" id="spotList-serviceStatusAll" value="전체" checked>전체
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="spotList-serviceStatus" value="활동" checked>활동   
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="spotList-serviceStatus" value="중단" checked>중단
					<input class="form-check-input filter-checkbox" type="checkbox" data-filter="spotList-serviceStatus" value="해지" checked>해지
					</div>
				</td>
				</tr>
			</thead>
		</table>
			<input type="button" id="searchBarSearchBtn" value="검색">
			<input type="reset"  id="searchBarResetBtn" value="초기화">
		</form>
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
		
	 <div>
	 <form>
      <table class="list_div_tbl" id="spot_tbl">
         <thead>
            <tr class="top_bar_of_list">
         
               <th>기업 번호</th>
               <th>지점 번호</th>
               <th>기업명<button type="button" class="sort-btn" data-column="comName">🔽</button></th>
               <th>지점명<button type="button" class="sort-btn" data-column="spName">🔽</button></th>
               <th>주소</th>
               <th>계약일자</th>
               <th>상태<button type="button" class="sort-btn" data-column="spStatus">🔽</button></th>
               <th>상태 변경 일자</th>
               <th>담당자<button type="button" class="sort-btn" data-column="userName">🔽</button></th>
               <th>직원 리스트</th>   
            </tr>
         </thead>
         <tbody>
            <c:forEach var="vo" items="${spotListVO }">
               <tr class="spotList" data-type="${vo.spStatus}">
                <td><a href="${vo.companyNo }">${vo.companyNo }</a></td>
            	<td><a href="${vo.spotNo }">${vo.spotNo }</a></td>
            	<td>${vo.comName }</td>
            	<td>${vo.spName }</td>
            	<td>${vo.spAddr }</td>
            	<td>${vo.spAgreementDate }</td>
            	<td>${vo.spStatus }</td>
            	<td>${vo.spChangeDate }</td>
            	<td><a href="#" id="open_managerInpo_modal">${vo.userName }</a></td>
            	<td><a href="#" id="open_empList_modal">보기</a></td>
        
               </tr>
            </c:forEach>
         </tbody>
      </table>
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
	<div class="btn_div">
		<input type="button" id="moveSpotRegisterBtn" value="지점 등록">
	</div>

<!-------------------------------- 직원 리스트 모달-->
<div class="modal" id="empList_modal">
    	
      <div class="modal-content">
      	<div class="modal-top">
    		<span class="modal-title">지점명</span>
    		<input type="text" size="20" readonly>
    		<input type="text" size="20" >
    		<input type="button" id="searchBtn" value="검색">
 		</div>
 		<div class="list_div_modal">
      <table class="list_div_tbl_modal">
         <thead>
            <tr class="top_bar_of_list_modal">
               <th>임직원 등록 번호</th>
               <th>이름</th>
               <th>연락처</th>
               <th>이메일</th>
               <th>직급</th>
               <th>1인 예산</th>
               <th>생년월일</th>
               <th>주문일자</th>
               <th>상품</th>  
            </tr>
 			<tr>
        	<td><a href="#" id="open_empInfo_modal">1</a></td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>

        </tr>
         </thead>

      </table>
	</div>
		<div class="modal-footer">	
            <button type="button" id="close_empList_modal">닫기</button>
         </div>
     
      </div>
   </div>	
	
	
	
<!--------------------------------------- 지점 ,직원 정보 수정-->
<div class="modal" id="empInpo_modal">
    	
      <div class="modal-content">
      	<div class="modal-top">
    		<span class="modal-title">지점 직원 정보 수정</span>
 		</div>

	<div class="list_div_modal">
      <table class="list_div_tbl_modal">
         <thead>
            <tr class="top_bar_of_list_modal">
               <th>임직원 등록 번호</th>
               <th>이름</th>
               <th>연락처</th>
               <th>이메일</th>
               <th>직급</th>
               <th>1인 예산</th>
               <th>생년월일</th>
               <th>주문일자</th>
               <th>상품</th>  
            </tr>
			     <tr>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        	<td>test</td>
        </tr>
         </thead>

      </table>
	</div>
		<div class="modal-footer">	
			<button type="button"  id="updateModalBtn">수정</button>
            <button type="button" id="close_empInpo_modal">닫기</button>
         </div>
     
      </div>
   </div>	
	
	<!--------------------------------------- 담당자 정보 수정-->
<div class="modal" id="managerInpo_modal">
    	
      <div class="modal-content">
     

	<div class="list_div_modal">
      <table class="list_div_tbl_modal">
         <thead>
            <tr>
               <th>담당자 이름</th>
            </tr>
            <tr>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>연락처</th>
            </tr>
            <tr>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>이메일</th>
            </tr>
            <tr>
               <td><input type="text"></td>
            </tr>
            <tr>
               <th>비밀번호</th>
            </tr>
            <tr>
               <td><input type="text"></td>
            </tr>
        
         </thead>

      </table>
	</div>
		<div class="modal-footer">	
            <button type="button" id="close_managerInpo_modal">저장</button>
			<button type="button"  id="reset_managerInpo_modal">취소</button>
         </div>
     
      </div>
   </div>	
	
	
	
	
	
	

</div>
</div>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotFilter.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotSearch.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotMgmt.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotMgmtModal.js"></script>
</body>
</html>