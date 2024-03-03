package org.rainbow.company.custMgmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class companyController {
	
	
	/** 기업 관리 페이지에서 기업 등록 페이지로 이동 */
	@GetMapping("/moveCompanyRegister")
	public String moveCompanyRegister() {
		return "/company/custMgmtPage/companyMgmt/companyRegister";
	}

	/** 'enterpriseList.jsp' 에서 기업 리스트 가져오기 */
	@GetMapping("/getCompanyList") 
	public String getCompanyList() {
													  
													 
	return "/company/custMgmtPage/companyMgmt/companyList"; 
	
	}
	
	
	/** ---------------------기업 관리 페이지 끝-------------------------------------------------------------*/
	
	/** ---------------------기업 등록 페이지 시작-------------------------------------------------------------*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** ---------------------기업 등록 페이지 끝-------------------------------------------------------------*/
}
