package org.rainbow.company.custMgmt.controller;

import org.rainbow.company.custMgmt.service.salesService;
import org.rainbow.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class salesController {

	@Autowired
	private salesService salesService;

	/*	*//** 'salesList.jsp' 에서 상담 요청 리스트 가져오기 */
	/*
	 * @GetMapping("/getSalesList") public String salesList(Model model, Criteria
	 * cri ) { log.info("getSalesList_success"); if(cri.getPageNum() == 0 &&
	 * cri.getAmount() == 0) {
	 * 
	 * cri.setPageNum(1); cri.setAmount(10); } model.addAttribute("consultVO",
	 * salesService.getSalesList(cri));
	 * 
	 * return "/company/custMgmtPage/salesMgmt/salesList";
	 * 
	 * }
	 * 
	 *//** 'salesView.jsp' 에서 상담 신청 내용 가져오기 *//*
												 * @GetMapping("/getSalesView") public String salesView(int consultNo,
												 * Model model) { log.info("getSalesView_success" + consultNo);
												 * model.addAttribute("consultVO",
												 * salesService.getSalesView(consultNo));
												 * 
												 * 
												 * return "/company/custMgmtPage/salesMgmt/salesView";
												 * 
												 * }
												 */

}
