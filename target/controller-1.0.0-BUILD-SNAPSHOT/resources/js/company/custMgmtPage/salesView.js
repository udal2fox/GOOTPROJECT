
/**form 객체 가져오기 */
const f = document.forms[0];

/**각 버튼들 클릭 이벤트 (버튼 분기 태우기) */
//console.log(document.querySelectorAll('.salesViewBtns'));
document.querySelectorAll('.salesViewBtns').forEach( btn => {

	btn.addEventListener('click', () => {
	
		//눌려진 버튼의 id 가져와서 저장
		let type = btn.id;
		//console.log(type);
		
		if(type === 'imgBtnSearchEname') {
			searchEname();
		}else if(type === 'imgBtnPlus') {
			addcnslHis();
		}else if(type === 'imgBtnMinus') {
			
		}else if(type === 'saveBtn') {
			saveSales();
		}
		
	});

});

/**영업 상태 값이 '최초 인입' 에서 다른 값으로 변화된 해당 날짜를 응대일에 자동으로 입력 */
//응대일 요소 가져오기
const csResponseDate = f.querySelector('input[name="csResponseDate"]');
//영업 상태 요소 가져오기
const selectSalesStatus = f.querySelector('select[name="selectSalesStatus"]');

selectSalesStatus.addEventListener('change', function() {
	// 선택된 옵션의 값을 가져오기
	const selectedValue = selectSalesStatus.value;
	
	// 현재 날짜 가져오기
	const currentDate = new Date();
	
	// 날짜를 yyyy-MM-dd 형식으로 변환
	const formattedDate = currentDate.toISOString().split('T')[0];
	
	// 최초 인입이 아닌 경우에만 응대일 값 변경
	if (selectedValue !== '최초 인입') {
		csResponseDate.value = formattedDate;
	}
});

/** 영업 히스토리에서 + 버튼 누르면 영업 히스토리 날짜 와 영업 히스토리 내용 작성란 새로 추가 (최대 5개 까지) */


function addcnslHis() {
	
	let msg = '';

	msg += '<tr>'
		msg +='<td class="tbl_subtitle">날짜 </td>'
			msg +='<td colspan="8"><input type="date" name="cnslHisCnt1Dt"></td>'
				msg +='</tr>'
					msg +='<tr>'
						msg +='<td class="tbl_subtitle">내용</td>'
							msg +='<td colspan="8">'
								msg +='<textarea rows="10"  style="width: 90%; resize: none" name="cnslHisCnt1"></textarea>'
									msg +='</td>'
										msg +='</tr>'
	fileList.innerHTML = msg;
	
	
	
	
	
}












/**영업 내용 저장  */
function saveSales() {
	
	//alert(1);
	//console.log(f.cnslNo.value);

	
	if(f.cnslEname.value=='') {
		alert("영업 담당자를 선택하세요.");
		return;	
	}
	if(f.cnslRespDt.value==''){
		alert("응대일을 선택하새요.");
		return;
	}
	if(f.cnslHisCnt1Dt.value==''){
		alert("영업 히스토리 날짜를 선택하세요.");
		return;
	}
	if(f.cnslHisCnt1.value==''){
		alert("영업 히스토리 내용을 작성하세요.");
		return;
	}
	
	
	
	
	f.action='/saveSales';
	f.submit();
	
	
	
}






