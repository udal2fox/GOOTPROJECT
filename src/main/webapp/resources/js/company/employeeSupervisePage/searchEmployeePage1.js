document.querySelectorAll('button').forEach( btn => {
	btn.addEventListener( 'click', (event) => {
		event.preventDefault(); 
		
		let type = btn.id;
		
		if( type === 'insertBtn') insert();
		else if ( type === 'excelBtn'){
			download();
		}
	})
})

function insert(){
	
	location.href = '/employee_insert';
}

// 사번으로 직원 정보 조회  클릭 이벤트
document.querySelectorAll('tbody a').forEach(a => {
	a.addEventListener('click', function(e){
		e.preventDefault();
		
		let eno = a.getAttribute('href');
		// 부서번호로 인사팀 아닐 시 경고창
		let deptNo = sessionStorage.getItem("deptNo");
		
		if (deptNo !== "1") { 
            alert("권한이 없습니다."); 
            return;
        }else{
        	location.href = '/employee_modify?eno=' + eno;
        }
	});
});

// 인사팀 아닐 시 버튼 숨기기
const insertBtn = document.getElementById("insertBtn");
let deptNo = sessionStorage.getItem("deptNo");
if (deptNo !== "1") {
 insertBtn.style.display = "none"; // 버튼 숨기기
}

function download(){

	let empdto = {
			"keyword" : document.querySelector('.searchBar').value,
			"dName" : document.querySelector('.dept-sb').value
	};
	console.log(typeof document.querySelector('.dept-sb').value);

	console.log(empdto);
	
	// 서버로 데이터 전송하기
	fetch('/excelDown', {
		method : 'POST',
		headers : { 'Content-Type' : 'application/json' },
		body : JSON.stringify(empdto)
	})
	.then(response => response.blob())
	.then(blob => 
	{
		console.log(blob);
		
		// 엑셀로 다운로드
		const url = window.URL.createObjectURL(new Blob([blob]));   // Blob 데이터로부터 URL 생성
		const a = document.createElement('a');						// <a> 요소 생성
		a.href = url;
		a.download = 'excelTest.xlsx';								// 다운로드되는 파일의 이름 설정
		document.body.appendChild(a);								// <a> 요소를 문서에 추가
		a.click();													// 클릭해서 다운로드 시작
		window.URL.revokeObjectURL(url);							// URL 객체 해제
		document.body.removeChild(a);								// <a> 요소를 문서에서 제거
	})
		.catch(error => 
	{
		console.error('Error : ', error);
	});
}