package org.rainbow.userAdminPage.mapper;

import org.rainbow.userAdminPage.domain.userInfoVO;

import java.util.HashMap;

public interface userInfoMapper {

    public HashMap<String,Object> userAdminLogin(String uEmail, String uPw);

}
