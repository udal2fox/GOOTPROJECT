package org.rainbow.company.employeeSupervisePage.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rainbow.company.employeeSupervisePage.domain.EmployeeExcelDTO;
import org.rainbow.company.employeeSupervisePage.domain.EmployeeSearchDTO;
import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;
import org.rainbow.company.employeeSupervisePage.service.searchEmployeeServiceImpl;
import org.rainbow.domain.ExcelDownloadUtil;
import org.rainbow.domain.ImageUploader1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class employeeSupervisePageController {

	@Autowired
	searchEmployeeServiceImpl service;
	
	@Autowired
	private ImageUploader1 imageUploader;

	// 직원 조회 페이지
	@GetMapping("/searchEmployee")
	public String searchEmployee(Model model) {

	    // getList() 메서드 호출 시, Criteria 객체만을 인자로 전달
	    List<rain_employeeDTO> employeeList = service.getList(); 
		
		log.info("getList..." + employeeList);

		//전체 직원 수 
		int total = service.getTotal(); 
		log.info("total...." + total);
			 
		// PageDTO 객체 list 화면으로 전달
		model.addAttribute("list", employeeList);
	
		return "/company/employeeSupervisePage/searchEmployeePage";
	}
		
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
			 if (endDtString.matches("\\d{4}[.\\-]\\d{2}[.\\-]\\d{2}")) {
				 // "."을 "-"로 변경
			     endDtString = endDtString.replaceAll("[.]", "-"); 
			     // yyyyMMdd를 yyyy-MM-dd로 변경
			     endDtString = endDtString.replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1-$2-$3");
			    }
			 
		        try {
		            endDate = new java.sql.Date(dateFormat.parse(endDtString).getTime());
		        } catch (ParseException e) {
		            e.printStackTrace(); // 오류 처리
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
	public String profile_modify(HttpSession session, Model model) {
		
		// 세션에서 필요한 값들 가져오기
        Integer eno = (Integer) session.getAttribute("eno");
        
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

		model.addAttribute("dName", dName);
        model.addAttribute("vo", vo);
        
        log.info("move profilePage" + model);
		
		return "/company/employeeSupervisePage/profile_modify";
	}

	
/*	
	  // consumes = "application/json" @RequestParam("profilePicture") MultipartFile file 
	  // 프로필 편집
	  @ResponseBody
	  @PostMapping(value = "/profile_modify", consumes = "application/json",
	  produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	  public ResponseEntity<String> profile_update(@RequestBody HashMap<String, Object> result){
	  System.out.println(result);
		  
	  service.profile_update(result); 
	  System.out.println(result); 
	  return service.profile_update(result) == 1? 
			  new ResponseEntity<String>( "success", HttpStatus.OK ): 
				  new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		   }
}
*/	 
  // 이미지 포함 프로필 편집
  @ResponseBody
  @PostMapping(value = "/profile_modify", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, "multipart/form-data" }, 
  produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
  public ResponseEntity<String> profile_update(@RequestPart(value = "profilePicture", required = false) MultipartFile file,
		  									   @RequestParam("profilePicturePath") String profilePicturePath,
		  									   @RequestParam("eno") int eno,
		  									   @RequestParam("ePhone") String ePhone, 
		  									   @RequestParam("ePw") String ePw, 
		  									   @RequestParam("eAddr") String eAddr, 
		  									   @RequestParam("eAddr2") String eAddr2, 
		  									   @RequestParam("salAccount") String salAccount, 
		  									   @RequestParam("eBank") String eBank){ 
	  
	  log.info("profilePicturePath");
	  String imageUrl = null;

	  // 프로필 정보 설정
      HashMap<String, Object> result = new HashMap<>();
      
      result.put("eno", eno);
      
      result.put("ePhone", ePhone);
      log.info(result.get("ePhone"));
      
      result.put("ePw", ePw);
      log.info(result.get("ePw"));
      
      result.put("eAddr", eAddr);
      log.info(result.get("eAddr"));
      
      result.put("eAddr2", eAddr2);
      log.info(result.get("eAddr2"));
      
      result.put("salAccount", salAccount);
      log.info(result.get("salAccount"));
      
      result.put("eBank", eBank);
      log.info(result.get("eBank"));
	  
	  try {	
		  if (file != null && !file.isEmpty()) {
		        // 파일이 전송된 경우 이미지 업로드 수행
		        imageUrl = imageUploader.uploadImage(file);
		    } else if (file == null && profilePicturePath != null && !profilePicturePath.isEmpty()) {
		        // 파일이 전송되지 않고 이미지 URL이 전송된 경우
		        imageUrl = profilePicturePath;
		    } else {
		        // 파일과 이미지 URL이 모두 null인 경우
		        imageUrl = null;
		    }

		    // 프로필 이미지 URL 또는 파일 경로를 프로필 정보에 추가
		    result.put("profilePicture", imageUrl);
	        log.info(result.get("profilePicture"));
	        
	        // 프로필 업데이트
	        service.profile_update(result);    
	        log.info(result);
	        return new ResponseEntity<String>("success", HttpStatus.OK);
	    } catch (Exception e) { 
	        e.printStackTrace(); 
	        return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
	    } 
	}

// 프로필 사진만 저장하는 기능
@ResponseBody
@PostMapping(value = "/profilePictureUpdate", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, "multipart/form-data" }, 
produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
public ResponseEntity<String> profilePictureUpdate(@RequestPart(value = "profilePicture", required = false) MultipartFile file,
		 									 	   @RequestParam("eno") int eno,
		 									 	   @RequestParam("profilePicturePath") String profilePicturePath){
	
	 String imageUrl = null;

	  // 프로필 정보 설정
     HashMap<String, Object> result = new HashMap<>();
     
     result.put("eno", eno);
     
     try {	
		  if (file != null && !file.isEmpty()) {
		        // 파일이 전송된 경우 이미지 업로드 수행
		        imageUrl = imageUploader.uploadImage(file);
		    } else if (file == null && profilePicturePath != null && !profilePicturePath.isEmpty()) {
		        // 파일이 전송되지 않고 이미지 URL이 전송된 경우
		        imageUrl = profilePicturePath;
		    } else {
		        // 파일과 이미지 URL이 모두 null인 경우
		        imageUrl = null;
		    }

		    // 프로필 이미지 URL 또는 파일 경로를 프로필 정보에 추가
		    result.put("profilePicture", imageUrl);
	        log.info(result.get("profilePicture"));
	        
	        // 프로필 업데이트
	        service.profilePictureUpdate(result);    
	        log.info(result);
	        return new ResponseEntity<String>("success", HttpStatus.OK);
	    } catch (Exception e) { 
	        e.printStackTrace(); 
	        return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
	    } 
	}

	// 사원 리스트 엑셀
	@ResponseBody
	@PostMapping("/excelDown")
	public void excelDown(HttpServletResponse response, @RequestBody EmployeeSearchDTO empdto) throws IOException{
		
		log.info(empdto);
		
		List<EmployeeExcelDTO> downlist = service.excelDown(empdto);
		
		log.info(downlist);
		
		//리스트를 넣어서 엑셀화
		ExcelDownloadUtil.dowonloadUtill(response, downlist);
	}
}