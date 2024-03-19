const f = document.forms[0];

// 주소 API 실행 
document.getElementById('searchIcon').addEventListener('click', function() {

    // sample6_execDaumPostcode() 함수 실행
    sample6_execDaumPostcode();
	
});


// 프로필 사진 편집
document.getElementById('img-change').addEventListener('click', function() {
	  const imgUpload = document.getElementById('img-upload');
	  
	    if (imgUpload) {
	        // 파일 탐색기 열기
	        imgUpload.click();
	    } else {
	        console.error("img-upload element not found.");
	    }
	});

document.getElementById('img-upload').addEventListener('change', function() {
    const file = this.files[0]; // 선택한 파일 객체 가져오기
    const reader = new FileReader(); // 파일을 읽기 위한 객체 생성
    
    const fileName = file.name; // 파일명 가져오기

    reader.onload = function(event) {
        const imgData = event.target.result; // 이미지 데이터 base64 가져오기
        
        
        document.querySelector('input[name="profilePicture"]').value = file.name;

        // 이미지 요소 생성
        const img = document.createElement('img');
        img.src = imgData;
        img.width = 302;
        img.height = 152;
        
        // 이미지 표시 영역에 새로운 이미지 추가
        const profileImgDiv = document.getElementById('profile-img');
        profileImgDiv.innerHTML = ''; // 기존 내용 지우기
        profileImgDiv.appendChild(img);
    };
    // 파일을 읽어 데이터 base64로 변환
    reader.readAsDataURL(file); 
    
    this.value = '';
});


// 프로필 사진만 저장
document.getElementById('img-save').addEventListener('click', function() {
	const profilePicture = f.profilePicture.value;
    console.log(profilePicture);
})



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
		return; 
	}

	console.log(typeof(f.ePw.value));
	 console.log('프로필 수정 요청 데이터:', JSON.stringify({
		    eno: f.eno.value,
		    deptNo: f.deptNo.value,
		    eName : f.eName.value,
		    ePhone: f.ePhone.value,
		    ePw: f.ePw.value,
		    eAddr: f.eAddr.value,
		    eAddr2: f.eAddr2.value,
		    salAccount: f.salAccount.value,
		    eBank: f.eBank.value,
		}));
	 
	 var requestData = {
			 eno: f.eno.value,
			 deptNo: f.deptNo.value,
			 eName : f.eName.value,
			 ePhone: f.ePhone.value,
			 ePw: f.ePw.value,
			 eAddr: f.eAddr.value,
			 eAddr2: f.eAddr2.value,
			 salAccount: f.salAccount.value,
			 eBank: f.eBank.value,
	 };
    fetch("/profile_modify", {
        method: 'POST',
        body: JSON.stringify(requestData),
        headers: {
            "Content-type": "application/json; charset=UTF-8",
        }
    })
	.then((response) => {
		
		if(response.ok){ 
			// 요청이 성공하면 처리
			alert('프로필 수정이 완료되었습니다.');
			f.checkEPw.value = '';  
			location.reload();
		}else {
        	// 요청이 실패하면 에러 처리
        	console.error('프로필 수정에 실패했습니다.');
            // 에러 메시지 출력
          response.json().then((error) => {
          console.error('에러 메시지:', error.message);
          })
		}
	})	
	.then((data) => {
		
	})	
	.catch( err => {
		// 에러 처리
		console.log('Fetch error:', err);
		// 에러 메시지 출력
		console.log('Error message:', err.message);
	});
};		