package org.rainbow.userAdminPage.controller;

import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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

	// userAdminPage 로그인
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

	// userAdminPage 로그아웃
	@GetMapping("/goLogout")
	public String goLogout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.invalidate();
		return "/userAdminPage/userLogin";
	}

	// 고객관리자 개인정보 수정페이지 이동
	@GetMapping("/userEdit/{no}")
	public String userEdit(@PathVariable String no, Model model) {
		
		return "/userAdminPage/userEdit";
	}

	// dashboard 정보 가져오기
	@GetMapping("/goDashboard/{no}")
	public String getDashboard(@PathVariable String no, Model model) {
		int spotNo = Integer.parseInt(no);
		HashMap<String, Object> infoMap = userService.getDashboard(spotNo);
		log.info("infoMap..." + infoMap);
		model.addAttribute("result", infoMap);
		return "/userAdminPage/dashboard";
	}

	// 직원관리 페이지 이동
	@GetMapping("/goManagemember/{no}")
	public String goManagemember(@PathVariable String no, Model model) {
		return "/userAdminPage/manage_member";
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
