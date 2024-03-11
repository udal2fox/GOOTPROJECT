package org.rainbow.userAdminPage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rainbow.userAdminPage.service.userAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes
@RequestMapping("/userAdminPage/*")
@Log4j
public class UserAdminController {

	@Autowired
	private userAdminServiceImpl userService;

	// 최초 접근 시
	@GetMapping("/userLogin")
	public String userLogin() {
		return "userAdminPage/userLogin";
	}

	// 사용자 로그인
	@ResponseBody
	@PostMapping(value = "/adminLogin", consumes = "application/json", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<HashMap<String, Object>> customerLogin(@RequestBody HashMap<String, String> userMap,
			HttpServletRequest req) {

		// 요청 정보 담을 맵 생성
		HashMap<String, String> inputMap = new HashMap<String, String>();
		// 맵에 정보 담기
		inputMap.put("userEmail", (String) userMap.get("userEmail"));
		inputMap.put("userPw", (String) userMap.get("userPw"));
		log.info("input info..." + inputMap); // 담긴 정보 확인

		// 결과 정보 담을 맵 생성
		HashMap<String, Object> resultMap = userService.customerLogin(inputMap);
		log.info("result info..." + resultMap); // 결과 정보 확인

		// 결과 정보 판단 후 status 및 추가작업
		if (resultMap == null) {
			return ResponseEntity.badRequest().body(null);
		} else {
			// 세션 생성 및 필요 정보 세션 저장
			HttpSession session = req.getSession();
			session.setAttribute("userName", (String) resultMap.get("userName"));
			session.setAttribute("spotNo", (Integer) resultMap.get("spotNo"));
			session.setMaxInactiveInterval(60 * 15);

			return ResponseEntity.ok().body(resultMap);
		}
	}

	// 사용자 로그아웃
	@GetMapping("/goLogout")
	public String goLogout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.invalidate();
		return "/userAdminPage/userLogin";
	}

	// 사용자 개인정보 수정페이지 이동
	@GetMapping("/userEdit/{no}")
	public String userEdit(@PathVariable String no, Model model) {
		int spotNo = Integer.parseInt(no);
		HashMap<String, Object> userMap = userService.getUserInfo(spotNo);
		model.addAttribute("result", userMap);
		return "/userAdminPage/userEdit";
	}

	// 사용자 개인정보 업데이트
	@ResponseBody
	@PostMapping("/updateUserInfo/{no}")
	public ResponseEntity<String> updateUserInfo(@RequestBody HashMap<String, Object> updateInfo,
			@PathVariable String no) {
		int spotNo = Integer.parseInt(no);
		updateInfo.put("spotNo", spotNo);
		log.info("updateInfo..." + updateInfo);
		int result = userService.updateUserInfo(updateInfo);
		System.out.println("업데이트 결과값: " + result);
		if (result > 0) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}

	// dashboard 정보 가져오기
	@GetMapping("/goDashboard/{no}")
	public String getDashboard(@PathVariable String no, Model model) {
		int spotNo = Integer.parseInt(no);
		HashMap<String, Object> dashboardMap = userService.getDashboard(spotNo);
		log.info("infoMap..." + dashboardMap);
		model.addAttribute("result", dashboardMap);
		return "/userAdminPage/dashboard";
	}

	// 직원관리 페이지 이동
	@GetMapping("/goManagemember")
	public String goManagemember() {
	    return "/userAdminPage/manage_member";
	}
	
    @GetMapping(value="/manage_member/{no}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<HashMap<String, Object>>> getEmpList(@PathVariable String no) {
        int sNo = Integer.parseInt(no);
        // 컨트롤러에서 서비스를 호출하여 직원 리스트를 가져옵니다.
        List<HashMap<String, Object>> empList = userService.getEmpList(sNo);
        log.info("empList..." + empList);
        // ResponseEntity에 직원 리스트와 HttpStatus를 담아 반환합니다.
        return new ResponseEntity<>(empList, HttpStatus.OK);
    }
    
    @PostMapping(value="/addEmp", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    public ResponseEntity<String> addUserEmp(@RequestBody HashMap<String, Object> addForm) {
        log.info("InquiryList..." + addForm);
        boolean result = userService.addUserEmp(addForm);
        System.out.println(result);
        return result == true ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
    }
	
	
	// 이용현황 페이지 이동
	@GetMapping("/goUsagehistorylist/{no}")
	public String goUsagehistorylist(@PathVariable String no, Model model) {
		return "/userAdminPage/usageHistory_list";
	}

	// 고객지원 페이지 이동
	@GetMapping("/goInquiryboard/{no}")
	public String goInquiryboard(@PathVariable String no, Model model) {
		return "/userAdminPage/inquiryBoard";
	}
	
	// 고객지원 문의 리스트 가져오기
	@ResponseBody
	@GetMapping(value="/getInquiryboard/{no}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<HashMap<String, Object>>> getInquiryList(@PathVariable String no){
		int spotNo = Integer.parseInt(no);
		// 컨트롤러에서 서비스를 호출하여 문의 리스트를 가져옵니다.
		List<HashMap<String, Object>> InquiryList = userService.getInquiryList(spotNo);
		log.info("InquiryList..." + InquiryList);
		return new ResponseEntity<>(InquiryList,HttpStatus.OK);
	}
	
	// 고객지원 문의글 등록하기
	@PostMapping("/addQnA/{no}")
	public String addQnA(@RequestParam("inquiryTitle") String inquiryTitle, @RequestParam("customMessege") String customMessege, @PathVariable("no") String spotNo) {
		HashMap<String, Object> addQnAMap = new HashMap<String, Object>();
		addQnAMap.put("questionTitle", inquiryTitle);
		addQnAMap.put("questionContent", customMessege);
		addQnAMap.put("spotNo", Integer.parseInt(spotNo));
		boolean result = userService.addQnA(addQnAMap);
		log.info("addQnA..." + result);
		return "/userAdminPage/inquiryBoard";
	}

	// 선물관리 페이지 이동
	@GetMapping("/goManagegift/{no}")
	public String goManagegift(@PathVariable String no, Model model) {
		return "/userAdminPage/manage_gift";
	}

	// 생일카드관리 페이지 이동
	@GetMapping("/goManagecard/{no}")
	public String goManagecard(@PathVariable String no, Model model) {
		return "/userAdminPage/manage_card";
	}

	// 이번달 대상자 현황 페이지 이동
	@GetMapping("/goManagerecipients/{no}")
	public String goManagerecipients(@PathVariable String no, Model model) {
		return "/userAdminPage/manage_recipients";
	}

}
