/** 공통 부분 시작*/

//데이트피커 
let datePickAll = document.querySelectorAll('input[type="date"]');
datePickAll.forEach(function(input) {
	flatpickr(input, {
		locale: 'ko'
	});
});


//css 파일 동적 바인딩
const CSS_FILE_PATH = ['/resources/css/company/custMgmtPage/companyMgmt.css','/resources/css/company/custMgmtPage/companyMgmtModal.css' ];
cssBinding(CSS_FILE_PATH);
function cssBinding(cssFiles) {
	cssFiles.forEach(css => {
		
		//2. link 태그 생성
		let linkEle = document.createElement('link');
		linkEle.rel = 'stylesheet';
		linkEle.type = 'text/css';
		linkEle.href = css;
		
		
		//3.  head 태그에 link 엘리먼트 추가 (여기서 head 태그에 동적으로 바인딩 된다)
		document.head.appendChild(linkEle);
	})

}	
//form 객체 가져오기 
const f = document.forms[0];


//이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
function backPage() 
{
	window.location = document.referrer;
} 







/** 공통 부분 끝*/


	/** 도로명 주소 팝업창 (API)   */
	function openAddressPopup() {
		
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
			    const comAddrInput = document.querySelector('input[name="comAddr"]');
			    const comAreaInput = document.querySelector('input[name="comArea"]');
			    //console.log(comAddrInput);


				if(data.userSelectedType==='R') { //R은 도로명 주소 클릭 시 
					comAddrInput.value = data.roadAddress;
					
				}else { //지번 주소 클릭 시
					comAddrInput.value =data.jibunAddress;
				}
				
				comAreaInput.value = data.sido;
			}
		}).open();
		

	}
	
//사업자 등록증 파일 업로드 버튼에 파일 업로드 기능 추가
function updateFileName() {
    const fileInput = document.getElementById('fileInput'); 
    const fileListElement = document.getElementById('uploadedFileName'); 

    if (fileInput.files.length > 0) {
        for (let i = 0; i < fileInput.files.length; i++) {
            const file = fileInput.files[i]; 
            const fileName = file.name; 
            
            // 파일을 다운로드할 수 있는 링크 생성
            const downloadLink = document.createElement('a');
            downloadLink.href = URL.createObjectURL(file);
            downloadLink.download = fileName; // 다운로드 시 파일명 지정
            downloadLink.textContent = fileName; // 링크 텍스트 설정
            
            // 파일 삭제 이미지 생성
            const deleteImage = document.createElement('img');
            deleteImage.src = '/resources/images/mt-cancel.svg'; // 삭제 이미지 URL 설정
            deleteImage.style.width = '15px'; // 삭제 이미지 크기 조정
            deleteImage.style.height = '15px'; // 추가: 이미지 높이도 조정
            deleteImage.style.cursor = 'pointer'; // 마우스 커서를 포인터로 변경
            
            // 파일 삭제 이벤트 리스너 추가
            deleteImage.addEventListener('click', function() {
                // 해당 파일 항목 삭제
                fileItem.remove();
            });
            
            // 파일명과 다운로드 링크를 담는 div 요소 생성
            const fileItem = document.createElement('div');
            fileItem.className = 'file-item'; // 파일 아이템에 클래스 추가
            fileItem.appendChild(deleteImage);
            fileItem.appendChild(downloadLink);
            
            // 파일 항목을 파일 목록 요소에 추가
            fileListElement.appendChild(fileItem);
        }
    }
}



/** 사업자등록번호 유효 API */
document.getElementById("imgBtnSearchBizNum").addEventListener('click', () => {
    const bizNum = document.querySelector('input[name="comBizNum"]').value;
   // console.log(bizNum);
    searchBizNum(bizNum); // 배열로 감싸서 전달
});

function searchBizNum(bizNumArray) {
	console.log(bizNumArray);
	var data = {
	        "b_no": [bizNumArray]
	    };

    $.ajax({
        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=RcQTidl2gdgS/jYwj9Nwfy1D7bKtcwekloVeGJ+U4NxpCVbVTrc/dueJNvAJoSgWSe9fvIGz/JzX4Y/aOFkkHA==",

        type: "POST",
        data: JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function(result) {
        	alert(result);
        	alert(result.data);
        },
        error: function(result) {
            alert(result.responseText);
        }
    });
}


/** 기업 등록 */
document.getElementById("companyRegisterInsertBtn").addEventListener('click', () => {
    
	//로그인 한 사람의 권한이 영업팀일 경우 수정 권한 있음, 나머지는 수정 권한 없음 (추후)
	//console.log(f.comCEO.value);
	companyInsert();
});


function companyInsert(){
	
	//alert("기업 등록");
	
	const companyInsertForm=document.getElementById("companyRegisterForm");
	
	//console.log(companyInsertForm);
	
   companyInsertForm.submit();

	
}



