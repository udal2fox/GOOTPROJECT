package org.rainbow.company.employeeSupervisePage.controller;

import org.rainbow.company.employeeSupervisePage.service.searchEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class employeeSupervisePageController {
	
	
	 @Autowired 
	 private searchEmployeeService service;
	 
	
	@GetMapping("/employee_insert")
	public String employee_insert() {
		return "/company/employeeSupervisePage/employee_insert";
	}
	
	@GetMapping("/employee_modify")
	public String employee_modify() {
		return "/company/employeeSupervisePage/employee_modify";
	}
	
	@GetMapping("/profile_modify")
	public String profile_modify() {
		return "/company/employeeSupervisePage/profile_modify";
	}
	
	@GetMapping("/searchEmployee")
	public String searchEmployee() {
		return "/company/employeeSupervisePage/searchEmployeePage";
	}
}
