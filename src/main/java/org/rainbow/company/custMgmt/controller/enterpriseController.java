package org.rainbow.company.custMgmt.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller

@RequestMapping("/test/*")
public class enterpriseController {
	
	
	@GetMapping("/enterpriseList")
	public String enterpriseList( ) {
		
		return "/company/custMgmtPage/enterpriseMgmt/enterpriseList";	
		 
	}
	
	@GetMapping("/enterpriseUpdate")
	public String enterpriseUpdate( ) {
		
		return "/company/custMgmtPage/enterpriseMgmt/enterpriseUpdate";	
		 
	}
	
	@GetMapping("/enterpriseRegistration")
	public String enterpriseRegistration( ) {
		
		return "/company/custMgmtPage/enterpriseMgmt/enterpriseRegistration";	
		 
	}
	
	

}
