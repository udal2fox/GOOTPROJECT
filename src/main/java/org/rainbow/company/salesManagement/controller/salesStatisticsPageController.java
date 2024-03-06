package org.rainbow.company.salesManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class salesStatisticsPageController {

	@GetMapping("/salesStatsView")
	public String salesStatisticsPage() {

		return "/company/salesStatisticsPage/salesStatsView";
	}
	
	@GetMapping("/salesStatsViewCompanyname")
	public String salesStatsViewCompanyname() {
		
		return "/company/salesStatisticsPage/salesStatsViewCompanyname";
	}

}
