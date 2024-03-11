package org.rainbow.company.employeeSupervisePage.mapper;

import java.util.HashMap;

public interface loginMapper {
	
	// 사원 로그인
	public HashMap<String, Object> doLogin(HashMap<String, String> loginMap);
}
