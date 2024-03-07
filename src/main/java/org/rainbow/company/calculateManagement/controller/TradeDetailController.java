package org.rainbow.company.calculateManagement.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TradeDetailController {

	
	@GetMapping(value = "/TradeDetailPage")
	public String orderStatementPage(Model model) {
		
		log.info("list...");
		
		

		
		
		return "/company/calculateMGTpage/TradeDetailPage";
	}
}
