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
	
	
	@Autowired
	private salesService salesService;
	


	
	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기  */
	@GetMapping("/getSalesList")
	public String salesList(Model model, Criteria cri ) {
		log.info("getSalesList_success");
		if(cri.getPageNum() == 0 && cri.getAmount() == 0) {
			
			cri.setPageNum(1);
			cri.setAmount(10);
		}
		model.addAttribute("salesVO", salesService.getSalesList(cri));
		
		return "/company/custMgmtPage/salesMgmt/salesList";	
		 
	}
	
	
	
	/** 'salesView.jsp' 에서 상담 신청 내용 가져오기  */
	@GetMapping("/getSalesView")
	public String salesView(int cnslNo, Model model) {
		log.info("getSalesView_success" + cnslNo);
		model.addAttribute("SalesVO", salesService.getSalesView(cnslNo));
		

		return "/company/custMgmtPage/salesMgmt/salesView";	
		 
	}
	
	/** 'salesView.jsp' 에서 영업 내용 저장하기 */
	@PostMapping("/saveSales")
	public String saveSales(salesVO vo) {
		
		log.info("잘 넘어오니");
		
		 
		
		return "/company/custMgmtPage/salesMgmt/salesList";	
	}
	

	
	
}
