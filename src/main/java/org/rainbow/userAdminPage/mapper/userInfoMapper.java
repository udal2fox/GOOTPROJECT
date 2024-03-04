package org.rainbow.userAdminPage.mapper;

import org.rainbow.userAdminPage.domain.userInfoVO;

public interface userInfoMapper {

    public userInfoVO userAdminLogin(String uEmail, String uPw);
}
