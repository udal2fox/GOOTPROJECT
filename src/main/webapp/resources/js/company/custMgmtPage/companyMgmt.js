/**form 객체 가져오기 *//*
const f = document.forms[0];


*//**각 버튼들 클릭 이벤트 (버튼 분기 태우기) *//*
//console.log(document.querySelectorAll('.companyListBtns'));
document.querySelectorAll('.companyListBtns').forEach( btn => {

	btn.addEventListener('click', () => {
	
		//눌려진 버튼의 id 가져와서 저장
		let type = btn.id;
		//console.log(type);
		
		if(type === 'searchBarSearchBtn') {
			searchBarSearchResult();
		}else if(type === 'downloadExcelBtn') {
			
		}else if(type === 'moveCompanyRegisterBtn') {
			
		}
		
	});

});
*/




/**----------------------서치바 관련------------------------ */


function searchBarSearchResult(){
	
	//키워드 요소 가져오기
	const searchBarKeword = f.querySelector('input[name="searchBarKeword"]').value;
	
	//지역 요소 가져오기
	const area = f.querySelector('input[name="area"]').value;
	
	//기업 구분 요소 가져오기
	const bizType = f.querySelector('input[name="bizType"]').value;
	
	//업태 요소 가져오기
	const searchBarBizStatus = f.querySelector('select[name="searchBarBizStatus"]').value;
	
	
	console.log(searchBarKeword);
	console.log(area);
	console.log(bizType);
	console.log(searchBarBizStatus);
	
	
	
	
}




/** 'companyList.jsp' 에서 기업 번호 클릭 시 'companyView.jsp'로 값 보내기  */
document.querySelectorAll("tbody a").forEach(aEle => {
	aEle.addEventListener('click', function(e){
		e.preventDefault();
		
	/*	let companyNo = this.getAttribute("href");
		
		console.log(companyNo);*/


		
		location.href = '/companyView';
		
	})
})

document.getElementById("moveCompanyRegisterBtn").addEventListener('click', ()=>{
	
	location.href = '/companyRegister';
})
