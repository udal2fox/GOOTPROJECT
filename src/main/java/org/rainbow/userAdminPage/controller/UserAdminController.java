package org.rainbow.userAdminPage.controller;

import org.rainbow.userAdminPage.service.userInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import lombok.extern.log4j.Log4j;

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


	// 로그인
	@ResponseBody
	@PostMapping(value = "/login")
	public String login(@RequestBody Map<String, Object> param) {
		String uEmail = (String) param.get("uEmail");
		String uPw = (String) param.get("uPw");
		System.out.println(uEmail);
		System.out.println(uPw);
		HashMap<String, Object> map = uService.userAdminLogin(uEmail,uPw);
		System.out.println(map);

		return "userAdminPage/userLogin";
	}


}
