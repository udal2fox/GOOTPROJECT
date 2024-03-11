package org.rainbow.company.calculateManagement.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
<<<<<<< HEAD
import org.rainbow.company.calculateManagement.service.TradeDetaiServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
=======
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.rainbow.company.calculateManagement.domain.tdDownVO;
import org.rainbow.company.calculateManagement.service.TradeDetaiServiceImpl;
import org.rainbow.domain.ExcelDownloadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
>>>>>>> origin/master

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TradeDetailController {

	@Autowired
	TradeDetaiServiceImpl tService;
	
<<<<<<< HEAD
=======
	
	// 거래 명세 페이지 이동 
>>>>>>> origin/master
	@GetMapping(value = "/TradeDetailPage")
	public String orderStatementPage(Model model) {
		
		List<TradeDetailListVO> list = tService.tradeDetailList();
		
		model.addAttribute("list", list);
		
		
		return "/company/calculateMGTpage/TradeDetailPage";
	}
<<<<<<< HEAD
=======
	
	// 거레 명세 검색 
	@ResponseBody
	@PostMapping(value = "/TradeDetailSearch.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<TradeDetailListVO>> tdSearch(@RequestBody TradeDetailSearchDTO tdDTO)
	{
		log.info(tdDTO);
		List<TradeDetailListVO> list = tService.searchTd(tdDTO);
		log.info(list);
		return new ResponseEntity<List<TradeDetailListVO>>(list, HttpStatus.OK);
				
	}	
	
	// 결제완료처리
	@ResponseBody
	@PostMapping(value = "/Payment.do", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> Payment (@RequestBody List<String> recNo) {
  	log.info(recNo);
  	int result = tService.paymentProcessing(recNo);
  	log.info(result);
  	
  	if(result >= 1 )
    return ResponseEntity.ok("Success");
  	else  return ResponseEntity.ok("Fail");
	}
	  
	// 대손 처리 
	@ResponseBody
	@PostMapping(value = "/binHand.do", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> bigHand (@RequestBody List<String> recNo) {
	log.info(recNo);
	int result = tService.bigHandProcessing(recNo);
	log.info(result);
	
	if(result >= 1 )
	return ResponseEntity.ok("Success");
	else  return ResponseEntity.ok("Fail");
	}
	
	 /** 엑셀 데이터 다운로드 처리*/
    @ResponseBody
    @PostMapping("/tdExcelDown")
    public void tdExcelDown(HttpServletResponse response, @RequestBody List<String> checkValues) throws IOException 
    {
    	System.out.println(checkValues);

    	 
    	List<tdDownVO> downlist = tService.tdDownList(checkValues);
    	
    	log.info(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
	 
    /** 거래명세 수정 창으로 이동 */
    @GetMapping("/tradeDetailEdit")
    public String moveTDEdit(Model model)
    {
    	return "/company/calculateMGTpage/TradeDetailEditVO";
    }
    
	
	
>>>>>>> origin/master
}
