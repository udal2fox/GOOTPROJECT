package org.rainbow.company.custMgmt.controller;

import org.rainbow.company.custMgmt.service.spotServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.log4j.Log4j;

@Log4j
@Controller


public class spotController {
	
	@Autowired
	private spotServiceImpl spotService;
	
	
	@GetMapping("/spotList")
	public String spotList(Model model ) {
		log.info("spotList_success");
		
		model.addAttribute("spotVO",spotService.spotList());
		
		return "/company/custMgmtPage/spotMgmt/spotList";	
		 
	}
	
	@GetMapping("/spotView")
	public String spotView( ) {
		
		return "/company/custMgmtPage/spotMgmt/spotView";	
		 
	}
	
	
	@GetMapping("/spotRegister")
	public String spotRegister( ) {
		
		return "/company/custMgmtPage/spotMgmt/spotRegister";	
		 
	}
	

}
