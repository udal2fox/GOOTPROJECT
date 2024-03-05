package org.rainbow.userAdminPage.mapper;

import java.util.HashMap;

public interface userInfoMapper {

    // 사용자페이지 로그인
    public HashMap<String, String> userAdminLogin(HashMap<String, String> map);

}
