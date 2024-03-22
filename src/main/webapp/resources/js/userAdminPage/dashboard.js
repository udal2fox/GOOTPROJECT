fetch("/userAdminPage/getMonthlyData/" + sessionStorage.getItem("Okja"))
    .then(response => response.json())
    .then(data => {
        // 데이터 파싱 및 처리
        const monthlyData = data;

        // 차트 생성
        const ctx = document.getElementById('monthlyChart').getContext('2d');
        const labels = monthlyData.map(item => `${item.year}년 ${item.month}월`).reverse(); // 역순으로 정렬
        const values = monthlyData.map(item => item.total_recSum); // 월별 합계

        const monthlyChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: '월별 합계',
                    data: values,
                    backgroundColor: 'rgba(255, 99, 132, 1)', // 분홍색
                    borderRadius: 10, // 막대 둥글게 만들기
                    barThickness: 25
                }]
            },
            options: {
                scales: {
                    y: {
                        display: true, // y축 표시
                        grid: {
                            display: true // 가로 경계선 표시
                        },
                        ticks: {
                            callback: function(value, index, values) {
                                return (value / 10000) + '만원'; // y축 값 포맷 변경
                            }
                        }
                    },
                    x: {
                        display: true, // x축 표시
                        grid: {
                            display: false // 세로 경계선 숨기기
                        }
                    }
                },
                plugins: {
                    datalabels: {
                        anchor: 'end',
                        align: 'top',
                        formatter: function(value, context) {
                            return (value / 10000) + '만원'; // 막대 위에 표시할 값 포맷 변경
                        },
                        font: {
                            weight: 'bold', // 글자 진하게
                            color: 'black' // 글자 색상
                        }
                    }
                }
            }
        });
    })
    .catch(error => {
        console.error('Error fetching monthly data:', error);
    });
