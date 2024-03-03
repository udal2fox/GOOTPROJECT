package org.rainbow.company.custMgmt.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller


public class spotController {
	
	
	@GetMapping("/getSpotList")
	public String getSpotList( ) {
		
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
