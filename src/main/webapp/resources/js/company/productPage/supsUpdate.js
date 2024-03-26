
	// 공급처 업데이트
	function supsUpdate(f) 
	{
		if(deptNo != 0 && deptNo != 4)
		{
			alert("불허된 접근입니다.")
			return;
		}
		if(f.supsName.value == '' || f.supsCo.value == '' || f.supsPhone.value == '' || f.supsAddr.value == '' || f.supsEmail.value == '' 
		&& f.supsBizRegNum.value == '' || f.supsCo.value == '' || f.supsPhone.value == '' || f.supsCoEmail.value == '')
		{
			alert("필수정보를 입력해주세요...");
			return false;
		
		}
		if(confirm("공급처 정보를 수정하시겠습니까?"))
		{
			f.action = "supsUpdate";
			f.submit();
		}
		else return false;
	}
	
	
	// 공급처 삭제
	function supsDel(f) 
	{
		if(deptNo != 0 && deptNo != 4)
		{
			alert("불허된 접근입니다.")
			return;
		}
		if(confirm("공급처 정보를 삭제하시겠습니까?"))
		{
			f.action = "supsDelete";
			f.submit();
		}
		else return false;
	}
	
	// 이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
	function backPage() 
	{
		window.location = document.referrer;
	}

						
						