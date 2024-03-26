package org.rainbow.userAdminPage.mapper;

import java.util.HashMap;
import java.util.List;


public interface userAdminMapper {

	public HashMap<String, Object> customerLogin(HashMap<String, String> inputMap);
	
	public HashMap<String, Object> getDashboard(int spotNo);
	
	public List<HashMap<String, Object>> getBestTop5(int spotNo);
	
	public List<HashMap<String, Object>> getMonthlyData(int spotNo);
	
	public HashMap<String, Object> getUserInfo(int spotNo);
	
	public int updateUserInfo(HashMap<String, Object> updateInfo);
	
	public List<HashMap<String, Object>> getEmpList(int spotNo);
	
	public List<HashMap<String, Object>> getInquiryList(int spotNo);
	
	public boolean addQnA(HashMap<String, Object> addQnAMap);
	
	public boolean addUserEmp(HashMap<String, Object> addForm);
	
	public boolean updateEmp(HashMap<String, Object> emp);
	
	public List<HashMap<String, Object>> getGiftList();
	
	public boolean deleteEmployees(HashMap<String, Integer> deleteParams);
	
	public boolean updateCustomGift(HashMap<String, Object> customGift);
	
	public boolean updateDefaultGift(HashMap<String, Object> defaultGift);
	
	public String getCustomGift(int spotNo);
	
	public String getDefaultGift(int spotNo);
	
	public HashMap<String, Object> getProduct(String prdNo);
	
	public int countBySpotNo(int spotNo);
	
	public boolean updateCard(HashMap<String, Object> cardForm);
	
	public boolean insertCard(HashMap<String, Object> cardForm);

	public HashMap<String, Object> getCardInfo(int spotNo);
	
	public List<HashMap<String, Object>> getRecipients (HashMap<String, Object> inputValue);
	
	public List<HashMap<String, Object>> getUsageList(int spotNo);

	public List<HashMap<String, Object>> getDetailUsage(HashMap<String, Object> inputMap);
	
	public HashMap<String, String> sendMail(int ordNo);
	
}
