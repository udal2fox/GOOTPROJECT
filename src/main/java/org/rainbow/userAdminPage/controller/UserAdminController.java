package org.rainbow.userAdminPage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rainbow.userAdminPage.service.userAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes
@RequestMapping("/userAdminPage/*")
@Log4j
public class UserAdminController {

	@Autowired
	private userAdminServiceImpl userService;
	
    // 최초 접근 시
    @GetMapping("/userLogin")
    public String userLogin() {
        return "userAdminPage/userLogin";
    }
    
    // userAdminPage 로그인
    @ResponseBody
    @PostMapping(value = "/adminLogin", consumes = "application/json", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<String> customerLogin(@RequestBody HashMap<String, String> userMap, HttpServletRequest req) {
    	System.out.println(userMap.get("userEmail"));
    	System.out.println(userMap.get("userPw"));
    	HashMap<String, String> inputMap = new HashMap<String, String>();
    	inputMap.put("userEmail", (String) userMap.get("userEmail"));
    	inputMap.put("userPw", (String) userMap.get("userPw"));
    	log.info("input info..." + inputMap);
    	HashMap<String, Object> resultMap = userService.customerLogin(inputMap);
    	log.info("result info..." + resultMap);
    	if(resultMap == null) {
    		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}else {
    		HttpSession session = req.getSession();
    		session.setAttribute("userName", (String)resultMap.get("userName"));
    		session.setAttribute("spotNo", (String)resultMap.get("spotNo"));
    		session.setMaxInactiveInterval(60*15);
    		return ResponseEntity.status(HttpStatus.OK).body((String)(resultMap.get("spotNo")));
    	}
    	
    }




}
