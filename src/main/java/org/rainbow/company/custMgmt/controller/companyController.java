package org.rainbow.company.custMgmt.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.rainbow.company.custMgmt.domain.AttachFileDTO;
import org.rainbow.company.custMgmt.domain.companySearchDTO;
import org.rainbow.company.custMgmt.domain.companyVO;

import org.rainbow.company.custMgmt.service.companyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class companyController {

	@Autowired
	companyServiceImpl companyService;

	/** 'companyList.jsp' 에서 기업 리스트 가져오기 */
	@GetMapping("/companyList")
	public String companyList(Model model) {

		log.info("companyList_success");

		model.addAttribute("companyVO", companyService.companyList());

		return "/company/custMgmtPage/companyMgmt/companyList";

	}

	@ResponseBody
	@RequestMapping(value ="/searchCompanyList" , method = RequestMethod.POST)
	public ResponseEntity<List<companyVO>> searchCompanyList(@RequestBody companySearchDTO companySearchDTO) {
		log.debug("searchCompanyList");
		
		log.info("검색"+ companySearchDTO);

	    List<companyVO> list = companyService.getSearch(companySearchDTO);
	    log.info(list);
	    
	    return new ResponseEntity<List<companyVO>>(list, HttpStatus.OK);
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



	/** 사업자등록증 파일 업로드1 */
	@PostMapping("/uploadFile")
	public ResponseEntity<String> handleFileUpload(@RequestPart("file") MultipartFile file) {
		// 파일 업로드 로직을 수행하고, 파일명을 얻을 수 있습니다.
		String fileName = file.getOriginalFilename();

		// 파일명을 클라이언트로 전송하거나 필요한 로직을 수행합니다.
		return new ResponseEntity<>(fileName, HttpStatus.OK);
	}
	
	
	/** 사업자등록증 파일 업로드2 */
	@ResponseBody 
	@PostMapping(value="/uploadAsyncAction", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<AttachFileDTO>> uploadAsyncPost(MultipartFile[] uploadFile, Model model) {
		List<AttachFileDTO> list = new ArrayList<AttachFileDTO>();
		
		//log.info(list);
		
		log.info("upload async post.........");
		//make Folder--------------------------
		
		File uploadPath = new File("C:\\upload",getFolder());
		log.info("uploadPath : " + uploadPath);
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		//make yyyy/MM/dd folder
		for(MultipartFile file : uploadFile) {
			
			//파일 정보를 담을 AttachFileDTO 객체 생성
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			//log.info("upload Async post");
			//log.info("upload File Name : " + file.getOriginalFilename());
			//log.info("upload File Size : " + file.getSize());
			
			
			String uploadFileName = file.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			//밀리초 단위를 랜덤값으로 사용함 = UUID
			
			//attachDTO에 저장
			attachDTO.setFileName(file.getOriginalFilename());
			attachDTO.setUploadPath(getFolder());
			attachDTO.setUuid(uuid.toString());
			
		     //log.info(attachDTO.getFileName());
			//log.info(attachDTO.getUploadPath());
			//log.info(attachDTO.getUuid());
			
			
			//-------------------여기까지 attachDTO에 저장
			//attachDTO에 저장된 값을 list에 넣어주기
			
			
			list.add(attachDTO);
			//log.info("ㅎㅇ" + list);
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				
				file.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}
			//여기까지 했을 때
			//동일한 파일을 올렸을 때 덮어쓰기
			//확장자 문제 가 있음
			//그건 JS단에서 처리해야함
			
			//썸네일 같은 건 혼자해봐라
			
		}//end loop
		


	return new ResponseEntity<List<AttachFileDTO>>(list,HttpStatus.OK ); 
	}//end uploadAsyncPost()

	
	


	@ResponseBody
	@PostMapping(value = "/checkBizNum", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<companyVO>> checkBizNum(@RequestBody List<String> bizNumArray) {
		// 여기서 bizNumArray를 이용하여 국세청 API를 호출하고 결과를 리턴하는 코드 작성
		// YourResultType은 API 호출 결과에 따라 적절한 형태로 변경해야 합니다.

		List<companyVO> result = companyService.checkBizNum(bizNumArray);

		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	
	//오늘 날짜의 경로를 문자열로 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

}
