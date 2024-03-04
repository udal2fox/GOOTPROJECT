package org.rainbow.company.custMgmt.controller;


import org.rainbow.company.custMgmt.service.salesServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class salesController {

	@Autowired
	private salesServiceImpl salesService;

	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기 */

	  @GetMapping("/salesList") 
	  public String salesList(Model model) { 
		  log.info("getSalesList_success"); 
		  
		  model.addAttribute("consultVO", salesService.salesList());
	  
		  return "/company/custMgmtPage/salesMgmt/salesList";
	  
	  } 
	  
	  
	  
	  
}


