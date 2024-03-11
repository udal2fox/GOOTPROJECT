const f = document.forms[0];

document.getElementById('searchIcon').addEventListener('click', function() {

    // sample6_execDaumPostcode() 함수 실행
    sample6_execDaumPostcode();
	
});

document.querySelectorAll('input[type="button"]').forEach( btn => {
	btn.addEventListener( 'click', (event) => {
		event.preventDefault(); 
		
		let type = btn.id;
		
		if( type === 'closeBtn')close();
		else if( type === 'saveBtn'){
			save();
		}
	})
})

function close(){
	 window.history.back();
}

function save(){
	if( f.ePw.value !== f.checkEPw.value ){
		alert("비밀번호가 일치 하지 않습니다");
		f.checkEPw.focus();
	}
}