	

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