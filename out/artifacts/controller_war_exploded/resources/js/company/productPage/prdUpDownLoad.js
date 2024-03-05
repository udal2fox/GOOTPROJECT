
document.getElementById("uploadBtn").addEventListener("click", function() {
  document.getElementById("excelUpload").click();
});

// 선택된 파일 이름 표시
document.getElementById("excelUpload").addEventListener("change", function() {
	let input = this;
	let files = input.files;
	let fileName = input.files[0].name;
	console.log(files[0]);
	console.log(input);
	console.log(fileName);
	
	// 파일이 없거나 1개 이상인 경우
    if (files.length !== 1) {
        alert("하나의 파일을 선택해주세요.");
        input.value = '';
        
        return;
    }
    let formData = new FormData();
	formData.append("EXCEL", files[0]);
    
    if(confirm("파일 을 업로드 하시 것슴까!?"))
	{
    	fetch('/prdExcelInput', {
    		  method: 'POST',
    		  body: formData
    		})
    		.then(response => response.text())
    		.then(data => 
    		{
    		  console.log('서버 응답:', data);
    		  if(data === 'success') alert("인풋 성공");
    		  else alert("인풋 실패");
    		  
    		})
    		.catch(error => 
    		{
    		  console.error('오류 발생:', error);
    		  alert("엑셀 업로드 실패!!");
    		});
	}
    else
	{
    	return false;
	}
	
});


// 다운로드 버튼 눌러서 함수호출
document.getElementById('downloadButton').addEventListener('click', ()=>{
	download();
});



function download() 
{
	// 폼데이터에 체크박스 의 벨류를 들고가서 리스트 조회 후 그리스트로 다운받게 끔 변환
    // 상품 분류 체크박스들의 값을 가져옵니다.
    let checkedValues = [];
    
    document.querySelectorAll('input[type=checkbox][data-filter="product-type"]:checked').forEach(function(checkbox) {
        if(checkbox.value != '전체')
		{
        	checkedValues.push(checkbox.value);
		}
    });

    // 상품 상태 체크박스들의 값을 가져옵니다.
    document.querySelectorAll('input[type=checkbox][data-filter="product-status"]:checked').forEach(function(checkbox) {
    	 if(checkbox.value != '전체')
 		{
         	checkedValues.push(checkbox.value);
 		}
    });

	
	
	
    // 서버로 데이터 전송
    fetch('/downloadExcel', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(checkedValues)
    })
    .then(response => response.blob())
    .then(blob =>
    {
        // 엑셀 파일 다운로드	
        const url = window.URL.createObjectURL(new Blob([blob])); 	// Blob 데이터로부터 URL 생성
        const a = document.createElement('a');  					// <a> 요소 생성
        a.href = url;  
        a.download = 'excelTest.xlsx';  							// 다운로드되는 파일의 이름 설정
        document.body.appendChild(a); 								// <a> 요소를 문서에 추가
        a.click();  												// 클릭해서 다운로드 시작
        window.URL.revokeObjectURL(url);  							// URL 객체 해제
        document.body.removeChild(a);  								// <a> 요소를 문서에서 제거
    })
    .catch(error => 
    {
        console.error('Error:', error);
    });
}

