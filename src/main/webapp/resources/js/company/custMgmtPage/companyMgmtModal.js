/** --------------------기업명 찾기 모달창 시작------ */

var searchCompanyModal = document.getElementById('searchCompany_modal');
var openSearchCompanyModalBtn = document.getElementById('open_searchCompany_modal');
var closeSearchCompanyModalBtn = document.getElementById('close_searchCompany_modal');

//기업명 찾기 모달창 열기 
openSearchCompanyModalBtn.onclick = function() {
	searchCompanyModal.style.display = 'block';
	}

//기업명 찾기 모달창 닫기 
closeSearchCompanyModalBtn.onclick = function() {
	searchCompanyModal.style.display = 'none';
}

//기업명 찾기 모달창 닫기 (딴 곳 누를 시)
window.onclick = function(event) {
  if (event.target === searchCompanyModal) {
	  searchCompanyModal.style.display = 'none';
  }
}

//기업명 찾기 및 기업명 변경(모달창)
document.getElementById("imgBtnSearchComName").addEventListener('click', function() {
	//기업명 찾기 검색란 값 비우기
	document.querySelector('input[name="companyName"]').value = ''
    // 모달 창 열기
    let modal = document.getElementById('open_searchCompany_modal');
    modal.style.display = "block";
    
    // 기업명 리스트 가져오기
    fetch('/searchModal')
    .then(response => response.json())
    .then(json => {
      //  console.log("계약 완료된 기업 리스트 불러오기: ", json); 
        
        let msg = '';
        if (json.length > 0) {
            json.forEach(item => {
                msg += `
                    <tr class="list">
                        <td><a href="#" class="companyLink" data-company="${item.csCompanyName}">${item.csCompanyName}</a></td>
                    </tr>
                `;
            });
        } else {
            msg = `
                <tr>
                    <td>기업이 없습니다.</td>
                </tr>
            `;
        }
        
        const tableBody = document.querySelector('#searchCompanyModal_tbl tbody');
        tableBody.innerHTML = msg;

        changeComName();
    })
    .catch(error => console.error('Error:', error));
});


//기업명 찾기(모달창)에서 기업명 검색 기능 
document.getElementById("searchBtn").addEventListener('click', function() {

    let companyName = document.querySelector('input[name="companyName"]').value;
    let jsonData = JSON.stringify({ companyName: companyName });
    
    fetch('/searchModalComName', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: jsonData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Failed to search company');
        }
        return response.json();
    })
    .then(json => {
    	
    	console.log(json);
 
        let msg = '';
        if (json.length > 0) {
        	json.forEach(item => {
                msg += `
                    <tr class="list">
                        <td><a href="#" class="companyLink" data-company="${item.csCompanyName}">${item.csCompanyName}</a></td>
                    </tr>
                `;
            });
        } else {
            msg = `
                <tr>
                    <td>기업이 없습니다.</td>
                </tr>
            `;
        }
        
        // HTML을 원하는 위치에 추가 또는 변경
        const tableBody = document.querySelector('#searchCompanyModal_tbl tbody');
        tableBody.innerHTML = msg;

        changeComName();
    })
    .catch(error => console.error('Error:', error));
});


//기업명 변경하기
function changeComName(){

    document.querySelectorAll('.companyLink').forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            let result = confirm("기업명을 변경하시겠습니까?");
            if(result){
                // 선택한 기업명을 가져와서 comName input 요소에 할당
                let selectedCompanyName = this.dataset.company;
                document.querySelector('input[name="comName"]').value = selectedCompanyName;
            }
            document.querySelector('input[name="companyName"]').value = ''; 
            searchCompanyModal.style.display = 'none'; 
        });
    });
	
	
};
/** --------------------기업명 찾기 모달창 끝------ */



/** --------------------업태/업종 모달창 시작------ */

