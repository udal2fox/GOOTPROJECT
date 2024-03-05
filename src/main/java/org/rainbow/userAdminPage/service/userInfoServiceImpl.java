package org.rainbow.userAdminPage.service;

import lombok.extern.log4j.Log4j;
import org.rainbow.company.custMgmt.domain.spotVO;
import org.rainbow.userAdminPage.mapper.spotInfoMapper;
import org.rainbow.userAdminPage.mapper.userInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Log4j
@Service
public class userInfoServiceImpl implements userInfoService{

    @Autowired
    private userInfoMapper uMapper;

    @Autowired
    private spotInfoMapper sMapper;

    // 사용자페이지 로그인
    @Override
    public HashMap<String, String> userAdminLogin(HashMap<String, String> map) {
        return uMapper.userAdminLogin(map);
    }

    @Override
    public spotVO getSpotInfo(int spotNo) {
        return sMapper.getSpotInfo(spotNo);
    }


}
