<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
						<input type="text" name="searchBarKeword" placeholder="기업명/담당자/메일주소/영업담당">
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
				<input type="checkbox" name="serviceStatus" value="전체" checked="checked" >전체
				<input type="checkbox" name="serviceStatus" value="활동" checked="checked" >활동
				<input type="checkbox" name="serviceStatus" value="중단" checked="checked" >중단
				<input type="checkbox" name="serviceStatus" value="해지" checked="checked" >해지
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
				<input type="button" class="companyListBtns" id="downloadExcelBtn" value="엑셀로 내려받기">
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
      <table class="list_div_tbl">
         <thead>
            <tr class="top_bar_of_list">
               <th>기업 번호</th>
               <th>지점 번호</th>
               <th>기업명</th>
               <th>지점명</th>
               <th>주소</th>
               <th>계약일자</th>
               <th>상태</th>
               <th>상태 변경 일자</th>
               <th>담당자</th>
               <th>직원 리스트</th>
            </tr>

         </thead>
         <tbody>
			<tr>
				<td><a href="/companyView">1</a></td>
				<td><a href="/spotView">1</a></td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td><a href="#" id="open_managerInpo_modal">담당자</a></td>
				<td><a href="#" id="open_empList_modal">test</a></td>
				</tr>

         </tbody>
      </table>


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
<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotMgmtModal.js"></script>
<script type="text/javascript" src="/resources/js/company/custMgmtPage/spotMgmt.js"></script>
</body>
</html>