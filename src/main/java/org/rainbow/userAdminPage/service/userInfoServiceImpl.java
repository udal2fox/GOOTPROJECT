package org.rainbow.userAdminPage.service;

import lombok.extern.log4j.Log4j;
import org.rainbow.userAdminPage.mapper.userInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Log4j
@Service
public class userInfoServiceImpl implements userInfoService{

    @Autowired
    private userInfoMapper uMapper;

    @Override
    public HashMap<String,Object> userAdminLogin(String uEmail, String uPw) {
        return uMapper.userAdminLogin(uEmail,uPw);

    }

}
