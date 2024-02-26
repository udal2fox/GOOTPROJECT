package org.rainbow.company.employeeSupervisePage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class employeeSupervisePageController {
	
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
