<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	div{
		display: block;
	}
	pull-wrap{
		width : 100%;
		height: auto;
	}
	h3{	
		margin-left: 30px;
		text-align: left;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	#searchBar{
		display : inline-block;
		margin-left: 80px;
	}
	#selectDept{
		display : inline-block;
		margin-left: 100px;
	}
	span{
		margin-right: 20px;
	}
	.searchBar{
		width : 210px;
		height: 40px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.dept-sb{
		width: 150px;
		height: 40px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	#execelBtn{
		width : 167px;
		height: 40px;
		margin-left: 750px;
		border: none;
		border-radius: 5px;
		background-color: #787DFF;
		color: white;
	}
	#searchResult_table{
		width: 100%;
		height: 500px;
	}
	#searchResult{
		margin : 0 auto;
		width: 90%;
		height: auto;
		border: 1px solid black;
		border-collapse: collapse;
	}
	#searchResult th, #searchResult td {
 	 	border: 1px solid black;
  		padding: 8px;
  		text-align: center;
  		width: 112px;
  		height: 30px; 
	}
	.insertEmployeeBtn{
		width: 100%;
		height: 80px;
		padding : 20px;
		text-align: right;
	
	}
	#insertBtn{
		width:100px;
		height: 40px;
		border: none;
		background-color: skyblue;
		color: white;
			margin-right: 65px;
	}
</style>
</head>
<body>

	<jsp:include page="../../navBar.jsp"></jsp:include>
	<div id="pull-wrap">
	<h3> 직원조회 </h3>
		<div id="searchBar-select">
			<div id="searchBar">
				<span>키워드</span>
				<input class="searchBar" type="text" name="" placeholder="이름/팀명/이메일">
			</div>
			<div id="selectDept">
				<span>조직별 구분</span>
				<select class="dept-sb">
					<option value="인사"> 인사 </option>
					<option value="재무"> 재무 </option>
					<option value="영업"> 영업 </option>
					<option value="상품"> 상품 </option>
				</select>
			</div>
			<button id="execelBtn"> 엑셀로 내려받기 </button>
		</div>
		<hr style="border : 0.5px solid gray; width: 98%; margin: 0 auto; margin-top: 10px; margin-bottom: 10px;">
		
		<div id="searchResult_table">
			<table id="searchResult">
				<tr>
					<td>사번</td>
					<td>이름</td>
					<td>이메일</td>
					<td>연락처</td>
					<td>부서</td>
					<td>직급</td>
					<td>재직상태</td>
					<td>입사일</td>
					<td>퇴사일</td>
					<td>계정상태</td>
				</tr>
				<tr>
					<td>1</td>
        			<td>001</td>
        			<td>홍길동</td>
       		 		<td>hong@example.com</td>
        			<td>010-1234-5678</td>
        			<td>인사팀</td>
        			<td>대리</td>
        			<td>재직중</td>
        			<td>2023-01-01</td>
        			<td>활성</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
				<div class="insertEmployeeBtn">
					<button id="insertBtn" name="insertEmployee">신규등록</button>
				</div>
			<div>
				<!-- 나중 cri 버튼 영역 -->
			</div>
		</div>
	</div>	
</body>
</html>