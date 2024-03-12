const f = document.forms[0];

document.getElementById('searchIcon').addEventListener('click', function() {

    // sample6_execDaumPostcode() 함수 실행
    sample6_execDaumPostcode();
	
});

document.getElementById('img-change').addEventListener('click', function() {
	  const imgUpload = document.getElementById('img-upload');
	  const profileImgDiv = document.getElementById('profile-img'); 
	  if (profileImgDiv != null) {
		  profileImgDiv.innerHTML = '';
        // 파일 탐색기 열기
        imgUpload.click();
    } else {
    	console.error("img-upload element not found.");
    }
});

document.getElementById('img-upload').addEventListener('change', function() {
    const file = this.files[0]; // 선택한 파일 객체 가져오기
    const reader = new FileReader(); // 파일을 읽기 위한 객체 생성

    reader.onload = function(event) {
        const imgSrc = event.target.result; // 이미지 데이터 URL 가져오기

        // 이미지 요소 생성
        const img = document.createElement('img');
        img.src = imgSrc;
        img.width = 302;
        img.height = 152;
        
        // 이미지 표시 영역에 새로운 이미지 추가
        const profileImgDiv = document.getElementById('profile-img');
        profileImgDiv.innerHTML = ''; // 기존 내용 지우기
        profileImgDiv.appendChild(img);
        
        const imgUpload = document.getElementById('img-upload');
        if (imgUpload) {
            const newInput = imgUpload.cloneNode(true);
            imgUpload.parentNode.replaceChild(newInput, imgUpload);
        } else {
            console.error("img-upload element not found.");
        }
    };
    reader.readAsDataURL(file); // 파일을 읽어 데이터 URL로 변환
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

