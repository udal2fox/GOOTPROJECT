package org.rainbow.company.orderStatementPage.controller;

import java.util.List;

import org.rainbow.company.orderStatementPage.domain.orderStatementPageVO;
import org.rainbow.company.orderStatementPage.domain.testVO;
import org.rainbow.company.orderStatementPage.service.orderStatementPageServiceImpl;
import org.rainbow.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class orderStatementPageController {

	@Autowired
	orderStatementPageServiceImpl orderStatementPageService;
	
	@GetMapping(value = "/orderStatementPage")
	public String orderStatementPage(Model model, Criteria cri) {
		
		log.info("list...");
		
		if(cri.getPageNum() == 0 && cri.getAmount() == 0) {
			
			cri.setPageNum(1);
			cri.setAmount(10);
		}
		
		List<testVO> ordStatlist = orderStatementPageService.ordStatlist();
		
		model.addAttribute("ordStatlist", ordStatlist);

		System.out.println(ordStatlist.get(0).getCName());
		System.out.println(ordStatlist.get(0).getCBizType());
		System.out.println(ordStatlist.get(0).getSName());
		
		
		return "/company/orderStatementPage/orderStatement";
	}
}
