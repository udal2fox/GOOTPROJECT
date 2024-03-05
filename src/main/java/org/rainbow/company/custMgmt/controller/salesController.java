package org.rainbow.company.custMgmt.controller;


import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class salesController {

	@Autowired
	private salesServiceImpl salesService;
	
	
	/** 서치바 -키워드 검색 */
	
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "/searchBarKeyword", produces =
	 * {MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE,
	 * MediaType.APPLICATION_XML_VALUE}) public ResponseEntity<List<consultVO>>
	 * searchBarKeyword(@RequestParam("keyword") String keyword) {
	 * log.info("키워드 잘 넘어오니" + keyword);
	 * 
	 * 
	 * List<consultVO> list = salesService.getSearch(keyword); log.info(list);
	 * 
	 * 
	 * // ResponseEntity에 list와 ptdo를 함께 담아 반환
	 * 
	 * // 리스트 비동기로 뿌려주기 return new ResponseEntity<List<consultVO>>(list,
	 * HttpStatus.OK); }
	 */
	

	
	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기 */

	@GetMapping("/salesList")
	public String salesList(Model model) {
		log.info("salesList_success");

		model.addAttribute("consultVO", salesService.salesList());

		return "/company/custMgmtPage/salesMgmt/salesList";

	}

	/** 'salesView.jsp' 에서 상담 신청 내용 가져오기 */
	@GetMapping("/salesView")
	public String salesView(int consultNo, Model model) {
		log.info("salesView_success" + consultNo);
		model.addAttribute("consultVO", salesService.salesView(consultNo));

		return "/company/custMgmtPage/salesMgmt/salesView";

	}



	/** 'salesView.jsp' 에서 영업 내용, 영업 히스토리 저장(수정)하기 */
		  @PostMapping("/saveSales")
		  public String saveSales(consultVO vo, RedirectAttributes rttr) {
			  log.info("saveSales...." + vo);

			  salesService.saveSales(vo);
			  
				rttr.addFlashAttribute("result","success");


			  return "redirect:/salesList";

		  }

}
