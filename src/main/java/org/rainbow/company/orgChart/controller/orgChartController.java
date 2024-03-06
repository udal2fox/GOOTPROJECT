package org.rainbow.company.orgChart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class orgChartController {
	
	@GetMapping("/orgchart")
	public String orgChart() {
		return "/company/orgchart";
	}
}
