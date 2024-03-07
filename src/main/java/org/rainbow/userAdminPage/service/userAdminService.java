package org.rainbow.userAdminPage.service;

import java.util.HashMap;

public interface userAdminService {
	
	public HashMap<String, Object> customerLogin(HashMap<String, String> inputMap);
	
	public HashMap<String, Object> getDashboard(int spotNo);
	
}
