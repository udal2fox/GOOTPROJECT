<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<%@ include file="../navBar.jsp" %>
<div class="container-fluid" align="center"> 
	<div style="display: flex; justify-content: center;" align="center">	
		<div>
			<div class="container " style="padding-top: 70px; width: 500px; height: 800px;">
			  <h4>월별 매출 통계</h4>
			  <canvas id="myChart1"></canvas>
			</div>
		</div>
		<div style="">
			<div style="display: flex;">
				<div class="container " style="padding-top: 80px; height: 400px; width: 500px;">
				  <h4>분기 매출 통계</h4>
				  <canvas id="myChart2"></canvas>
				</div>
				<div class="container " style="padding-top: 80px; width: 500px; height: 400px;">
				  <h4>월별 고객사 수(누적)</h4>
				  <canvas id="myChart3"></canvas>
				</div>
			</div>
			<div style="display: flex;">
				<div class="container " style="padding-top: 100px; width: 500px; height: 400px;">
				  <h4>월별 문의 건</h4>
				  <canvas id="myChart4"></canvas>
				</div>
				<div class="container " style="padding-top: 100px; width: 500px; height: 400px;">
				  <h4>계약 전환 율</h4>
				  <canvas id="myChart5"></canvas>
				</div>
			</div>
		</div>
	</div>	
</div>

</body>


<script type="text/javascript">

	const ctx1 = document.getElementById('myChart1').getContext('2d');
	const ctx2 = document.getElementById('myChart2').getContext('2d');
	const ctx3 = document.getElementById('myChart3').getContext('2d');
	const ctx4 = document.getElementById('myChart4').getContext('2d');
	const ctx5 = document.getElementById('myChart5').getContext('2d');
		
	fetch('/month_sals')
	  .then(response => response.json())
	  .then(data => {
	    console.log(data);
	    
	    const recSum_month = data.map(item => item.recSum_month); 
	    const total_amount = data.map(item => item.total_amount); 
	    
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
	    	  indexAxis: 'y',
	          maintainAspectRatio: false, 
	          scales: {
	            x: {
	            	   min: 0,
	                   max: 400000
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
	    
	    const recSum_quarter = data.map(item => item.recSum_quarter); 
	    const quarter_amount = data.map(item => item.quarter_amount); 
	    
	    console.log(recSum_quarter);
	    console.log(quarter_amount);
	    
	    new Chart(ctx2, {
	      type: 'bar',
	      data: {
	        
	   	  labels: ['1분기','2분기','3분기','4분기'],
          datasets: [
	        {
	          label: '23년 매출액',
	          data: quarter_amount,
	        },
	        {
	          label: '24년 매출액',
	          data: [500000, 450000, 740000, 100000]
	        }
	      ]
	      },
	      options: {
	          maintainAspectRatio: false, // 가로 세로 비율을 유지하지 않음
	          indexAxis: 'y',
	          scales: {
	            y: {
	            	min: 0,
                    max: 1000000
	            }
	          }
	        }
	      });

	    })
	  .catch(error => {
	    console.error('Error fetching data:', error);
	  });
	
	new Chart(ctx3, {
	      type: 'line',
	      data: {
	        
	   	  labels: ['23/04','23/05','23/06','23/07','23/08','23/09','23/10','23/11','23/12','24/01', '24/02', '24/03' ],
        datasets: [
	        {
	          label: '고객 수',
	          data: [0, 4, 10, 6, 8, 5, 12, 2, 7, 6, 10, 13 ]
	        }
	      ]
	      },
	      options: {
	          maintainAspectRatio: false, // 가로 세로 비율을 유지하지 않음
	          scales: {
	            y: {
	            	min: 0,
                    max: 20
	            }
	          }
	        }
	      });
	
	new Chart(ctx4, {
	      type: 'bar',
	      data: {
	        
	   	  labels: ['1월','2월','3월', '4월' ],
      datasets: [
	        {
	          label: '상담 건',
	          data: [5, 13, 11, 2]
	        }
	      ]
	      },
	      options: {
	          maintainAspectRatio: false, // 가로 세로 비율을 유지하지 않음
	          scales: {
	            y: {
	            	min: 0,
                  max: 20
	            }
	          }
	        }
	      });
	
	new Chart(ctx5, {
	      type: 'line',
	      data: {
	        
	   	  labels: ['1월','2월','3월', '4월' ],
    datasets: [
	        {
	          label: '2023년 %',
	          data: [10, 45, 20, 35]
	        },
	        {
	          label: '2024년 %',
	          data: [50, 20, 40, 1]
	        }
	      ]
	      },
	      options: {
	          maintainAspectRatio: false, // 가로 세로 비율을 유지하지 않음
	          scales: {
	            y: {
	            	min: 0,
               		max: 60,
	            },
	            text: '단위: %'
	          }
	        }
	      });
	
</script>
</html>