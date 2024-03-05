package org.rainbow.userAdminPage.service;

import org.rainbow.company.custMgmt.domain.spotVO;

import java.util.HashMap;

public interface userInfoService {

    // 사용자페이지 로그인
    public HashMap<String, String> userAdminLogin(HashMap<String, String> map);

    // dashboard 페이지 정보 가져오기
    public spotVO getSpotInfo(int spotNo);
}
