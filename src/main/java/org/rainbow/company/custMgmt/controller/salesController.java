package org.rainbow.company.custMgmt.controller;




import org.rainbow.company.custMgmt.domain.salesVO;
import org.rainbow.company.custMgmt.service.salesService;
import org.rainbow.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import lombok.extern.log4j.Log4j;

@Log4j
@Controller
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
