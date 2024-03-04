package org.rainbow.userAdminPage.mapper;

import java.util.HashMap;

public interface userInfoMapper {
    public HashMap<String, Object> userAdminLogin(String uEmail, String uPw);

}
