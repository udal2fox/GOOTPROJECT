package org.rainbow.company.custMgmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class companyController {
	
	
	@GetMapping("/getCompanyList")
	public String getCompanyList() {
		
		return  "/company/custMgmtPage/companyMgmt/companyList"; 
	}

}
