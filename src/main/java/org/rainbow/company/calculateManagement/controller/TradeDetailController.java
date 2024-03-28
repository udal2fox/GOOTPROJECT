package org.rainbow.company.calculateManagement.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rainbow.company.calculateManagement.domain.TradeDetailEditVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.rainbow.company.calculateManagement.domain.tdDownVO;
import org.rainbow.company.calculateManagement.domain.ucBranchDownVO;
import org.rainbow.company.calculateManagement.domain.ucComDownVO;
import org.rainbow.company.calculateManagement.service.TradeDetaiServiceImpl;
import org.rainbow.domain.ExcelDownloadUtil;
import org.rainbow.domain.MailSender;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TradeDetailController {

	@Autowired
	TradeDetaiServiceImpl tService;
	
	
	// 거래 명세 페이지 이동 
	@GetMapping(value = "/TradeDetailPage")
	public String orderStatementPage(Model model)
	{
		List<TradeDetailListVO> list = tService.tradeDetailList();
		
		model.addAttribute("list", list);
		
		return "/company/calculateMGTpage/TradeDetailPage";
	}
	
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
		 if (recNo.isEmpty()) {
		        return ResponseEntity.ok("Fail");
		    }
		
		int result = tService.bigHandProcessing(recNo);
		log.info(result);
		
		if(result >= 1 )
		return ResponseEntity.ok("Success");
		else  return ResponseEntity.ok("Fail");
	}
	
	 /** 엑셀 데이터 다운로드 처리*/
    @ResponseBody
    @PostMapping("/tdExcelDown")
    public void tdExcelDown(HttpServletResponse response, @RequestBody TradeDetailSearchDTO sdto) throws IOException 
    {
    	log.info(sdto);
    	 
    	List<tdDownVO> downlist = tService.tdDownList(sdto);
    	
    	log.info(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
	 
    /** 거래명세 수정 창으로 이동 */
    @GetMapping("/tradeDetailEdit")
    public String moveTDEdit(Model model, @RequestParam("recNo") String recNo, HttpSession session)
    {
    	
    	String eName = (String) session.getAttribute("eName");
		model.addAttribute("eName", eName);
    	
    	
    	TradeDetailEditVO tdevo = tService.editTdList(recNo);
    	model.addAttribute("edit", tdevo);
    	model.addAttribute("recNo", recNo);
    	log.info(tdevo);
    	
    	return "/company/calculateMGTpage/TradeDetailEditVO";
    }
	
    /** 거레 명세 수정  */
    @ResponseBody
    @PostMapping(value = "/TdEdit.do", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> tdEditDo(@RequestBody TradeDetailEditVO vo)
    {
    	
    	log.info(vo);
    	
    	
    	int result = tService.editTdupdate(vo);
    	
    	if(result >= 1 )
    	return ResponseEntity.ok("Success");
    	else  return ResponseEntity.ok("Fail");
    	
    }
    
    //미수 관리 시작
    // 미수관리 기업 리스트
    @RequestMapping(value = "/unrecoveredMGT", method = RequestMethod.GET)
	public String comMgt(Model model) {
		
    	List<TradeDetailListVO> tdlvo = tService.ucCompany();
    	
    	
    	log.info(tdlvo);
    	
    	model.addAttribute("pst", "기업");
    	model.addAttribute("ucList", tdlvo);
    	
		return "/company/calculateMGTpage/unrecoveredMGTCompany";
	}
    
    // 미수관리 기업 서치
    @ResponseBody
    @PostMapping(value = "/ucComSearch.do" ,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<TradeDetailListVO>> ucComSearch(@RequestBody TradeDetailSearchDTO tdDTO)
    {
    	
    	log.info(tdDTO);
		List<TradeDetailListVO> list = tService.ucComSearch(tdDTO);
		log.info(list);
    	return new ResponseEntity<List<TradeDetailListVO>>(list, HttpStatus.OK);
    }
    
    // 미수관리 기업 다운로드
    @ResponseBody
    @PostMapping("/ucComDown")
    public void ucComExcelDown(HttpServletResponse response, @RequestBody TradeDetailSearchDTO sdto) throws IOException 
    {
    	System.out.println(sdto);
    	 
    	List<ucComDownVO> downlist = tService.ucComDown(sdto);
    	
    	log.info(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    // 기업 미수금 메일 전송
    @ResponseBody
    @PostMapping(value = "/ucComMailSend", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> ucMailSend(@RequestBody List<TradeDetailListVO> vo)
    {
    	if(	!vo.isEmpty()) 
    	{
	    	for(TradeDetailListVO em : vo)
	    	{
	    		String receiver = "wns1923@naver.com"; 			// 메일 받을 주소 확인하기 위해 일단고정
	            String title = "미수금 알림입니다.";
	            String content = "<h2>안녕하세요 rianbow 재무팀입니다.</h2><br>"+em.getComName()+ " 기업의 미수금은  : "+em.getRecSum() + "원 입니다 " + 
	            " 문의사항이 있으시면 언제든지 연락주세요.\n" + "감사합니다." ;
//	            String content = "<div style='position: relative;'>" +
//	            	    "<img width=\"94\" height=\"94\" src=\"https://img.icons8.com/3d-fluency/94/gift.png\" alt=\"gift\"/>" +
//	            	    "<div style='position: absolute; top: 0; left: 0; width: 100%; text-align: center;'>" +
//	            	    "<p style='background-color: rgba(255, 255, 255, 0.7); padding: 10px;'>"+
//	            	    "<Rainbow BirthDay> '" + em.getComName() + "'에서 보낸 '" + em.getRecSum() + "' 의 생일선물이 도착하였습니다.</p>" +
//	            	    "</div>" +
//	            	    "</div>";

	            MailSender.sendEmail(receiver, title, content);
	    	}
	    	return ResponseEntity.ok("Success");
    	}
    	else
    	{
    		return ResponseEntity.ok("fali");
    	}
    	
    }
    
    // 미수관리 지점 리스트 이동
    @RequestMapping(value = "/unrecoveredMGTbranch", method = RequestMethod.GET)
   	public String branchMgt(Model model) {
   		
       	List<TradeDetailListVO> tdlvo = tService.ucBranchList();
       	
       	log.info(tdlvo);
       	model.addAttribute("pst", "지점");
       	model.addAttribute("ucList", tdlvo);
       	
   		return "/company/calculateMGTpage/unrecoveredMGTbranch";
   	}
    
    // 미수관리 기업 서치
    @ResponseBody
    @PostMapping(value = "/ucbranchSearch.do" ,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<TradeDetailListVO>> ucbranchSearch(@RequestBody TradeDetailSearchDTO tdDTO)
    {
    	
    	log.info(tdDTO);
		List<TradeDetailListVO> list = tService.ucBranchSearch(tdDTO);
				
		log.info(list);
    	return new ResponseEntity<List<TradeDetailListVO>>(list, HttpStatus.OK);
		
    }
    
    // 미수관리 기업 다운로드
    @ResponseBody
    @PostMapping("/ucbranchDown")
    public void ucbranchExcelDown(HttpServletResponse response, @RequestBody TradeDetailSearchDTO sdto) throws IOException 
    {
    	System.out.println(sdto);
    	 
    	List<ucBranchDownVO> downlist = tService.ucBranchDown(sdto);
    	
    	log.info(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    
    // 미수관리 거래명세 리스트 이동
    @RequestMapping(value = "/unrecoveredMGTtd", method = RequestMethod.GET)
   	public String tdMgt(Model model) {
   		
       	List<TradeDetailListVO> tdlvo = tService.uctdList();
       	
       	log.info(tdlvo);
       	model.addAttribute("pst", "거래명세");
       	model.addAttribute("ucList", tdlvo);
       	
   		return "/company/calculateMGTpage/unrecoveredMGTtd";
   	}
    // 미수관리 기업 서치
    @ResponseBody
    @PostMapping(value = "/ucTdSearch.do" ,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<TradeDetailListVO>> ucTdSearch(@RequestBody TradeDetailSearchDTO tdDTO)
    {
    	
    	log.info(tdDTO);
		List<TradeDetailListVO> list = tService.ucTdSearch(tdDTO);
				
		log.info(list);
    	return new ResponseEntity<List<TradeDetailListVO>>(list, HttpStatus.OK);
		
    }
    
    // 미수관리 기업 다운로드
    @ResponseBody
    @PostMapping("/ucTdDown")
    public void ucTdExcelDown(HttpServletResponse response, @RequestBody TradeDetailSearchDTO sdto) throws IOException 
    {
    	System.out.println("거래명세기준"+sdto);
    	 
    	List<tdDownVO> downlist = tService.ucTdDown(sdto);
    	
    	log.info(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    //------------ 계산서 발행 ㄱㄱ
    
    @GetMapping("/moveIoBill")
    public String moveIoBill(Model model)
	{
		List<TradeDetailListVO> list = tService.IoBillList();
		
		model.addAttribute("list", list);
		log.info("list...."+list);
		
		return "/company/calculateMGTpage/issuanceOfBill";
	}
    
	
	// 계산서 발행 처리
	@ResponseBody
	@PostMapping(value = "/billMake.do", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> billMake (@RequestBody List<String> recNo) {
		log.info(recNo);
		 if (recNo.isEmpty()) {
		        return ResponseEntity.ok("Fail");
		    }
		
		int result = tService.bigHandProcessing(recNo);
		log.info(result);
		
		if(result >= 1 )
		return ResponseEntity.ok("Success");
		else  return ResponseEntity.ok("Fail");
	}
	
	// 계산서 발행 서치
	@ResponseBody
	@PostMapping(value = "iofBillSearch.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	 public ResponseEntity<List<TradeDetailListVO>> iofBillSearch(@RequestBody TradeDetailSearchDTO tdDTO)
    {
    	
    	log.info(tdDTO);
		List<TradeDetailListVO> list = tService.ucBranchSearch(tdDTO);
				
		log.info(list);
    	return new ResponseEntity<List<TradeDetailListVO>>(list, HttpStatus.OK);
		
    }
    
    
    
}
