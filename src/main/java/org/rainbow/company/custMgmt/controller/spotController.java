package org.rainbow.company.custMgmt.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller


public class spotController {
	
	
	@GetMapping("/spotList")
	public String spotList( ) {
		
		return "/company/custMgmtPage/spotMgmt/spotList";	
		 
	}
	
	@GetMapping("/spotUpdate")
	public String spotUpdate( ) {
		
		return "/company/custMgmtPage/spotMgmt/spotUpdate";	
		 
	}
	
	
	@GetMapping("/spotRegistration")
	public String spotRegistration( ) {
		
		return "/company/custMgmtPage/spotMgmt/spotRegistration";	
		 
	}
	

}
