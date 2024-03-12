package org.rainbow.company.employeeSupervisePage.service;

import java.util.HashMap;

public interface loginService {
	
	// 사원 로그인
	public HashMap<String, Object> doLogin(HashMap<String, String> loginMap);
}
