package org.rainbow.company.custMgmt.controller;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.rainbow.company.custMgmt.domain.companyVO;
import org.rainbow.company.custMgmt.service.companyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class companyController {

	@Autowired
	private companyServiceImpl companyService;

	/** 'companyList.jsp' 에서 기업 리스트 가져오기 */
	@GetMapping("/companyList")
	public String companyList(Model model) {

		log.info("companyList_success");

		model.addAttribute("companyVO", companyService.companyList());

		return "/company/custMgmtPage/companyMgmt/companyList";

	}

	/** 'companyList.jsp' 에서 기업 등록 버튼 누르면 'companyRegister.jsp'로 이동 */
	@GetMapping("/moveCompanyRegister")
	public String moveCompanyRegister() {
		log.info("moveCompanyRegister_success");
		return "/company/custMgmtPage/companyMgmt/companyRegister";

	}

	/** 'companyView.jsp' 에서 기업 정보 가져오기 */
	@GetMapping("/companyView")
	public String companyView(int companyNo, Model model) {

		log.info("companyView_success" + companyNo);

		model.addAttribute("companyVO", companyService.companyView(companyNo));

		return "/company/custMgmtPage/companyMgmt/companyView";

	}


	/** 'companyRegister.jsp' 에서 기업 정보 저장하기 */
	@PostMapping("/companyRegisterInsert")
	public String companyRegisterInsert(companyVO vo, RedirectAttributes rttr) {
		log.info("companyRegisterInsert_success");
		log.info("companyRegisterInsert_success" + vo);
		
		companyService.companyRegister(vo);
		

		
		rttr.addFlashAttribute("result","success");
		
		return "redirect:/companyList";
	}

	
	
	

	/** 사업자등록증 파일 업로드 */
	@PostMapping("/uploadFile")
	public ResponseEntity<String> handleFileUpload(@RequestPart("file") MultipartFile file) {
		// 파일 업로드 로직을 수행하고, 파일명을 얻을 수 있습니다.
		String fileName = file.getOriginalFilename();

		// 파일명을 클라이언트로 전송하거나 필요한 로직을 수행합니다.
		return new ResponseEntity<>(fileName, HttpStatus.OK);
	}



	@ResponseBody
	@PostMapping(value = "/checkBizNum", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<companyVO>> checkBizNum(@RequestBody List<String> bizNumArray) {
		// 여기서 bizNumArray를 이용하여 국세청 API를 호출하고 결과를 리턴하는 코드 작성
		// YourResultType은 API 호출 결과에 따라 적절한 형태로 변경해야 합니다.

		List<companyVO> result = companyService.checkBizNum(bizNumArray);

		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
