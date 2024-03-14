


// 다운로드 버튼 눌러서 함수호출
document.getElementById('downloadButton').addEventListener('click', ()=>{
	download();
});



function download() 
{
	// 폼데이터에 체크박스 의 벨류를 들고가서 리스트 조회 후 그리스트로 다운받게 끔 변환
    // 상품 분류 체크박스들의 값을 가져옵니다.
    let checkedValues = [];
    
    document.querySelectorAll('input[type=checkbox][data-filter="td-Business"]:checked').forEach(function(checkbox) {
        if(checkbox.value != '전체')
		{
        	checkedValues.push(checkbox.value);
		}
    });

    // 상품 상태 체크박스들의 값을 가져옵니다.
    document.querySelectorAll('input[type=checkbox][data-filter="td-calculate"]:checked').forEach(function(checkbox) {
    	 if(checkbox.value != '전체')
 		{
         	checkedValues.push(checkbox.value);
 		}
    });
    
    console.log(checkedValues);

		
    // 서버로 데이터 전송
    fetch('/ucComDown', {
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

