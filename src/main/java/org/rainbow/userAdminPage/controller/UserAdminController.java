package org.rainbow.userAdminPage.controller;

import org.rainbow.userAdminPage.service.userInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import lombok.extern.log4j.Log4j;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/userAdminPage/*")
@Log4j
public class UserAdminController {

    @Autowired
    private userInfoServiceImpl uService;

    // 최초 접근 시
    @GetMapping("/userLogin")
    public String userLogin() {
        return "userAdminPage/userLogin";
    }


    // 사용자페이지 로그인
    @ResponseBody
    @PostMapping(value = "/login")
    public ResponseEntity<?> login(
            @RequestBody Map<String, Object> param, HttpServletRequest request) {

        // todo : 비밀번호 암호화
        HashMap<String, String> map = new HashMap<>();
        map.put("uEmail", (String) param.get("uEmail"));
        map.put("uPw", (String) param.get("uPw"));
        HashMap<String, String> resultMap = uService.userAdminLogin(map);

        if (resultMap == null) {
            return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
        } else {
            // 세션생성 및 유저이름 저장
            HttpSession session = request.getSession();
            session.setAttribute("userName", resultMap.get("uName"));
            session.setAttribute("spotNo", resultMap.get("spotNo"));
            session.setMaxInactiveInterval(20 * 60);

            return new ResponseEntity<>("success", HttpStatus.OK);
        }

    }

    @GetMapping("/dashboard")
    public void dashboard(HttpServletRequest request, Model model){
        HttpSession session = request.getSession(false);
        int spotNo = (int)session.getAttribute("spotNo");
        System.out.println(spotNo);
        //HashMap<String, String> resultMap = uService.getSpotInfo(spotNo);

    }

    // DashBoard 정보 가져오기

    // 고객지원 페이지


}
