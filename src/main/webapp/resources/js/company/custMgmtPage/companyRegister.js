//form 객체 가져오기 
const f = document.forms[0];

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







