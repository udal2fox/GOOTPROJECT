package org.rainbow.company.orgChart.controller;

import java.util.List;

import org.rainbow.company.orgChart.domain.orgChartDTO;
import org.rainbow.company.orgChart.service.orgChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class orgChartController {
	
	@Autowired
	orgChartService service;
	
	// 조직도 차트 가져오기
	@GetMapping("/orgchart")
	public String orgChart(Model model) {
		
		
		  List<orgChartDTO> orgchart = service.getChart(); 
		  log.info("orgChart..." + orgchart);
		  
		  model.addAttribute("chart", orgchart);
		 
		
		return "/company/orgchart";
	}
}
