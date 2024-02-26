package org.rainbow.userAdminPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/userAdminPage/*")
@Log4j
public class UserAdminController {

	@GetMapping("/dashboard")
	public String sidebar() {
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
