package org.rainbow.company.employeeSupervisePage.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.http.HttpServletRequest;

import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
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
		
		  rain_EmpVO vo = new rain_EmpVO();
		  
		// dName 값을 받아옵니다.
		  String dName = request.getParameter("dName");

		// dName을 기반으로 deptNo를 결정합니다.
		    int deptNo;
		    switch (dName) {
		        case "인사":
		            deptNo = 1;
		            break;
		        case "재무":
		            deptNo = 2;
		            break;
		        case "영업":
		            deptNo = 3;
		            break;
		        case "상품":
		            deptNo = 4;
		            break;
		        case "대표":
		            deptNo = 0;
		            break;
		        default:
		            // 기본값 설정 혹은 오류 처리
		            deptNo = -1;
		            break;
		    }

		  vo.setDeptNo(deptNo);
		  vo.setEName(request.getParameter("eName"));
		  vo.setEmail(request.getParameter("email"));
		  vo.setJob(request.getParameter("job"));
		  vo.setEAddr(request.getParameter("eAddr"));
		  vo.setEAddr2(request.getParameter("eAddr2"));
		  vo.setEPhone(request.getParameter("ePhone"));
		  vo.setWorkType(request.getParameter("workType"));
		  vo.setEBank(request.getParameter("eBank"));
		  vo.setIdentyNum(request.getParameter("identyNum"));
		  vo.setSal(Integer.parseInt(request.getParameter("sal")));
		  vo.setSalAccount(request.getParameter("salAccount"));
		  vo.setIdStatus(request.getParameter("idStatus"));
		  		
		log.info("insert..." + vo);
		System.out.println("ssssss");
		service.insert(vo);
		
		rttr.addFlashAttribute("result" , "success");
		
		return "redirect:/searchEmployee";
	}
	
	// 직원 정보 편집 페이지
	@GetMapping("/employee_modify")
	public String employee_modify(@RequestParam("eno") int eno, Model model) {
			log.info("get..." + service.get(eno));
			
			rain_EmpVO vo = service.get(eno);
			
			String dName = "";

			switch (vo.getDeptNo()) {
			    case 1:
			        dName = "인사";
			        break;
			    case 2:
			        dName = "재무";
			        break;
			    case 3:
			        dName = "영업";
			        break;
			    case 4:
			        dName = "상품";
			        break;
			    case 0:
			        dName = "대표";
			        break;
			}

			System.out.println(vo);
			model.addAttribute("dName", dName);
			model.addAttribute("vo", vo);
			
			return "/company/employeeSupervisePage/employee_modify";
	}
	
	
	// 직원 정보 편집
	@PostMapping(value = "/employee_modify")
	public String update(HttpServletRequest request, RedirectAttributes rttr) {
		
		int eno = Integer.parseInt(request.getParameter("eno"));
	    rain_EmpVO vo = service.get(eno);
		
		vo.setDeptNo(Integer.parseInt(request.getParameter("deptNo")));
		vo.setJob(request.getParameter("job"));
		vo.setWorkType(request.getParameter("workType"));
		vo.setSal(Integer.parseInt(request.getParameter("sal")));
		vo.setIdStatus(request.getParameter("idStatus"));

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date endDate = null;
		String endDtString = request.getParameter("endDt");

		if (endDtString != null && !endDtString.isEmpty()) {
		    if ("-".equals(endDtString)) {
		        endDate = null;
		    } else {
		        try {
		            endDate = new java.sql.Date(dateFormat.parse(endDtString).getTime());
		        } catch (ParseException e) {
		            e.printStackTrace(); // 오류 처리
		        }
		    }
		}

		vo.setEndDt(endDate);

		service.update(vo);
		
		log.info("update..." + vo);
			
		rttr.addFlashAttribute("result" , "success");
		 
		return "redirect:/searchEmployee";
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
