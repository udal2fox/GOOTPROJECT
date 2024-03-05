
// ----- css 파일 추가
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/company/employeeSupervisePage/searchEmployeePage.css';
// 2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.type = 'text/css';
linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
document.head.appendChild(linkEle);


document.querySelectorAll('button').forEach( btn => {
	btn.addEventListener( 'click', (event) => {
		event.preventDefault(); 
		
		let type = btn.id;
		
		if( type === 'insertBtn') insert();
		else if ( type === 'execelBtn'){
			
		}
	})
})

function insert(){
	
	location.href = '/employee_insert';
}


//페이지 버튼 클릭 이벤트
document.querySelectorAll('tbody a').forEach(a => {
	a.addEventListener('click', function(e){
		e.preventDefault();
		
		let eno = a.getAttribute('href');
		
		location.href = '/employee_modify?eno=' + eno;
	});
});


