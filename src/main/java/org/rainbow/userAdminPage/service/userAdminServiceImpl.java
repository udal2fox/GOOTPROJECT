package org.rainbow.userAdminPage.service;

import java.util.HashMap;

import org.rainbow.userAdminPage.mapper.userAdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class userAdminServiceImpl implements userAdminService{

	@Autowired
	private userAdminMapper userMapper;
	
	@Override
	public HashMap<String, Object> customerLogin(HashMap<String, String> inputMap) {
		log.info("service login info..." + inputMap);
		return userMapper.customerLogin(inputMap);
	}
}
