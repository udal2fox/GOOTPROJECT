
/**form 객체 가져오기 */
const f = document.forms[0];


/**영업 상태 값이 '최초 인입' 에서 다른 값으로 변화된 해당 날짜를 응대일에 자동으로 입력 */
//응대일 요소 가져오기
const csResponseDate = f.querySelector('input[name="csResponseDate"]');
//영업 상태 요소 가져오기
const csStatus = f.querySelector('select[name="csStatus"]');


csStatus.addEventListener('change', function() {
	// 선택된 옵션의 값을 가져오기
	const selectedValue = csStatus.value;
	
	// 현재 날짜 가져오기
	const currentDate = new Date();
	
	// 날짜를 yyyy-MM-dd 형식으로 변환
	const formattedDate = currentDate.toISOString().split('T')[0];
	
	// 최초 인입이 아닌 경우에만 응대일 값 변경
	if (selectedValue !== '최초 인입') {
		csResponseDate.value = formattedDate;
	}
});



///**영업 내용 저장  */
//function saveSales() {
//	
//	//alert(1);
//	//console.log(f.consultNo.value);
//
//	
//	if(f.csEname.value=='') {
//		alert("영업 담당자를 선택하세요.");
//		return;	
//	}
//	
//
//	f.action='/saveSales';
//	f.submit();
//	
//	
//	
//}

document.addEventListener("DOMContentLoaded", function () {
    // 페이지 로드 후 실행될 코드

    // 영업 상태 선택 시 이벤트 처리
    const csStatus = document.getElementById("selectSalesStatus");
    const failReasonDiv = document.getElementById("failReasonDiv");

    // 초기 상태 설정
    if (csStatus.value === "계약 실패") {
        failReasonDiv.style.display = "table"; // 계약 실패일 경우 보이게 설정
    } else {
        failReasonDiv.style.display = "none"; // 다른 상태일 경우 감추기
    }

    // 영업 상태 변경 이벤트 리스너 등록
    csStatus.addEventListener("change", function () {
        if (csStatus.value === "계약 실패") {
            failReasonDiv.style.display = "table"; // 계약 실패일 경우 보이게 설정
        } else {
            failReasonDiv.style.display = "none"; // 다른 상태일 경우 감추기
        }
    });
});




/** 영업 히스토리에서 + 버튼 누르면 영업 히스토리 날짜 와 영업 히스토리 내용 작성란 새로 추가 (최대 5개 까지) */
//let rowNumber = 1;
//
//document.getElementById('imgBtnPlus').addEventListener('click', function() {
//    if (rowNumber < 5) {
//        // 새로운 영업 히스토리 항목 추가
//        let salesHistoryEntry = document.createElement('div');
//        salesHistoryEntry.classList.add('salesHistoryEntry');
//
//        let table = document.createElement('table');
//        table.classList.add('subject_content_tbl');
//
//        // 영업 히스토리 테이블의 내용 생성
//        let newTableRow1 = document.createElement('tr');
//        newTableRow1.innerHTML = `
//            <td colspan="8" style="background-color: #EEEEEE;"></td>
//        `;
//        table.appendChild(newTableRow1);
//
//        let newTableRow2 = document.createElement('tr');
//        newTableRow2.innerHTML = `
//            <td class="tbl_subtitle">날짜</td>
//            <td colspan="8">
//                <input type="date" name="cshDate${rowNumber + 1}" placeholder="영업 날짜 선택" style="width: 150px">
//            </td>
//        `;
//        table.appendChild(newTableRow2);
//
//        let newTableRow3 = document.createElement('tr');
//        newTableRow3.innerHTML = `
//            <td class="tbl_subtitle">내용</td>
//            <td colspan="8">
//                <textarea rows="10" placeholder="영업 내용 입력" style="width: 90%; resize: none" name="cshContent${rowNumber + 1}"></textarea>
//            </td>
//        `;
//        table.appendChild(newTableRow3);
//
//        salesHistoryEntry.appendChild(table);
//        document.querySelector('.space_img_btns').before(salesHistoryEntry);
//
//        rowNumber++;
//    } else {
//        alert('최대 5개의 영업 히스토리 항목까지만 추가할 수 있습니다.');
//    }
//});
//
//document.getElementById('imgBtnMinus').addEventListener('click', function() {
//    if (rowNumber > 1) {
//        // 가장 최근에 추가된 영업 히스토리 항목 제거
//        let lastSalesHistoryEntry = document.querySelector('.space_img_btns').previousElementSibling;
//        lastSalesHistoryEntry.remove();
//
//        rowNumber--;
//    } else {
//        alert('최소 1개의 영업 히스토리 항목이 있어야 합니다.');
//    }
//});

