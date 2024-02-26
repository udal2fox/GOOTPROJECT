<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #orgHeader{
    	margin-left: 30px;
    }
    #title{
    	display : inline-block;
    	margin-top : 100px;
    	margin-left: 300px;
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
							<strong> 대표 </strong>
							<p>지우새끼</p>
						</li>
					</ul>
				</div>
				<div id="orgTeam">
					<ul class="team">
						<li id="reader-Name">
							<p> 경영 지원본분 </p>
							<strong>라이츄</strong>
						</li>
						<br>
						<li>
							<p> 재무팀 </p>
							<strong> 피카츄 </strong>
						</li>
						<br>
						<li>
							<p> 인사팀 </p>
							<strong> 피츄 </strong>
						</li>
					</ul>
					<ul class="team">
						<li id="reader-Name">
							<p> 운영본분 </p>
							<strong> 거북왕 </strong>
						</li>
						<br>
						<li>
							<p> 영업팀 </p>
							<strong> 어니부기 </strong>
						</li>
						<br>
						<li>
							<p> 상품팀 </p>
							<strong> 꼬부기 </strong>
						</li>
						<br>
						<li>
							<p> 마케팅팀 </p>
							<strong> 이상해씨 </strong>
						</li>
					</ul>
					<ul class="team">
						<li id="reader-Name">
							<p> 개발본분 </p>
							<strong> 리자몽 </strong>
						</li>
						<br>
						<li>
							<p>개발팀</p>
							<strong>리자드</strong>
						</li>
						<br>
						<li>
							<p>디자인팀</p>
							<strong>파이리</strong>
						</li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>