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


// form 객체 가져오기
const f = document.forms[0];



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




//function checkExtension(fileName, fileSize){
//	if(fileSize >= MAX_SIZE){
//		alert("파일 사이즈 초과");
//		return false;
//	}
//	
//	if(regex.test(fileName)){
//		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
//		return false;
//	}
//	return true;
//}
//
//
//document.getElementById("fileInput").addEventListener('click', ()=>{
//	
//	const formData = new FormData();
//	const inputFile = document.querySelector('input[type="file"]');
//	const files = inputFile.files;
//	
//	// file 객체들을 formData에 담기
//	for(let i=0; i<files.length; i++){
//		if(!checkExtension(files[i].name, files[i].size)){
//			return false;
//		}
//		formData.append("uploadFile", files[i]);
//	}
//	
//	console.log(formData);
//	fetch('/uploadAsyncAction', 
//			{
//		method : 'post',
//		body : formData
//		
//			}
//	)
//	.then( response => response.json() )
//	.then( json => {
//		console.log(json)
//		
//		// 부모 Element.replaceChild(newElement, oldElement);
//		uploadDiv.replaceChild(cloneObj.cloneNode(true), uploadDiv.firstElementChild);
//	
//		showUploadedFile(json);
//		
//
//	})
//	.catch(err => console.log(err));
//
//
//})
//









///** 사업자 등록증 파일 db에 업로드 하기 */
//function uploadFile() {
//    const fileInput = document.getElementById('fileInput');
//    const file = fileInput.files[0];
//
//    const formData = new FormData();
//    formData.append('file', file);
//
//    $.ajax({
//        url: '/uploadFile',
//        type: 'POST',
//        data: formData,
//        contentType: false,
//        processData: false,
//        success: function (fileName) {
//            // 서버에서 받은 파일명을 사용하여 필요한 작업을 수행합니다.
//            console.log('File uploaded:', fileName);
//        },
//        error: function (error) {
//            console.error('File upload failed:', error.responseText);
//        }
//    });
//}











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


//데이트 피커 설정
flatpickr.localize(flatpickr.l10ns.ko);

let inputTypeDate = document.querySelector('.inputTypeDate');
inputTypeDate.flatpickr({
    local: 'ko'

});

//이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
function backPage() 
{
	window.history.go(-1); // 뒤로 한 페이지 이동
} 


////파일 업로드
//const dataTransfer = new DataTransfer();
//
//$("#fileInput").change(function(){
//   
//    let fileArr = document.getElementById("fileInput").files
//
//    if(fileArr != null && fileArr.length>0){
//
//      // =====DataTransfer 파일 관리========
//        for(var i=0; i<fileArr.length; i++){
//            dataTransfer.items.add(fileArr[i])
//        }
//        document.getElementById("fileInput").files = dataTransfer.files;
//        console.log("dataTransfer =>",dataTransfer.files)
//        console.log("input FIles =>", document.getElementById("fileInput").files)
//	// ==========================================
//       
//    }
//     
//})


