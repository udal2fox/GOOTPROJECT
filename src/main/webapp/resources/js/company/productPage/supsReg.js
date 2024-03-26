	

	function supsReg(f)
	{
		if(f.supsName.value == '' || f.supsCo.value == '' || f.supsPhone.value == '' || f.supsAddr.value == '' || f.supsEmail.value == '' 
		&& f.supsBizRegNum.value == '' || f.supsCo.value == '' || f.supsPhone.value == '' || f.supsCoEmail.value == '')
		{
			alert("필수정보를 입력해주세요...");
			return false;
		
		}
		if(confirm("공급처 정보를 등록하시겠습니까?"))
		{
			f.submit();
		}
		else return false;	
		
	}
	
	// 이전페이지 가기 다른페이지에 물려있어서 페이지 이동보단 뒤로가기가 나은듯합니다.
	function backPage() 
	{
		window.location = document.referrer;
	}
