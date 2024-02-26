package org.rainbow.company.custMgmt.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller

@RequestMapping("/test/*")
public class salesController {
	

	@GetMapping("/salesList")
	public String salesList( ) {
		
		return "/company/custMgmtPage/salesMgmt/salesList";	
		 
	}
	
	@GetMapping("/salesView")
	public String salesView( ) {
		
		return "/company/custMgmtPage/salesMgmt/salesView";	
		 
	}
	
	
}
