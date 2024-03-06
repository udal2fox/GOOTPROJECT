package org.rainbow.company.custMgmt.controller;





import org.rainbow.company.custMgmt.service.companyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class companyController {
	
	@Autowired
	private companyServiceImpl companyService;
	
	

	/** 'companyList.jsp' 에서 기업 리스트 가져오기 */
	@GetMapping("/companyList") 
	public String companyList(Model model) {
		
		log.info("companyList_success");
		
		model.addAttribute("companyVO",companyService.companyList() );
		
											 
	return "/company/custMgmtPage/companyMgmt/companyList"; 
	
	}
	
	@GetMapping("/companyView")
	public String companyView( ) {
		
		return "/company/custMgmtPage/companyMgmt/companyView";	
		 
	}
	
	
	@GetMapping("/companyRegister")
	public String companyRegister( ) {
		
		return "/company/custMgmtPage/companyMgmt/companyRegister";	
		 
	}
}
