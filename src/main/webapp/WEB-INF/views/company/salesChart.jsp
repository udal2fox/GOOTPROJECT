<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../navBar.jsp" %> 
<div class="container-sm" style="padding-top: 50px;">
  <canvas id="myChart"></canvas>
  <h4>월별 매출 통계</h4>
</div>
</body>
<script type="text/javascript">
	const ctx = document.getElementById('myChart');
	
	new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ],
	    datasets: [{
	      label: '매출액',
	      data: [12, 19, 3, 5, 2, 3,15,23,22,11,13,14],
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  }
	});
</script>
</html>