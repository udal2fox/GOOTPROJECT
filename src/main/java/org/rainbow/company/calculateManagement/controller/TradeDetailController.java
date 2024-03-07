package org.rainbow.company.calculateManagement.controller;


import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
import org.rainbow.company.calculateManagement.service.TradeDetaiServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TradeDetailController {

	@Autowired
	TradeDetaiServiceImpl tService;
	
	@GetMapping(value = "/TradeDetailPage")
	public String orderStatementPage(Model model) {
		
		List<TradeDetailListVO> list = tService.tradeDetailList();
		
		model.addAttribute("list", list);
		
		
		return "/company/calculateMGTpage/TradeDetailPage";
	}
}
