package org.rainbow.company.employeeSupervisePage.controller;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.service.searchEmployeeService;
import org.rainbow.domain.Criteria;
import org.rainbow.domain.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class employeeSupervisePageController {

	@Autowired
	private searchEmployeeService service;

	// 직원 정보 등록 페이지
	@GetMapping("/employee_insert")
	public String employee_insert() {
		return "/company/employeeSupervisePage/employee_insert";
	}

	// 직원 정보 편집 페이지
	@GetMapping("/employee_modify")
	public String employee_modify() {
		return "/company/employeeSupervisePage/employee_modify";
	}

	// 프로필 편집 페이지
	@GetMapping("/profile_modify")
	public String profile_modify() {
		return "/company/employeeSupervisePage/profile_modify";
	}

	// 직원 조회 페이지
	@GetMapping("/searchEmployee")
	public String searchEmployee(Model model, Criteria cri) {
		log.info("list...");

		if (cri.getPageNum() == 0 && cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(10);
		}

		model.addAttribute("list", service.getList(cri));

		
		// 전체 직원 수 
		int total = service.getTotal(); 
		log.info("total...." + total);
		 
		 // PageDTO 객체 list 화면으로 전달 
		 model.addAttribute("pageMaker", new PageDTO(cri,total));
		 
		return "/company/employeeSupervisePage/searchEmployeePage";
	}
}
