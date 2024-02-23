package org.rainbow.salesStatisticsPage.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class salesStatisticsPageController {

	@RequestMapping(value = "/salesStatisticsPage", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		/* return "/salesStatisticsPage/salesStatsView"; */
		return "/salesStatisticsPage/salesStatsViewCompanyname";
	}
}
