// form 객체 가져오기
const f = document.forms[0];






const CSS_FILE_PATH = ['/resources/css/company/custMgmtPage/spotMgmt.css','/resources/css/company/custMgmtPage/spotMgmtModal.css' ];
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

let datePickAll = document.querySelectorAll('input[type="date"]');
datePickAll.forEach(function(input) {
    flatpickr(input, {
        locale: 'ko'
    });
});




/** 도로명 주소 팝업창 (API)   */
function openAddressPopup() {
	
	new daum.Postcode({
		oncomplete: function(data) {
			console.log(data);
		    const spAddrInput = document.querySelector('input[name="spAddr"]');


			if(data.userSelectedType==='R') { //R은 도로명 주소 클릭 시 
				spAddrInput.value = data.roadAddress;
				
			}else { //지번 주소 클릭 시
				spAddrInput.value =data.jibunAddress;
			}
			
		}
	}).open();
	

}

//이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
function backPage() 
{
	window.history.go(-1); // 뒤로 한 페이지 이동
} 


//계약서 파일 업로드 버튼에 파일 업로드 기능 추가
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
            deleteImage.width = 5;
            deleteImage.style.cursor = 'pointer'; // 마우스 커서를 포인터로 변경
            
            // 파일 삭제 이벤트 리스너 추가
            deleteImage.addEventListener('click', function() {
                // 해당 파일 항목 삭제
                fileItem.remove();
            });
            
            // 파일명과 다운로드 링크를 담는 div 요소 생성
            const fileItem = document.createElement('div');
            fileItem.className = 'file-item'; // 파일 아이템에 클래스 추가
            fileItem.appendChild(downloadLink);
            fileItem.appendChild(deleteImage);
            
            // 파일 항목을 파일 목록 요소에 추가
            fileListElement.appendChild(fileItem);
        }
    }
}

document.getElementById('fileInput').addEventListener('change', function(event) {
    const fileList = event.target.files;
    console.log('Selected file:', fileList[0].name);

    // 선택한 파일 정보를 vo 객체에 저장
    f.spAgreementFile.value = fileList[0].name;
});

/** 지점 등록 */
document.getElementById("spotRegisterInsertBtn").addEventListener('click', () => {
    alert(1);
    
    // JavaScript를 사용하여 폼 요소에 접근
    const companyNoInput = document.querySelector('input[name="companyNo"]');

    // 히든 입력란의 값을 가져와서 콘솔에 출력
    console.log('Company Number:', companyNoInput.value);
    console.log(f.comName.value);
    console.log(f.companyNo.value );
    console.log(f.spAddr.value );
    console.log(f.spDetailAddr.value );
    console.log(f.spContact.value );
    console.log(f.spAgreementFile.value ); // 파일명 출력
    console.log(f.file.value );
    console.log(f.spAgreementDate.value );
    console.log(f.spAgreementTerm.value);
    console.log(f.spAutoExtension.value );
    console.log(f.spBdgt.value );
    console.log(f.spEmpNum.value);
    console.log(f.spPayMethod.value );
    console.log(f.userName.value );
    console.log(f.userContact.value );
    console.log(f.userEmail.value);
    
    f.action='/spotRegisterInsert';
    f.submit();
});
