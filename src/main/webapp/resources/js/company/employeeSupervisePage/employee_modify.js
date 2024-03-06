/*// ----- css 파일 추가
// 1. 파일 경로 설정
const CSS_FILE_PATH = '/resources/css/employeeSupervisePage/employee_modify.css';
// 2. link 태그 생성
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.type = 'text/css';
linkEle.href = CSS_FILE_PATH;
// 3. head 태그에 link 엘리먼트 추가
document.head.appendChild(linkEle);*/

<<<<<<< HEAD
=======
const f = document.forms[0];

>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
document.querySelectorAll('input[type="button"]').forEach( btn => {
	btn.addEventListener( 'click', (event) => {
		event.preventDefault(); 
		
		let type = btn.id;
		
		if( type === 'closeBtn') close();
		else if ( type === 'saveBtn'){
<<<<<<< HEAD
			
=======
			update(f);
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
		}
	})
})

function close(){
	location.href = '/searchEmployee';
}
<<<<<<< HEAD
=======

function update(f){

	 console.log(f);
	 f.action = '/employee_modify';
	 f.submit();
}
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
