package org.rainbow.company.employeeSupervisePage.controller;

import javax.servlet.http.HttpServletRequest;

import org.rainbow.company.employeeSupervisePage.domain.insert_employeeDTO;
import org.rainbow.company.employeeSupervisePage.service.searchEmployeeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class employeeSupervisePageController {

	@Autowired
	searchEmployeeServiceImpl service;

	// 직원 정보 등록 페이지 이동
	@GetMapping("/employee_insert")
	public String employee_insert() {
		return "/company/employeeSupervisePage/employee_insert";
	}
	
	// 직원 정보 등록
	@PostMapping(value = "/employee_insert")
	public String insert(HttpServletRequest request, RedirectAttributes rttr ) {
		
		
		  insert_employeeDTO dto = new insert_employeeDTO();
		  
		  dto.setDeptNo(Integer.parseInt(request.getParameter("deptNo")));
		  dto.setEName(request.getParameter("eName"));
		  dto.setDName(request.getParameter("dName"));
		  dto.setEmail(request.getParameter("email"));
		  dto.setJob(request.getParameter("job"));
		  dto.setEAddr(request.getParameter("eAddr"));
		  dto.setEAddr2(request.getParameter("eAddr2"));
		  dto.setEPhone(request.getParameter("ePhone"));
		  dto.setWorkType(request.getParameter("workType"));
		  dto.setEBank(request.getParameter("eBank"));
		  dto.setIdentyNum(request.getParameter("identyNum"));
		  dto.setSal(Integer.parseInt(request.getParameter("sal")));
		  dto.setSalAccount(request.getParameter("salAccount"));
		  dto.setIdStatus(request.getParameter("idStatus"));
		 
		
		log.info("insert..." + dto);
		System.out.println("ssssss");
		service.insert(dto);
		
		rttr.addFlashAttribute("result" , "success");
		//RedirectAttributes rttr 
		//redirect:
		return "redirect:/searchEmployee";
	}
	
	// 직원 정보 편집 페이지
	@GetMapping("/employee_modify")
	public String employee_modify(@RequestParam("eno") int eno, Model model) {
		
			log.info("get..." + service.get(eno));
			System.out.println(service.get(eno));
			
			model.addAttribute("vo", service.get(eno));
			
			return "/company/employeeSupervisePage/employee_modify";
	}
		
	// 프로필 편집 페이지
	@GetMapping("/profile_modify")
	public String profile_modify() {
		return "/company/employeeSupervisePage/profile_modify";
	}

	// 직원 조회 페이지
	@GetMapping("/searchEmployee")
	public String searchEmployee(Model model) {

		 log.info("getList..." + service.getList());
		 System.out.println(service.getList());
		  
		 model.addAttribute("list", service.getList());
		 //전체 직원 수 
		 int total = service.getTotal(); 
		 log.info("total...." + total);
		
		return "/company/employeeSupervisePage/searchEmployeePage";
	}
}
