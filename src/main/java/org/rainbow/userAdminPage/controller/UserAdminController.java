package org.rainbow.userAdminPage.controller;

import org.rainbow.userAdminPage.service.userInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import lombok.extern.log4j.Log4j;

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
	public ResponseEntity<String> login(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("uEmail", (String) param.get("uEmail"));
		map.put("uPw", (String) param.get("uPw"));
		HashMap<String, String> resultMap = uService.userAdminLogin(map);
		if(resultMap == null) {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userName", resultMap.get("uName"));
			session.setAttribute("spotNo", resultMap.get("spotNo"));
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}

	}


}
