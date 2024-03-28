package org.rainbow.company.custMgmt.controller;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;


import org.rainbow.company.custMgmt.domain.spotAttachFileDTO;
import org.rainbow.company.custMgmt.domain.companyDownVO;
import org.rainbow.company.custMgmt.domain.companyInputVO;

import org.rainbow.company.custMgmt.domain.companyVO;

import org.rainbow.company.custMgmt.service.companyServiceImpl;
import org.rainbow.domain.ExcelDownloadUtil;
import org.rainbow.domain.ExcelListener;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import lombok.extern.log4j.Log4j;
@CrossOrigin(origins = "<http://localhost:8080>")
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
	
	/** 서치바에서 키워드 검색 */
    @ResponseBody
    @GetMapping(value = "/searchCompany", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<companyVO>> prdSeach(@RequestParam("keyword") String keyword)
    {
        log.info("keyword..."+keyword);
        
        
        List<companyVO> list = companyService.giveKeyword(keyword);
        log.info(list);
        

        // ResponseEntity에 list와 ptdo를 함께 담아 반환

        // 리스트 비동기로 뿌려주기
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
	public ResponseEntity<List<spotAttachFileDTO>> uploadAsyncPost(MultipartFile[] uploadFile, Model model) {
		List<spotAttachFileDTO> list = new ArrayList<spotAttachFileDTO>();
		
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
			spotAttachFileDTO attachDTO = new spotAttachFileDTO();
			
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
		


	return new ResponseEntity<List<spotAttachFileDTO>>(list,HttpStatus.OK ); 
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
	
	
	 // 엑셀 파일 업로드 처리
    @ResponseBody
    @PostMapping(value = "/companyExcelInput", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> ExcelUpload(@RequestParam("EXCEL") MultipartFile file) 
    {	
    	log.info(file);
    	int result = 0;
        ExcelListener listener = new ExcelListener();
        if (!file.isEmpty()) 
        {
            try 
            {
                // 엑셀 파일 처리를 위한 리스너로 데이터 추출
                List<companyInputVO> dataList = listener.companyExcelListner(file.getInputStream());
                log.info(dataList);
                System.out.println(dataList);
                log.info(dataList.get(0).getCompanyNo()); 
                System.out.println(dataList.get(0).getCompanyNo()); 
                // 데이터베이스에 엑셀 데이터 저장
                for(companyInputVO vo : dataList) 
                {
                	 log.error(vo.getComName());
                	 result = companyService.insertCompanyExcel(vo);
                }
                
                System.out.println("result = " + result);
                return result >= 1 ? new ResponseEntity<String>("success",HttpStatus.OK) :
                new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
                
            } 
            catch (IOException e) 
            {
                e.printStackTrace();
                return  new ResponseEntity<String>("error",HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } 
        else 
        {
        	System.out.println("파일 정보가 안들어옴");
        	return  new ResponseEntity<String>("no file",HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    /** 엑셀 데이터 다운로드 처리*/
    @ResponseBody
    @PostMapping("/companyListDownloadExcel")
    public void companyListDownloadExcel(HttpServletResponse response, @RequestBody List<String> filteredValues) throws IOException 
    {
    	
    	System.out.println("엑셀로 다운로드 메서드 탐");
    	log.info("엑셀로 다운로드 메서드 탐");
    	//System.out.println("필터"+filteredValues);

    	Map<String, Object> filteredValue = new HashMap<>();
    	
    	filteredValue.put("filteredValues", filteredValues);
    	
    	List<companyDownVO> downlist = companyService.downExcelList(filteredValue);
    	//System.out.println("다운리스트" + downlist);
    	
    	
        // 리스트를 넣으면 엑셀화됨.
        ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    /** 파일 다운로드*/
    @PostMapping("/getCompanyLicenseFileURL")
    public void getCompanyLicenseFileURL() {
    	
    	
    	
    	
    }
    
 
//    @PostMapping("/updateCompany")
//    public String updateCompany(@RequestParam("file") MultipartFile file, companyVO vo, Model model) {
//        if (!file.isEmpty()) {
//            // 파일이 업로드된 경우
//            String fileName = file.getOriginalFilename();
//            log.info("파일명"+fileName);
//            try {
//                // 파일을 서버에 저장할 경로 설정
//                String filePath = "src/main/webapp/comBizLicenseFile/" + fileName; // 파일을 저장할 실제 경로로 수정
//                // 파일을 서버에 저장
//                byte[] bytes = file.getBytes();
//                Path path = Paths.get(filePath);
//                Files.write(path, bytes);
//                // 파일의 경로를 companyVO 객체에 설정
//                vo.setComBizLicenseFile(filePath);
//            } catch (IOException e) {
//                e.printStackTrace();
//                // 파일 저장 중 오류 발생 시 처리
//            }
//        }
//        
//        log.info(vo);
//      
//        int companyUpdateResult = companyService.updateCompany(vo);
//        String result = "";
//        if (companyUpdateResult >= 1) {
//            result = "companyUpdateSuccess";
//        } else {
//            result = "companyUpdateFail";
//        }
//        
//        model.addAttribute("companyUpdateResult", result);
//        return "redirect:/companyList"; 
//    }

    

}
