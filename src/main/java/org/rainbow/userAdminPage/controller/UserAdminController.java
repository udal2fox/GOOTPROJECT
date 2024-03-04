package org.rainbow.userAdminPage.controller;

import org.rainbow.userAdminPage.domain.userInfoVO;

import org.rainbow.userAdminPage.service.UserAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/userAdminPage/*")
@Log4j
public class UserAdminController {

	@Autowired
	private UserAdminService service;

	// 최초 접근 시
	@GetMapping("/userLogin")
	public String userLogin() {
		return "userAdminPage/userLogin";
	}


	// 로그인
	@PostMapping(value = "/login")
	public userInfoVO login(@RequestParam("uEmail") String uEmail, @RequestParam("uPw") String uPw) {
		userInfoVO vo = new userInfoVO();
		vo.setUEmail(uEmail);
		vo.setUPw(uPw);
		System.out.println(vo);
		service.userAdminLogin(vo);
		System.out.println(vo);
		return vo;
	}

	@GetMapping("/sidebar")
	public String sidebar() {
		return "userAdminPage/sidebar";
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
