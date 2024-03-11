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
		
		location.href = '/employee_modify?eno=' + eno;
	});
});