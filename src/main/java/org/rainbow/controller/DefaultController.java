package org.rainbow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DefaultController {
	@GetMapping("/")
	public String testMapping() {
		// return "테스트시 DefaultController 사용 가능!!";

		 return "index";

	}

	@GetMapping("/landinPage")
	public String landinPage() {
		return "/landingPage/main";
	}

	@GetMapping("/company")
	public String company() {
		return "/company/login";
	}

	@GetMapping("/userAdminPage")
	public String userAdminPage() {
		return "/userAdminPage/userLogin";
	}

}
