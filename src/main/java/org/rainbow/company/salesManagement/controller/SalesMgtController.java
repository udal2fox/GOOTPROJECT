package org.rainbow.company.salesManagement.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SalesMgtController 
{
	@GetMapping("/moveSalesChart")
	public String moveSalesChart()
	{
		return "/company/salesChart";
	}
}
