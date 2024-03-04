package org.rainbow.userAdminPage.service;

import lombok.extern.log4j.Log4j;
import org.rainbow.userAdminPage.domain.userInfoVO;
import org.rainbow.userAdminPage.mapper.userInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j
@Service
public class UserAdminServiceImpl implements UserAdminService{

    @Autowired
    private userInfoMapper userInfoMapper;

    @Override
    public userInfoVO userAdminLogin(userInfoVO vo) {
        log.info("userInfoVO: "+vo);
        return userInfoMapper.userAdminLogin(vo);
    }
}