var searchBizStatusModal = document.getElementById('searchBizStatus_modal');
var openSearchBizStatusModalBtn = document.getElementById('open_searchBizStatus_modal');
var closeSearchBizStatusModalBtn = document.getElementById('close_searchBizStatus_modal');

//기업명 찾기 모달창 열기 
openSearchBizStatusModalBtn.onclick = function() {
	searchBizStatusModal.style.display = 'block';
	}

//기업명 찾기 모달창 닫기 
closeSearchBizStatusModalBtn.onclick = function() {
	searchBizStatusModal.style.display = 'none';
}

//기업명 찾기 모달창 닫기 (딴 곳 누를 시)
window.onclick = function(event) {
  if (event.target === searchBizStatusModal) {
	  searchBizStatusModal.style.display = 'none';
  }
}




function updateBizCategory() {
    var bizStatus = document.getElementById("searchBarBizStatus").value; // 선택된 업태
    var bizCategorySelect = document.getElementById("searchBarBizCategoryCell"); // 업종 셀렉트 박스가 들어갈 요소

    // 업태에 따라 업종 셀렉트 박스를 동적으로 생성합니다.
    switch (bizStatus) {
        case "농업 및 임업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="작물 재배업">작물 재배업</option>
                    <option value="축산업">축산업</option>
                    <option value="작물재배 및 축산 복합농업">작물재배 및 축산 복합농업</option>
                    <option value="조경수 식재 및 농업관련 서비스업">조경수 식재 및 농업관련 서비스업</option>
                    <option value="수렵 및 관련 서비스업">수렵 및 관련 서비스업</option>
                    <option value="영림업">영림업</option>
                    <option value="벌목업">벌목업</option>
                        
                </select>
            `;
            break;
        case "어업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="어로 어업">어로 어업</option>
                    <option value="양식 어업 및 어업관련 서비스업">양식 어업 및 어업관련 서비스업</option>
                </select>
            `;
            break;
        case "광업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="석탄,원유 및 우라늄 광업">석탄,원유 및 우라늄 광업</option>
                    <option value="금속 광업">금속 광업</option>
                	<option value="비금속 광물 광업;연료용 제외">비금속 광물 광업;연료용 제외</option>
                </select>
            `;
            break;
        case "제조업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="음ㆍ식료품 제조업">음ㆍ식료품 제조업</option>
                    <option value="담배 제조업">담배 제조업</option>
                	<option value="섬유제품 제조업;봉제의복 제외">섬유제품 제조업;봉제의복 제외</option>
                	 <option value="봉제의복 및 모피제품 제조업">봉제의복 및 모피제품 제조업</option>
                    <option value="가죽,가방 및 신발 제조업">가죽,가방 및 신발 제조업</option>
                	<option value="목재 및 나무제품 제조업;가구제외">목재 및 나무제품 제조업;가구제외</option>
                	 <option value="펄프,종이 및 종이제품 제조업">펄프,종이 및 종이제품 제조업</option>
                    <option value="출판,인쇄 및 기록매체 복제업">출판,인쇄 및 기록매체 복제업</option>
                	<option value="코크스,석유정제품 및 핵연료 제조업">코크스,석유정제품 및 핵연료 제조업</option>
                	 <option value="화합물 및 화학제품 제조업">화합물 및 화학제품 제조업</option>
                    <option value="무 및 플라스틱제품 제조업">고무 및 플라스틱제품 제조업</option>
                	<option value="비금속광물제품 제조업">비금속광물제품 제조업</option>
                	 <option value="제1차 금속산업">제1차 금속산업</option>
                    <option value="조립금속제품 제조업;기계 및 가구 제외">조립금속제품 제조업;기계 및 가구 제외</option>
                	<option value="기타 기계 및 장비 제조업">기타 기계 및 장비 제조업</option>
                	 <option value="컴퓨터 및 사무용 기기 제조업">컴퓨터 및 사무용 기기 제조업</option>
                    <option value="기타 전기기계 및 전지변환장치 제조업">기타 전기기계 및 전지변환장치 제조업</option>
                	<option value="전자부품,영상,음향 및 통신장비 제조업">전자부품,영상,음향 및 통신장비 제조업</option>
                	<option value="의료,정밀,광학기기 및 시계 제조업">의료,정밀,광학기기 및 시계 제조업</option>
                    <option value="자동차 및 트레일러 제조업">자동차 및 트레일러 제조업</option>
                	<option value="기타 운송장비 제조업">기타 운송장비 제조업</option>
                	 <option value="가구 및 기타제품 제조업">가구 및 기타제품 제조업</option>
                    <option value="재생용 가공원료 생산업">재생용 가공원료 생산업</option>

                </select>
            `;
            break;
        case "전기,가스 및 수도사업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="전기업">전기업</option>
                    <option value="가스제조 및 배관 공급업">가스제조 및 배관 공급업</option>
                   <option value="증기 및 온수 공급업">증기 및 온수 공급업</option>
                   <option value="수도사업">수도사업</option>
                </select>
            `;
            break;
        case "건설업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="토목 건설업">토목 건설업</option>
                    <option value="건물 건설업">건물 건설업</option>
                   <option value="토목시설물 및 건물 축조관련 전문 공사업">토목시설물 및 건물 축조관련 전문 공사업</option>
                   <option value="건물설비 설치 공사업">건물설비 설치 공사업</option>
                      <option value="전기 및 통신 공사업">전기 및 통신 공사업</option>
                    <option value="건축마무리 공사업">건축마무리 공사업</option>
                   <option value="건설장비 운영업">건설장비 운영업</option>
             
                </select>
            `;
            break;
   
        case "도매 및 소매업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="자동차 신품 판매업">자동차 신품 판매업</option>
                    <option value="중고 자동차 판매업">중고 자동차 판매업</option>
                	<option value="자동차 부품 및 부속품 판매업">자동차 부품 및 부속품 판매업</option>
                	 <option value="이륜자동차 및 부품 판매업">이륜자동차 및 부품 판매업</option>
                    <option value="주유소 운영업">주유소 운영업</option>
                	<option value="차량용 가스 충전업">차량용 가스 충전업</option>
                	 <option value="상품 중개업">상품 중개업</option>
                    <option value="산업용 농축산물 및 산동물 도매업">산업용 농축산물 및 산동물 도매업</option>
                	<option value="음ㆍ식료품 및 담배 도매업">음ㆍ식료품 및 담배 도매업</option>
                	 <option value="가정용품 도매업">가정용품 도매업</option>
                    <option value="건축자재 및 철물 도매업">건축자재 및 철물 도매업</option>
                	<option value="금속광물 및 1차 금속제품 도매업">금속광물 및 1차 금속제품 도매업</option>
                	 <option value="기타 산업용중간재 및 재생재료 도매업">기타 산업용중간재 및 재생재료 도매업</option>
                    <option value="기계장비 및 관련용품 도매업">기계장비 및 관련용품 도매업</option>
                	<option value="기기타 도매업">기타 도매업</option>
                	 <option value="백화점">백화점</option>
                    <option value="슈퍼마켓">슈퍼마켓</option>
                	<option value="체인화 편의점">체인화 편의점</option>
                	<option value="음ㆍ식료품 및 담배 소매업">음ㆍ식료품 및 담배 소매업</option>
                    <option value="의약품,의료용 기구 및 화장품 소매업">의약품,의료용 기구 및 화장품 소매업</option>
                	<option value="섬유,의복,신발 및 가죽제품 소매업">섬유,의복,신발 및 가죽제품 소매업</option>
                	 <option value="가전제품,가구 및 가정용품 소매업">가전제품,가구 및 가정용품 소매업</option>
                    <option value="철물,난방용구 및 건설자재 소매업">철물,난방용구 및 건설자재 소매업</option>
            		<option value="서적 및 문구용품 소매업">서적 및 문구용품 소매업</option>
                	 <option value="사무용 기기,컴퓨터 및 정밀기기 소매업">사무용 기기,컴퓨터 및 정밀기기 소매업</option>
                    <option value="운동 및 오락용구 소매업">운동 및 오락용구 소매업</option>
                	<option value="시계 및 귀금속 소매업">시계 및 귀금속 소매업</option>
                	 <option value="예술품 및 선물용품 소매업">예술품 및 선물용품 소매업</option>
                    <option value="조가정용 연료 소매업">가정용 연료 소매업</option>
                	<option value="그외 기타 분류안된 상품 전문 소매업">그외 기타 분류안된 상품 전문 소매업</option>
                	 <option value="중고품 소매업">중고품 소매업</option>
                    <option value="전자 상거래업">전자 상거래업</option>
                	<option value="전기타 통신 판매업">기타 통신 판매업</option>
                	<option value="노점 및 유사 이동 판매업">노점 및 유사 이동 판매업</option>
                    <option value="자자동판매기 운영업">자동판매기 운영업</option>
                	<option value="약배달 판매업">계약배달 판매업</option>
                	 <option value="방문 판매업">방문 판매업</option>
                    <option value="그외 기타 무점포 소매업">그외 기타 무점포 소매업</option>
                </select>
            `;
            break;
            
        case "숙박 및 음식점업":
            bizCategorySelect.innerHTML = `
            	<select class="searchbar_selectbox_filter" name="searchBarBizCategory" style="text-align: center; width: 100%; border:0px;">
                    <option value="숙박업">숙박업</option>
                    <option value="한식점업">한식점업</option>
                   <option value="중국 음식점업">중국 음식점업</option>
                   <option value="일본 음식점업">일본 음식점업</option>
                      <option value="서양 음식점업">서양 음식점업</option>
                    <option value="기관 구내 식당업">기관 구내 식당업</option>
                   <option value="기타 일반 음식점업">기타 일반 음식점업</option>
            		
            		<option value="피자,햄버거 및 치킨 전문점">피자,햄버거 및 치킨 전문점</option>
                    <option value="분식 및 김밥 전문점">분식 및 김밥 전문점</option>
                   <option value="이동 음식점업">이동 음식점업</option>
                   <option value="그외 가타 음식점업">그외 가타 음식점업</option>
                      <option value="일반유흥 주점업">일반유흥 주점업</option>
                    <option value="무도유흥 주점업">무도유흥 주점업</option>
                   <option value="간이 주점업">간이 주점업</option>
                     <option value="제과점업">제과점업</option>
                   <option value="찻집">찻집</option>
                </select>
            `;
            break;
        default:
            bizCategorySelect.innerHTML = ""; // 선택된 업태가 없을 때는 업종 셀렉트 박스를 비웁니다.
            break;
    }
}

// 페이지 로드 시 업태가 변경될 때마다 updateBizCategory 함수를 호출하여 초기화합니다.
updateBizCategory();

// 업태가 변경될 때마다 updateBizCategory 함수를 호출하여 업종을 갱신합니다.
document.getElementById("searchBarBizStatus").addEventListener("change", updateBizCategory);


document.getElementById("insert_searchBizStatus_modal").addEventListener('click', function() {
	
	//업태
	let searchBarBizStatus = document.querySelector('select[name="searchBarBizStatus"]');
	//업종
	let searchBarBizCategory = document.querySelector('select[name="searchBarBizCategory"]');
	
	let selecteBizStatusValue = searchBarBizStatus.value;
	let selecteBizCategoryValue = searchBarBizCategory.value;
	
	//console.log(selecteBizStatusValue);
	//console.log(selecteBizCategoryValue);
	
	document.querySelector('input[name="comBizStatus"]').value = selecteBizStatusValue;
	document.querySelector('input[name="comBizCategory"]').value = selecteBizCategoryValue;
	
	searchBizStatusModal.style.display = 'none'; 
	
})