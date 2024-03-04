package org.rainbow.userAdminPage.controller;


import org.rainbow.userAdminPage.service.userInfoService;
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
	private userInfoService uService;

	// 최초 접근 시
	@GetMapping("/userLogin")
	public String userLogin() {
		return "userAdminPage/userLogin";
	}


	// 로그인
	@ResponseBody
	@PostMapping(value = "/userAdminLogin")
	public String login(@RequestBody Map<String, Object> param) {
		String uEmail = (String) param.get("uEmail");
		String uPw = (String) param.get("uPw");
		HashMap<String, Object> userInfo = uService.userAdminLogin(uEmail,uPw);
		System.out.println(userInfo);

		return null;
	}

	@GetMapping("/dashboard")
	public String dashboard() {
		return "/userAdminPage/dashboard";
	}

	@GetMapping("/manage_member")
	public String member() {
		return "/userAdminPage/manage_member";
	}

	@GetMapping("/manage_card")
	public String card() {
		return "/userAdminPage/manage_card";
	}

	@GetMapping("/manage_gift")
	public String gift() {
		return "/userAdminPage/manage_gift";
	}

	@GetMapping("/manage_gift_Edit")
	public String gift_Edit() {
		return "/userAdminPage/manage_gift_Edit";
	}

	@GetMapping("/manage_recipients")
	public String recipients() {
		return "/userAdminPage/manage_recipients";
	}

	@GetMapping("/usageHistory_details")
	public String usageHistory_details() {
		return "/userAdminPage/usageHistory_details";
	}

	@GetMapping("/usageHistory_list")
	public String usageHistory_list() {
		return "/userAdminPage/usageHistory_list";
	}

	@GetMapping("/userEdit")
	public String userEdit() {
		return "/userAdminPage/userEdit";
	}

	@GetMapping("/inquiryBoard")
	public String inquiryBoard() {
		return "/userAdminPage/inquiryBoard";
	}

}
