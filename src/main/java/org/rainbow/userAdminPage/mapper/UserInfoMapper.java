package org.rainbow.userAdminPage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.rainbow.userAdminPage.domain.userInfoVO;

public interface UserInfoMapper {

    public userInfoVO userAdminLogin(userInfoVO vo);
}
