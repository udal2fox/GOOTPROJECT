package org.rainbow.company.salesManagement.controller;


import java.util.List;

import org.rainbow.company.salesManagement.domain.monthChartVO;
import org.rainbow.company.salesManagement.domain.salesComVO;
import org.rainbow.company.salesManagement.service.salesMgtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SalesMgtController 
{
	
	@Autowired
	salesMgtService sms;
	
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
	
	@GetMapping("/moveSalesStatsCom")
	public String moveSalesStatsCom(Model model)
	{
		List<salesComVO> list = sms.salesComList();
		model.addAttribute("list", list );
		
		return "/company/salesMGTpage/salesStatsCom";
	}
	
}
