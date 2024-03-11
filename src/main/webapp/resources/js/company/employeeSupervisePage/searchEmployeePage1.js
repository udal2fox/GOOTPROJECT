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