/**form 객체 가져오기 */
const f = document.forms[0];


/**각 버튼들 클릭 이벤트 (버튼 분기 태우기) */
//console.log(document.querySelectorAll('.enterpriseListBtns'));
document.querySelectorAll('.companyListBtns').forEach( btn => {

	btn.addEventListener('click', () => {
	
		//눌려진 버튼의 id 가져와서 저장
		let type = btn.id;
		//console.log(type);
		
		if(type === 'searchBarSearchBtn') {
			searchBarSearchResult();
		}else if(type === 'downloadExcelBtn') {
			
		}else if(type === 'moveCompanyRegisterBtn') {
			moveCompanyRegister();
		}
		
	});

});