package org.rainbow.company.custMgmt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller

public class enterpriseController {

	@Autowired
	private org.rainbow.company.custMgmt.service.enterpriseService enterpriseService;

	/** 'enterpriseList.jsp' 에서 기업 리스트 가져오기 */
	
	/*
	 * @GetMapping("/getEnterpriseList") public String getEnterpriseList(Model
	 * model) { log.info("getEnterpriseList_success");
	 * 
	 * model.addAttribute("companyVO", enterpriseService.getEnterpriseList());
	 * 
	 * return "/company/custMgmtPage/enterpriseMgmt/enterpriseList"; }
	 */
													 

	/** 기업 관리 페이지에서 기업 등록 페이지로 이동 */
	@GetMapping("/moveEnterpriseRegister")
	public String moveEnterpriseRegister() {
		return "/company/custMgmtPage/enterpriseMgmt/enterpriseRegister";
	}

	/*	*//** 'enterpriseList.jsp' 에서 기업 리스트 가져오기 */
													  @GetMapping("/getEnterpriseList") public String
													  getEnterpriseList(Model model) {
													  
													 
													 return "/company/custMgmtPage/enterpriseMgmt/enterpriseList"; }
													 
}
