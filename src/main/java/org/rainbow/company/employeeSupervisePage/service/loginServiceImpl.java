package org.rainbow.company.employeeSupervisePage.service;

import java.util.HashMap;

import org.rainbow.company.employeeSupervisePage.mapper.loginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class loginServiceImpl implements loginService {
	
	@Autowired
	private loginMapper mapper;
	
	// 사원 로그인
	@Override
	public HashMap<String, Object> doLogin(HashMap<String, String> loginMap) {
		log.info("login..." + loginMap);
		return mapper.doLogin(loginMap);
	}
}
