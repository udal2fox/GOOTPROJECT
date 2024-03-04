package org.rainbow.userAdminPage.service;

import org.rainbow.userAdminPage.domain.userInfoVO;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public interface userInfoService {

    public HashMap<String,Object> userAdminLogin(String uEmail, String uPw);
}
