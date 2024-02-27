<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/company/custMgmtPage/salesMgmt.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>newSales.jsp</title>

</head>
<body>
	<div class="navBar">
		<jsp:include page="../../../navBar.jsp"/>
	</div>
	<div class="container-fluid" align="center" style="padding: 100px;">
	<div class="entire" >
	<div class="title" align="left">
		<h3>신규 영업</h3>
	</div>

	<div class="searchBar_div">
		<table class="searchBar_tbl">
			<thead>
				<tr>
				<th>키워드</th>
				<td>
					<input type="text" placeholder="기업명/담당자/메일주소/영업담당" style="text-align: center;">
				</td>
				<td></td>
				<th>영업 상태</th>
				<td>
					<select name="businessStatus" id="searchBar_selectBizSt">
								<option value="최초 인입">최초 인입</option>
								<option value="응대 완료">응대 완료</option>
								<option value="견적 발송 완료">견적 발송 완료</option>
								<option value="미팅 완료">미팅 완료</option>
								<option value="계약 완료">계약 완료</option>
								<option value="계약 실패">계약 실패</option>
					</select>
				</td>
				<td></td>
				</tr>
				<tr>
				<th>기간</th>
				<td>
					<input type="date" > ~ <input type="date">
				</td>
				<td colspan="4">
				<button type="button" class="btn btn-secondary btn-sm">오늘</button>
				<button type="button" class="btn btn-secondary btn-sm">일주일</button>
				<button type="button" class="btn btn-secondary btn-sm">이번 달</button>
				<button type="button" class="btn btn-secondary btn-sm">지난 달</button>
				<button type="button" class="btn btn-secondary btn-sm">지난 분기</button>

				
				</td>
				</tr>
			</thead>
		</table>
			<input type="button" id="searchBar_search_btn" value="검색">
			<input type="button" id="searchBar_reset_btn" value="초기화">
	</div>
	<div class="download_to_excel_btn_div">
		<input type="button" id="download_to_excel_btn" value="엑셀로 내려받기">
	</div>
		
	
	<div class="list_div">

      <table class="list_div_tbl">
         <thead>
            <tr class="top_bar_of_list">
               <th>번호</th>
               <th>신청일</th>
               <th>기업명</th>
               <th>신청인</th>
               <th>연락처</th>
               <th>이메일</th>
               <th>예산</th>
               <th>상태</th>
               <th>담당자</th>
            </tr>
         </thead>
         <tbody>
            
         </tbody>
      </table>


</div>
</div>
</div>
</body>
</html>