package org.rainbow.company.employeeSupervisePage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rainbow.company.employeeSupervisePage.service.loginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@SessionAttributes
@Controller
public class login {
	
	@Autowired
	loginServiceImpl service;
	
	// 사원 로그인
	@ResponseBody
	@PostMapping( value="/login", consumes = "application/json", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<HashMap<String, Object>> doLogin(@RequestBody HashMap<String, String> loginMap,
			HttpServletRequest request){
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("eId", (String) loginMap.get("eId"));
		map.put("ePw", (String) loginMap.get("ePw"));
		log.info("input info..." + map);
		log.info("ePw..." + map);
		
		HashMap<String, Object> resultMap = service.doLogin(map);
		log.info("result info..." + resultMap); // 결과 정보 확인
        
		if (resultMap == null) {
			return ResponseEntity.badRequest().body(null);
		} else {
			// 세션 생성 및 필요 정보 세션 저장
			HttpSession session = request.getSession();
			session.setAttribute("deptNo", (Integer) resultMap.get("deptNo"));
			session.setAttribute("eno", (Integer) resultMap.get("eno"));
			session.setAttribute("eName", (String) resultMap.get("eName"));
			session.setAttribute("profilePicture", (String) resultMap.get("profilePicture"));

			return ResponseEntity.ok().body(resultMap);
		}
	}
	
	@GetMapping("/Gologout")
	public String Gologout(HttpServletRequest request) {
		
		// 현재 세션을 가져와서 초기화
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate(); // 세션 초기화
	    }
		
		return "/index";
	}
}
