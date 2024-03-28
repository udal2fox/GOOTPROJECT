/** 공통 부분 시작*/

//데이트피커 
let datePickAll = document.querySelectorAll('input[type="date"]');
datePickAll.forEach(function(input) {
	flatpickr(input, {
		locale: 'ko'
	});
});


//form 객체 가져오기
const f = document.forms[0];

//css 파일 동적으로 바인딩
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

//이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
function backPage() 
{
	window.history.go(-1); // 뒤로 한 페이지 이동
} 


/** 공통 부분 끝*/







/** 해지 처리자, 해지 사유, 상세 사유   */	
$(document).ready(function() {
    // 활동 여부 선택 상자의 변경 이벤트를 모니터링
    $('select[name="spStatus"]').change(function() {
        var selectedStatus = $(this).val();

        // "해지" 상태인 경우 필드를 표시하고 다른 상태에서는 숨김
        if(selectedStatus === '해지') {
            $('.termination-fields').show(); // 필드를 표시
        } else {
            $('.termination-fields').hide(); // 필드를 숨김
        }
    });

    // 페이지 로드시 초기 상태에 따라 필드 표시/숨김 설정
    var initialStatus = $('select[name="spStatus"]').val();
    if(initialStatus === '해지') {
        $('.termination-fields').show();
    } else {
        $('.termination-fields').hide();
    }
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


function downloadFile(filePath) {
    // 파일 다운로드를 위한 URL 생성
    var downloadUrl = '/download?filePath=' + filePath; // 다운로드를 처리하는 서버의 엔드포인트 URL을 적어주세요.

    // 임시 링크 생성
    var link = document.createElement('a');
    link.href = downloadUrl;

    // 파일 다운로드를 위한 설정
    link.setAttribute('download', '');
    document.body.appendChild(link);
    
    // 클릭 이벤트를 발생시켜 파일 다운로드를 시작합니다.
    link.click();

    // 임시 링크 삭제
    document.body.removeChild(link);
}


document.getElementById('fileInput').addEventListener('change', function(event) {
    const fileList = event.target.files;
    console.log('Selected file:', fileList[0].name);

    // 선택한 파일 정보를 vo 객체에 저장
    f.spAgreementFile.value = fileList[0].name;
});


//상태 변경 날짜
function updateChangeDate(status) {
    if (status === '활동') {
        // 활동인 경우, spChangeDate를 비웁니다.
        document.getElementById('spChangeDate').value = '';
    } else {
        // 활동이 아닌 경우, 현재 날짜를 입력합니다.
        var currentDate = new Date();
        var formattedDate = currentDate.getFullYear() + '-' + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' + ('0' + currentDate.getDate()).slice(-2);
        document.getElementById('spChangeDate').value = formattedDate;
    }
}

/** 지점 정보 수정 */
document.getElementById("spotUpdateBtn").addEventListener('click', () => {
    // FormData 객체 생성
    const formData = new FormData();
    
    // 파일 정보 추가
    const newFile = document.getElementById('fileInput').files[0];
    formData.append('newFile', newFile);
    
    // 나머지 정보 추가
    formData.append('companyNo', f.companyNo.value);
    formData.append('spAddr', f.spAddr.value);
    formData.append('spDetailAddr', f.spDetailAddr.value);
    formData.append('spContact', f.spContact.value);
    formData.append('spAgreementDate', f.spAgreementDate.value);
    formData.append('spAgreementTerm', f.spAgreementTerm.value);
    formData.append('spAutoExtension', f.spAutoExtension.value);
    formData.append('spBdgt', f.spBdgt.value);
    formData.append('spEmpNum', f.spEmpNum.value);
    formData.append('spPayMethod', f.spPayMethod.value);
    formData.append('userName', f.userName.value);
    formData.append('userContact', f.userContact.value);
    formData.append('userEmail', f.userEmail.value);

    // Ajax를 사용하여 서버로 데이터 전송
    $.ajax({
        url: '/spotUpdate', // 업데이트를 처리하는 서버의 엔드포인트 URL을 적어주세요.
        type: 'POST',
        data: formData,
        processData: false, // processData를 false로 설정하여 FormData 객체를 변환하지 않도록 합니다.
        contentType: false, // contentType을 false로 설정하여 기본 contentType을 사용하지 않도록 합니다.
        success: function(response) {
            // 서버로부터의 응답 처리
            console.log(response);
            alert('업데이트가 성공적으로 완료되었습니다.');
        },
        error: function(xhr, status, error) {
            // 에러 처리
            
            alert('업데이트 중 오류가 발생하였습니다.');
        }
    });
});
