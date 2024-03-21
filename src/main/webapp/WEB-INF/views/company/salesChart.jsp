<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.charts1{
	display: flex;
}

</style>
</head>
<body>
<%@ include file="../navBar.jsp" %>
<div class="container"> 
	<div class="charts1">
		<div class="container " style="padding-top: 130px; width: 1600px; height: 500px;">
		  <h4>월별 매출 통계</h4>
		  <canvas id="myChart1"></canvas>
		</div>
		<div class="container " style="padding-top: 130px; width: 1600px; height: 500px;">
		  <h4>분기 매출 통계</h4>
		  <canvas id="myChart2"></canvas>
		</div>
	</div>
</div>

</body>


<script type="text/javascript">

	const ctx1 = document.getElementById('myChart1').getContext('2d');
	const ctx2 = document.getElementById('myChart2').getContext('2d');
		
	fetch('/month_sals')
	  .then(response => response.json())
	  .then(data => {
	    console.log(data);
	    
	    const recSum_month = data.map(item => item.recSum_month); // recSum_month 배열 추출
	    const total_amount = data.map(item => item.total_amount); // total_amount 배열 추출
	    
	    console.log(recSum_month);
	    console.log(total_amount);
	    
	    new Chart(ctx1, {
	      type: 'bar',
	      data: {
	        labels: recSum_month,
	        datasets: [{
	          label: '매출액',
	          data: total_amount,
	          borderWidth: 2
	        }]
	      },
	      options: {
	          maintainAspectRatio: true, // 가로 세로 비율을 유지하지 않음
	          scales: {
	            y: {
	              beginAtZero: true
	            }
	          }
	        }
	      });

	      // 차트 크기 조정
	    })
	  .catch(error => {
	    console.error('Error fetching data:', error);
	  });
	
	fetch('/quarter_sals')
	  .then(response => response.json())
	  .then(data => {
	    console.log(data);
	    
	    const recSum_quarter = data.map(item => item.recSum_quarter); // recSum_month 배열 추출
	    const quarter_amount = data.map(item => item.quarter_amount); // total_amount 배열 추출
	    
	    console.log(recSum_quarter);
	    console.log(quarter_amount);
	    
	    new Chart(ctx2, {
	      type: 'bar',
	      data: {
	        labels: recSum_quarter,
	        datasets: [{
	          label: '매출액',
	          data: quarter_amount,
	          borderWidth: 2
	        }]
	      },
	      options: {
	          maintainAspectRatio: true, // 가로 세로 비율을 유지하지 않음
	          scales: {
	            y: {
	              beginAtZero: true
	            }
	          }
	        }
	      });

	    })
	  .catch(error => {
	    console.error('Error fetching data:', error);
	  });
	
</script>
</html>