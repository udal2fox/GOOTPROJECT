package org.rainbow.userAdminPage.mapper;

import java.util.HashMap;
import java.util.List;

public interface userAdminMapper {

	public HashMap<String, Object> customerLogin(HashMap<String, String> inputMap);
	
	public HashMap<String, Object> getDashboard(int spotNo);
	
	public HashMap<String, Object> getUserInfo(int spotNo);
	
	public int updateUserInfo(HashMap<String, Object> updateInfo);
	
	public List<HashMap<String, Object>> getEmpList(int sNo);
	
	public List<HashMap<String, Object>> getInquiryList(int spotNo);
	
	public boolean addQnA(HashMap<String, Object> addQnAMap);
	
	public boolean addUserEmp(HashMap<String, Object> addForm);
}
