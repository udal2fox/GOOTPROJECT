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



//사업자 등록증 파일 업로드 버튼에 파일 업로드 기능 추가
function updateFileName() {
    const fileInput = document.getElementById('fileInput'); // 파일 업로드 버튼 
    const fileListElement = document.getElementById('uploadedFileName'); // 파일 목록이 표시될 요소

    if (fileInput.files.length > 0) {
        for (let i = 0; i < fileInput.files.length; i++) {
            const file = fileInput.files[i]; // 파일 객체
            const fileName = file.name; // 파일의 이름
            
            // 파일을 다운로드할 수 있는 링크 생성
            const downloadLink = document.createElement('a');
            downloadLink.href = URL.createObjectURL(file);
            downloadLink.download = fileName; // 다운로드 시 파일명 지정
            downloadLink.textContent = fileName; // 링크 텍스트 설정
            
            // 파일 삭제 이미지 생성
            const deleteImage = document.createElement('img');
            deleteImage.src = '/resources/images/mt-cancel.svg'; // 삭제 이미지 URL 설정
            deleteImage.width = 15;
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


/** 사업자 등록증 파일 업로드 버튼에 파일 업로드 기능 추가 */
function updateFileName() {
    const fileInput = document.getElementById('fileInput');
    const fileNameInput = document.querySelector('input[name="comBizLicenseFile"]');

    if (fileInput.files.length > 0) {
        fileNameInput.value = fileInput.files[0].name;
    }
}


/** 사업자 등록증 파일 db에 업로드 하기 */
function uploadFile() {
    const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];

    const formData = new FormData();
    formData.append('file', file);

    $.ajax({
        url: '/uploadFile',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (fileName) {
            // 서버에서 받은 파일명을 사용하여 필요한 작업을 수행합니다.
            console.log('File uploaded:', fileName);
        },
        error: function (error) {
            console.error('File upload failed:', error.responseText);
        }
    });
}



/** 사업자등록번호 유효 API */
document.getElementById("imgBtnSearchBizNum").addEventListener('click', () => {
    const bizNum = document.querySelector('input[name="comBizNum"]').value;
    console.log(bizNum);
    searchBizNum([bizNum]); // 배열로 감싸서 전달
});

function searchBizNum(bizNumArray) {
	var data = {
	        "b_no": bizNumArray
	    };

    $.ajax({
        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=RcQTidl2gdgS/jYwj9Nwfy1D7bKtcwekloVeGJ+U4NxpCVbVTrc/dueJNvAJoSgWSe9fvIGz/JzX4Y/aOFkkHA==",
        type: "POST",
        data: JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function(result) {
        	alert(JSON.stringify(result, null, 2));
        },
        error: function(result) {
            alert(result.responseText);
        }
    });
}









///** 기업 정보 수정 */
//document.getElementById("companyUpdateBtn").addEventListener('click', () => {
//    
//	//로그인 한 사람의 권한이 영업팀일 경우 수정 권한 있음, 나머지는 수정 권한 없음 (추후)
//	//console.log(f.comCEO.value);
//	companyUpdate();
//});

function companyUpdate(vo,callback){

}

//이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
function backPage() 
{
	window.history.go(-1); // 뒤로 한 페이지 이동
} 






//파일 업로드 버튼에 파일 업로드 기능 추가
//document.getElementById("uploadedFileDownload").addEventListener('click', function() {
//    // 서버로부터 파일 다운로드 URL을 얻어옵니다.
//    fetch('/getCompanyLicenseFileURL')
//        .then(response => response.text())
//        .then(url => {
//            // 서버로부터 받은 파일 다운로드 URL을 사용하여 다운로드 링크를 생성합니다.
//            const downloadLink = document.createElement('a');
//            downloadLink.href = url; // 서버에서 제공한 파일 다운로드 URL
//            downloadLink.download = '${companyVO.comBizLicenseFile}'; // 다운로드 시 파일명 설정
//            downloadLink.click(); // 링크 클릭하여 다운로드 시작
//        })
//        .catch(error => console.error('Error:', error));
//});



function uploadedFileName(comNo){
	
	let jsonData = JSON.stringify(comNo);
	//console.log(jsonData);
	
	fetch('/getCompanyLicenseFileURL',{
			method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: jsonData
	})
    .then(response => response.json())
    .then(url => {
        // 서버로부터 받은 파일 다운로드 URL을 사용하여 다운로드 링크를 생성합니다.
        const downloadLink = document.createElement('a');
        downloadLink.href = url; // 서버에서 제공한 파일 다운로드 URL
        downloadLink.download = '${companyVO.comBizLicenseFile}'; // 다운로드 시 파일명 설정
        downloadLink.click(); // 링크 클릭하여 다운로드 시작
    })
    .catch(error => console.error('Error:', error));
	
};

//기업 정보 update
function updateCompanyView(){
	let result = confirm("기업 정보를 변경하시겠습니까?");
	
	const a = f.comOpenningDate.value;
	//console.log(a);
	
	if(result){
		
		
		f.action='/updateCompany';
		f.submit();
		
		
	}
	
	
	
	
}
