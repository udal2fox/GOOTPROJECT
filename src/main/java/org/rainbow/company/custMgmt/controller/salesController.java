package org.rainbow.company.custMgmt.controller;


import java.util.List;

import org.springframework.web.bind.annotation.ResponseBody;
import org.rainbow.company.custMgmt.domain.consultSearchDTO;
import org.rainbow.company.custMgmt.domain.consultVO;
import org.rainbow.company.custMgmt.service.salesServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class salesController {

	@Autowired
	salesServiceImpl salesService;


	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기 */

	@PostMapping(value = "/salesList")
	public String salesList(Model model) {
		log.info("salesList_success");

		model.addAttribute("consultVO", salesService.salesList());

		return "/company/custMgmtPage/salesMgmt/salesList";

	}

	@ResponseBody
	@RequestMapping(value = "/search.do", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<consultVO>> salesSearch(@RequestBody consultSearchDTO consultSearchDTO) {
	    
		log.info("검색"+consultSearchDTO);

	    List<consultVO> list = salesService.getSearch(consultSearchDTO);
	    log.info(list);

	    return new ResponseEntity<List<consultVO>>(list, HttpStatus.OK);
	    
	   
	}

	/** 'salesView.jsp' 에서 상담 신청 내용 가져오기 */
	@PostMapping("/salesView")
	public String salesView(int consultNo, Model model) {
		log.info("salesView_success" + consultNo);
		model.addAttribute("consultVO", salesService.salesView(consultNo));

		return "/company/custMgmtPage/salesMgmt/salesView";

	}

	/** 'salesView.jsp' 에서 영업 내용, 영업 히스토리 저장(수정)하기 */
	@PostMapping("/saveSales")
	public String saveSales(consultVO vo, RedirectAttributes rttr) {
		log.info("saveSales_success" + vo);

		salesService.saveSales(vo);

		rttr.addFlashAttribute("result", "success");

		return "redirect:/salesList";

	}
	
	
	@GetMapping("/searchModal")
	public ResponseEntity<List<consultVO>> searchModal() {
		log.info("안녕");
		log.info("searchCompanyListModal_success");
	    List<consultVO> list = salesService.searchCompanyListModal();    
	    return new ResponseEntity<List<consultVO>>(list, HttpStatus.OK);
	}
    
}
