package org.rainbow.userAdminPage.service;

import org.rainbow.userAdminPage.domain.userInfoVO;

public interface UserAdminService {

    public userInfoVO userAdminLogin(String uEmail,String uPw);

}
