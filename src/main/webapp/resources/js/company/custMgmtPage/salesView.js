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

/** 공통 부분 끝*/


/**영업 상태 값이 '최초 인입' 에서 다른 값으로 변화된 해당 날짜를 응대일에 자동으로 입력 */
const csResponseDate = f.querySelector('input[name="csResponseDate"]');
const csStatus = f.querySelector('select[name="csStatus"]');

csStatus.addEventListener('change', function() {

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

/**영업 상태 값이 '계약 실패' 일 때만 계약 실패 사유, 계약 실패 상세사유란 보이게 하기*/
document.addEventListener("DOMContentLoaded", function () {

    const csStatus = document.getElementById("selectSalesStatus");
    const failReasonDiv = document.getElementById("failReasonDiv");

    // 초기 상태 설정
    if (csStatus.value === "계약 실패") {
        failReasonDiv.style.display = "table"; 
    } else {
        failReasonDiv.style.display = "none"; 
    }

    csStatus.addEventListener("change", function () {
        if (csStatus.value === "계약 실패") {
            failReasonDiv.style.display = "table"; 
        } else {
            failReasonDiv.style.display = "none"; 
        }
    });
});


/** 영업 히스토리에서 + 버튼 누르면 영업 히스토리 날짜 와 영업 히스토리 내용 작성란 새로 추가 (최대 5개 까지) */
let currentRowNumber = 0;

document.getElementById('imgBtnPlus').addEventListener('click', function() {
    if (currentRowNumber < 4) {
        currentRowNumber++;
        updateSalesHistoryVisibility();
    } else {
        alert('최대 5개의 영업 히스토리 항목까지만 추가할 수 있습니다.');
    }
});

document.getElementById('imgBtnMinus').addEventListener('click', function() {
    if (currentRowNumber > 0) {
        currentRowNumber--;
        updateSalesHistoryVisibility();
    } else {
        alert('최소 1개의 영업 히스토리 항목이 필요합니다.');
    }
});

function updateSalesHistoryVisibility() {
    let salesHistoryEntries = document.getElementsByClassName('salesHistoryEntry');
    for (let i = 0; i < salesHistoryEntries.length; i++) {
        if (i < currentRowNumber) {
            salesHistoryEntries[i].style.display = 'block';
        } else {
            salesHistoryEntries[i].style.display = 'none';
        }
    }
}


function updateSalesHistoryVisibility() {
    let salesHistoryEntries = document.getElementsByClassName('salesHistoryEntry');
    for (let i = 0; i < salesHistoryEntries.length; i++) {
        if (i < currentRowNumber) {
            salesHistoryEntries[i].style.display = 'block';
        } else {
            salesHistoryEntries[i].style.display = 'none';
        }
    }
}




/** 영업 담당자에 세션에 저장된 이름 할당하기 */
    const sessionId = sessionStorage.getItem('eName');
    
    const csEnameInput = document.querySelector('input[name="csEname"]');
    const selectSalesStatus = document.getElementById('selectSalesStatus');

    // 영업 상태가 '최초 인입'인 경우에만 세션 ID 할당
    if (selectSalesStatus.value === '최초 인입') {
        csEnameInput.value = sessionId;
    } 


    /** 내용 저장 및 수정 하기 */   
    document.getElementById('saveBtn').addEventListener('click', function() {
    	alert(1);
        if (f.csEname.value === '') {
            alert("영업 담당자를 선택하세요.");
            return;
        }
        
        if (f.csStatus.value === '최초 인입') {
            alert("영업 상태를 수정하세요.");
            return;
        }
        
        if (f.csResponseDate.value === '') {
            alert("응대일을 선택하세요.");
            return;
        }
        
        if (f.cshDate1.value === '') {
            alert("영업 히스토리 날짜를 선택하세요.");
            return;
        }
        
        if (f.cshContent1.value === '') {
            alert("영업 히스토리 내용을 입력하세요.");
            return;
        }
        
        if (f.csStatus.value === '계약 실패' && f.csFailDetailReason.value === '') {
            alert("계약 실패 상세 사유를 작성해주세요.");
            return;
        }
        
        console.log(document.getElementsByName("consultHistoryNo")[0].value);
        console.log(f.csEname.value);
        console.log(f.csStatus.value);
        console.log(f.csResponseDate.value);
        console.log(f.cshDate1.value);
        console.log(f.cshContent1.value);
        console.log(f.cshDate2.value);
        console.log(f.cshContent2.value);

        
        f.action = "/saveSales";
        f.submit();
    });