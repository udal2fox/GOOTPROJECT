<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
       margin : 0;
	   padding : 0;
	   position: relative;
	}
	div{
	   display: block;
	}
	#navBar{
	   position: fixed;
	   width : 100%;
	   top : 0;
	}
	#orgchart-form {
       width: 100%;
       text-align: center;
    }
    li {
       list-style: none;
    }
    #orgTeam {
       display: flex;
       justify-content: center; 
    }
    .team {
       padding : 50px; 
    }
    #title{
       display : inline-block;
       margin-top : 100px;
       margin-left: 300px;
    }
    #orgHeader{
       display : flex;
       justify-content: center; 
    }
    #header{
       background-color : skyblue;
       height : 80px;
       width : 260px;
       border : none;
       border-radius: 25%;
    }
    #reader-Name{
       background-color : #0a58ca;
       color : white;
       height : 80px;
       width : 260px;
       border : 1px solid black;
    }
    #header p, #reader-Name p {
       margin-top: 8px;
    }
    #team-member {
       margin-top : 30px;
       height : 150px;
       background-color : skyblue;
       border-radius: 25%;
       padding: 40px;
    }
    #team-member p {
       font-weight : bold;
       font-size : 20px;
    }
    #team-member Strong {
       font-size : 20px;
       color: white;
    }
    #team-member1 {
       height : 150px;
       background-color : skyblue;
       border-radius: 25%;
       padding: 40px;
    }
    #team-member1 p {
       font-weight : bold;
       font-size : 20px;
    }
    #team-member1 Strong {
       font-size : 20px;
       color: white;
    }
</style>
</head>
	
<body>
	<div id="navBar">
		<jsp:include page="../navBar.jsp"/>
	</div>
		<div id="title">
			<h1> 조직도 </h1>
		</div>
		<div id="orgchart">
			<div id="orgchart-form">
				<div id="orgHeader">
					<ul class="orgHeader">
						<li id="header">
							<c:forEach items="${orgchart}" var="vo">
        						<c:if test="${vo.job == '대표'}">	
									<p>${vo.job } </p>
									<Strong>${vo.EName } </Strong>
								</c:if>
							</c:forEach>
						</li>
					</ul>
				</div>
				<div id="orgTeam">
					<ul class="team">
						<li id="reader-Name">
							<c:forEach items="${orgchart}" var="vo">
								<c:if test="${vo.job == '팀장' && vo.DName == '재무'}">
									<p> 경영 지원본분 </p>
									<strong>${vo.EName }</strong>
								</c:if>
							</c:forEach>
						</li>
						<li id="team-member">
							<c:forEach items="${orgchart}" var="vo">
								<c:if test="${vo.job == '대리' && vo.DName == '재무'}">
									<p> ${vo.DName }팀 </p>
									<strong> ${vo.EName } </strong>
								</c:if>
							</c:forEach>
						</li>
						<li id="team-member1">
							<c:forEach items="${orgchart}" var="vo">
								<c:if test="${vo.job == '대리' && vo.DName == '인사'}">
									<p> ${vo.DName }팀 </p>
									<strong> ${vo.EName } </strong>
								</c:if>
							</c:forEach>
						</li>
					</ul>
					<ul class="team" style="margin-left: 30px;">
						<li id="reader-Name">
							<c:forEach items="${orgchart}" var="vo">
								<c:if test="${vo.job == '팀장' && vo.DName == '인사'}">
									<p> 운영본분 </p>
									<strong> ${vo.EName } </strong>
								</c:if>
							</c:forEach>
						</li>
						<li id="team-member">
							<c:forEach items="${orgchart}" var="vo">
								<c:if test="${vo.job == '과장' && vo.DName == '영업'}">
									<p> ${vo.DName }팀 </p>
									<strong> ${vo.EName } </strong>
								</c:if>
							</c:forEach>
						</li>
						<li id="team-member1">
							<c:forEach items="${orgchart}" var="vo">
								<c:if test="${vo.job == '대리' && vo.DName == '상품'}">
									<p> ${vo.DName }팀 </p>
									<strong> ${vo.EName } </strong>
								</c:if>
							</c:forEach>
						</li>
						<li id="team-member1">
							<c:forEach items="${orgchart}" var="vo">
								<c:if test="${vo.job == '대리' && vo.DName == '영업'}">
									<p> 마케팅팀 </p>
									<strong> ${vo.EName } </strong>
								</c:if>
							</c:forEach>
						</li>
					</ul>
					<ul class="team">
						<li id="reader-Name">
							<p> 개발본분 </p>
							<strong> 리자몽 </strong>
						</li>
						<li id="team-member">
							<p>개발팀</p>
							<strong>리자드</strong>
						</li>
						<li id="team-member1">
							<p>디자인팀</p>
							<strong>파이리</strong>
						</li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>