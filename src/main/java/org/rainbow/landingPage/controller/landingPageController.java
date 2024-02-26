package org.rainbow.landingPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/landingPage/*")
public class landingPageController {
	
	@GetMapping("/main")
	public String main() {
		return "/landingPage/main";
	}
	@GetMapping("/application")
	public String application() {
		return "/landingPage/application";
	}
	@GetMapping("/FAQ")
	public String FAQ() {
		return "/landingPage/FAQ";
	}
}
