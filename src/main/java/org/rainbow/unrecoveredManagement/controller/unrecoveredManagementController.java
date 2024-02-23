package org.rainbow.unrecoveredManagement.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class unrecoveredManagementController {

	@RequestMapping(value = "/unrecoveredManagement", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
//		return "/unrecoveredManagement/unrecoveredMgtCompany";
//		return "/unrecoveredManagement/unrecoveredMgtOrder";
		return "/unrecoveredManagement/unrecoveredMgtBranch";
	}
}
