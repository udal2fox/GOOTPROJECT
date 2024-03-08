package org.rainbow.userAdminPage.service;

import java.util.HashMap;
import java.util.List;

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
	
	@Override
	public HashMap<String, Object> getDashboard(int spotNo) {
		return userMapper.getDashboard(spotNo);
	}
	
	@Override
	public HashMap<String, Object> getUserInfo(int spotNo) {
		return userMapper.getUserInfo(spotNo);
	}
	
	@Override
	public int updateUserInfo(HashMap<String, Object> updateInfo) {
		return userMapper.updateUserInfo(updateInfo);
	}
	
	@Override
	public List<HashMap<String, Object>> getEmpList(int sNo) {
		return userMapper.getEmpList(sNo);
	}
}
