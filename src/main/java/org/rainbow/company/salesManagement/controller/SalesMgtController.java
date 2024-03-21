package org.rainbow.company.salesManagement.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.rainbow.company.salesManagement.domain.monthChartVO;
import org.rainbow.company.salesManagement.domain.salasTotalVO;
import org.rainbow.company.salesManagement.domain.salesComVO;
import org.rainbow.company.salesManagement.domain.salesPrdVO;
import org.rainbow.company.salesManagement.service.salesMgtService;
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

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SalesMgtController 
{
	
	@Autowired
	salesMgtService sms;
	// 차트 Start
	@GetMapping("/moveSalesChart")
	public String moveSalesChart()
	{
		return "/company/salesChart";
	}
	
	
	@ResponseBody
	@GetMapping(value = "/month_sals", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<monthChartVO>> month_sale()
	{
		
		List<monthChartVO> list = sms.monthChartData();
		log.info(list);
		
		return new ResponseEntity<List<monthChartVO>>(list, HttpStatus.OK);
				
	}	
	
	@ResponseBody
	@GetMapping(value = "/quarter_sals", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<monthChartVO>> quarter_sale()
	{
		
		List<monthChartVO> list = sms.quarterChartData();
		log.info(list);
		
		return new ResponseEntity<List<monthChartVO>>(list, HttpStatus.OK);
		
	}
	// 차트 END
	
	/** 기업 통계 페이지 이동*/
	@GetMapping("/moveSalesStatsCom")
	public String moveSalesStatsCom(Model model)
	{
		List<salesComVO> list = sms.salesComList();
		salasTotalVO stvo = sms.salesTotal();
		model.addAttribute("list", list );
		model.addAttribute("stvo", stvo);
		
		return "/company/salesMGTpage/salesStatsCom";
	}
	
	 /** 기업 통계 엑셀 데이터 다운로드 처리*/
    @ResponseBody
    @PostMapping("/smgtComDown")
    public void smgtComDown(HttpServletResponse response, @RequestBody TradeDetailSearchDTO sdto) throws IOException 
    {
    	log.info(sdto);
    	 
    	List<salesComVO> downlist = sms.salesComDown(sdto);
    	
    	log.info(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    /** vat 서치  */
    @ResponseBody
	@PostMapping(value = "/comVatSearch", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<salasTotalVO> comVatSearch(@RequestBody TradeDetailSearchDTO sdto)
	{
    	log.info(sdto);
		salasTotalVO list = sms.salesVatTotal(sdto);
		log.info(list);
		
		return new ResponseEntity<salasTotalVO>(list, HttpStatus.OK);
				
	}	
    
    /** 기업통계 서치  */
    @ResponseBody
	@PostMapping(value = "/saleComSearch", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<salesComVO>> saleComSearch(@RequestBody TradeDetailSearchDTO sdto)
	{
    	log.info(sdto);
		List<salesComVO> list = sms.salesComSearch(sdto);
		log.info(list);
		
		return new ResponseEntity<List<salesComVO>>(list, HttpStatus.OK);
				
	}
    
    /** 기업 통계 페이지 이동*/
	@GetMapping("/moveSalesStatsPrd")
	public String moveSalesStatsPrd(Model model)
	{
		List<salesPrdVO> list = sms.salesPrdList();
		salasTotalVO stvo = sms.salesTotal();
		model.addAttribute("list", list );
		model.addAttribute("stvo", stvo);
		
		return "/company/salesMGTpage/salesStatsPrd";
	}
	
	/** 상품별 통계 엑셀 데이터 다운로드 처리*/
    @ResponseBody
    @PostMapping("/smgtPrdDown")
    public void smgtPrdDown(HttpServletResponse response, @RequestBody TradeDetailSearchDTO sdto) throws IOException 
    {
    	log.info(sdto);
    	 
    	List<salesPrdVO> downlist = sms.salesPrdDown(sdto);
    	
    	log.info(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    /** 상품통계통계 서치  */
    @ResponseBody
	@PostMapping(value = "/salesPrdSearch", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<salesPrdVO>> salePrdSearch(@RequestBody TradeDetailSearchDTO sdto)
	{
    	log.info(sdto);
		List<salesPrdVO> list = sms.salesPrdSearch(sdto);
		log.info(list);
		
		return new ResponseEntity<List<salesPrdVO>>(list, HttpStatus.OK);
				
	}
	
}