let currentRowNumber = 1;

document.getElementById('imgBtnPlus').addEventListener('click', function() {
    if (currentRowNumber < 5) {
        currentRowNumber++;
        updateSalesHistoryVisibility();
    } else {
        alert('최대 5개의 영업 히스토리 항목까지만 추가할 수 있습니다.');
    }
});

document.getElementById('imgBtnMinus').addEventListener('click', function() {
    if (currentRowNumber > 1) {
        currentRowNumber--;
        updateSalesHistoryVisibility();
    }
});

function updateSalesHistoryVisibility() {
    for (let i = 1; i <= 5; i++) {
        let salesHistoryEntry = document.getElementById(`salesHistoryEntry${i}`);
        if (i <= currentRowNumber) {
            salesHistoryEntry.style.display = 'block';
        } else {
            salesHistoryEntry.style.display = 'none';
        }
    }
}



    // 세션에서 아이디 가져오기
    const sessionId = sessionStorage.getItem('eName');

    // 입력 필드에 아이디 설정
    const csEnameInput = document.querySelector('input[name="csEname"]');
    csEnameInput.value = sessionId;

    //영업 팀장에게만 권한주기
    
//    /** 저장하기 */
//    document.getElementById('saveBtn').addEventListener('click', function() {
//    	alert(1);
//
//       let a=  f.cshDate1.value;
//       console.log(a);
//       
////      let csNo =  f.consultNo.value;
////      console.log(csNo);
//    	if(f.csStatus.value=='최초 인입'){
//    		alert("영업 상태를 수정하세요.")
//    		return;
//    	}
//    	if(f.csResponseDate.value==''){
//    		alert("응대일을 선택하세요.")
//    		return;
//    	}
//    	
//    	if(f.cshDate1.value==''){
//    		alert("영업 히스토리 날짜를 선택하세요.")
//    		return;
//    	}
//    	if(f.cshContent1.value==''){
//    		alert("영업 히스토리 내용을 입력하세요.")
//    		return;
//    	}
//    	
//    	if(f.csStatus.value=='계약 실패' && f.csFailDetailReason.value==''){
//    		alert("계약 실패 상세 사유를 작성해주세요.")
//    		return;
//    	}
//
//    	//f.action='/saveSales';
//    	//f.submit();
//    });
    
    /** 저장하기 */
    document.getElementById('saveBtn').addEventListener('click', function() {
    	alert(1);

      // let a=  f.cshDate1.value;
     //  console.log(a);
       
//      let csNo =  f.consultNo.value;
//      console.log(csNo);
    	if(f.csStatus.value=='최초 인입'){
    		alert("영업 상태를 수정하세요.")
    		return;
    	}
    	if(f.csResponseDate.value==''){
    		alert("응대일을 선택하세요.")
    		return;
    	}
    	
    	if(f.cshDate1.value==''){
    		alert("영업 히스토리 날짜를 선택하세요.")
    		return;
    	}
    	if(f.cshContent1.value==''){
    		alert("영업 히스토리 내용을 입력하세요.")
    		return;
    	}
    	
    	if(f.csStatus.value=='계약 실패' && f.csFailDetailReason.value==''){
    		alert("계약 실패 상세 사유를 작성해주세요.")
    		return;
    	}

    	f.action='/saveSales';
    	f.submit();
    });
    