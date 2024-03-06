package org.rainbow.company.ProductManagement.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.rainbow.company.ProductManagement.domain.prdInsertVO;
import org.rainbow.company.ProductManagement.domain.prdDownVO;
import org.rainbow.company.ProductManagement.domain.prdInputVO;
import org.rainbow.company.ProductManagement.domain.productListVO;
import org.rainbow.company.ProductManagement.domain.suppliersVO;
import org.rainbow.company.ProductManagement.domain.supsDownVO;
import org.rainbow.company.ProductManagement.service.productPageServiceImpl;
import org.rainbow.domain.Criteria;
import org.rainbow.domain.ExcelDownloadUtil;
import org.rainbow.domain.ExcelListener;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ProductPageController 
{
	@Autowired
	productPageServiceImpl pService;
	
	// 상품관리 페이지 이동  모음 --------------------------------------------------------------------------------
	
	// 상품 조회 리스트 이동
    @GetMapping(value = "/moveProductPage")
    public String moveProductMangerPage(Model model, Criteria cri) 
    {
    	log.info("list...");
		if(cri.getPageNum() == 0 && cri.getAmount() == 0)
		{
			cri.setPageNum(1);
			cri.setAmount(10);
		}
		return null;
    }	
    public String moveProductMangerPage(Model model) 
    {
	    List<productListVO> list = pService.prdList();
	   
//	    int total = pService.prdCount();
	    model.addAttribute("list", list);
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
//		
//		log.info("total..." +total);
        
        return "/company/productManagement/productManagement";
    }
    
    
    // 공급처 조회 리스트 이동
    @GetMapping(value = "/moveSuppliers")
    public String moveSuppliers(Model model) 
    {
    	List<suppliersVO> list = pService.supsList();
    	log.info(list);
    	model.addAttribute("list", list);
    	return "/company/productManagement/suppliersManagement";
    }
    // 일단 기능 상관말고 겟메핑으로이동
    
    // 공급처 등록 이동
    @GetMapping(value = "/moveSuppliersRegist")
    public String moveSuppliersRegist(Model model) 
    {
    	int supsCount = pService.supsNoCount();
    	String newSupsNo = "a" + (supsCount+1);
    	
    	model.addAttribute("NSN", newSupsNo);
    	return "/company/productManagement/suppliersRegist";
    }
    // 공급처 수정 이동
    @GetMapping(value = "/moveSuppliersUpdate")
    public String moveSuppliersUpdate(@RequestParam("supsNo") String supsNo, Model model) 
    {
    	suppliersVO svo = pService.getSupsVO(supsNo);
    	log.info(svo);
    	model.addAttribute("GSV", svo);
    	
    	return "/company/productManagement/suppliersUpdate";
    }
    // 상품 개별 등록 이동
    @GetMapping(value = "/moveProductReg")
    public String moveProductReg(Model model) 
    {
    	List<prdInputVO> codes = pService.getsupsNumber();
    	List<prdInputVO> items = pService.getSubCtg();
    	
    	model.addAttribute("codes", codes);
    	model.addAttribute("items", items);
    	
    	
    	model.addAttribute("codes", codes);
    	
    	return "/company/productManagement/productReg";
    }
    // 상품 수정 이동
    @GetMapping(value = "/moveProductUpdate")
    public String moveProductUpdate(@RequestParam("prdNo") String prdNo, Model model) 
    {
    	List<prdInputVO> codes = pService.getsupsNumber();
    	prdInputVO pvo = pService.getprdVo(prdNo);
    	
    	model.addAttribute("pvo", pvo);
    	log.info(pvo);
    	model.addAttribute("codes", codes);
    	
    	return "/company/productManagement/productUpdate";
    }
    
    
	// 상품관리 이동 매핑 끝 --------------------------------------------------------------------------------------
	
    // 상품 조회 리스트  기능들 ------------------------------------------------------------------------------------
    
    // 상품 조회리스트 검색 기능
    @ResponseBody
    @GetMapping(value = "/searchProduct", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<productListVO>> prdSeach(@RequestParam("keyword") String keyword)
    {
        log.info("keyword..."+keyword);
        
        
        List<productListVO> list = pService.getSearch(keyword);
        log.info(list);
        

        // ResponseEntity에 list와 ptdo를 함께 담아 반환

        // 리스트 비동기로 뿌려주기
        return new ResponseEntity<List<productListVO>>(list, HttpStatus.OK);
    }
    
    // 엑셀 파일 업로드 처리
    @ResponseBody
    @PostMapping(value = "/prdExcelInput", produces = MediaType.TEXT_PLAIN_VALUE)
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
                List<prdInputVO> dataList = listener.handleExcel(file.getInputStream());
                log.info(dataList);
                System.out.println(dataList);
                log.info(dataList.get(0).getPrdImg());
                System.out.println(dataList.get(0).getPrdImg());
                // 데이터베이스에 엑셀 데이터 저장
                for(prdInputVO vo : dataList) 
                {
                	 log.error(vo.getPrdName());
                	 result = pService.insertPrdExcel(vo);
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
    @PostMapping("/downloadExcel")
    public void downloadExcelData(HttpServletResponse response, @RequestBody List<String> checkValues) throws IOException 
    {
    	System.out.println(checkValues);

    	Map<String, Object> checkValue = new HashMap<>();
    	
    	checkValue.put("checkValues", checkValues);
    	
    	System.out.println(checkValue);
    	 
    	List<prdDownVO> downlist = pService.downExcelList(checkValue);
    	System.out.println(downlist);
    	
    	
        // 리스트를 넣으면 엑셀화됨.
        ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    /** 상품 개별등록*/
    @PostMapping(value = "/prdReg.do")
    public String prdReg(prdInsertVO pvo , Model model)
    {
    	log.info(pvo);
    	
    	int prdInsertresult = pService.productInput(pvo);
    	String result = "";
    	if(prdInsertresult >= 1 )
    	{
    		result = "prdInsertSuccess";
    	}
    	else
    	{
    		result = "prdInsertDelfail";
    	}
    	
    	model.addAttribute("prdInsertresult", result);
    	
    	return "/company/productManagement/prdResult";
    }
    
    /** 상품 개별수정*/
    @PostMapping("/prdUpdate")
    public String prdUpdate(suppliersVO svo , Model model)
    {
    	log.info(svo);
    	System.out.println(svo.getSupsSt());
    	System.out.println(svo.getSupsBnt());
    	pService.supsUpdate(svo);
    	
    	return "redirect:/moveProductPage";

    }
    
    /** 상품 개별삭제*/
    @PostMapping("/prdDelete")
    public String prdDelete(suppliersVO svo , Model model)
    {
    	log.info(svo);

    	pService.supsDelete(svo);
    	
    	return "redirect:/moveProductPage";

    }
    
    
    // 상품 조회 리스트  기능끝 ------------------------------------------------------------------------------------
    
    // 공급처 리스트 기능  ---------------------------------------------------------------------------------------
    
    // 공급처 조회리스트 검색 기능
    @ResponseBody
    @GetMapping(value = "/searchSups", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<suppliersVO>> supsSeach(@RequestParam("keyword") String keyword)
    {
        log.info("keyword..."+keyword);
        System.out.println(keyword);
        List<suppliersVO> list = pService.supsSearch(keyword);
        log.info(list);

        // ResponseEntity에 list와 ptdo를 함께 담아 반환

        // 리스트 비동기로 뿌려주기
        return new ResponseEntity<List<suppliersVO>>(list, HttpStatus.OK);
    }
    
    // 공급처 엑셀 업로드 기능
    @ResponseBody
    @PostMapping(value = "/supsExcelInput", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> supsExcelUpload(@RequestParam("EXCEL") MultipartFile file) 
    {	
    	log.info(file);
    	int result = 0;
        ExcelListener listener = new ExcelListener();
        if (!file.isEmpty()) 
        {
            try 
            {
                // 엑셀 파일 처리를 위한 리스너로 데이터 추출
                List<suppliersVO> dataList = listener.supsExcelListner(file.getInputStream());
                log.info(dataList);
                System.out.println(dataList);
                // 데이터베이스에 엑셀 데이터 저장
                for(suppliersVO vo : dataList) 
                {
                	 result = pService.insertSupsExcel(vo);
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
    @PostMapping("/supsExcelDown")
    public void supsExcelDown(HttpServletResponse response, @RequestBody List<String> checkValues) throws IOException 
    {
    	System.out.println(checkValues);

    	Map<String, Object> checkValue = new HashMap<>();
    	
    	checkValue.put("checkValues", checkValues);
    	 
    	List<supsDownVO> downlist = pService.supsExcelDown(checkValue);
    	
    	System.out.println(downlist);
    	
        // 리스트를 넣으면 엑셀화됨.
    	ExcelDownloadUtil.dowonloadUtill(response, downlist);
    }
    
    // 공급처 등록 일단 파일 어떻게 넣을지 판단 안되서.. 파일 넣는기능 제외하고 그냥 인서트
    @PostMapping("/insertSupsReg")
    public String insertSupsReg(suppliersVO svo, Model model)
    {
    	log.info(svo);

    	int supInsertReulst = pService.insertSups(svo);
    	
    	String result = "";
    	if(supInsertReulst >= 1 )
    	{
    		result = "supInsertSuccess";
    	}
    	else
    	{
    		result = "supInsertfail";
    	}
    	
    	model.addAttribute("supInsertReulst", result);
    	
    	return "/company/productManagement/prdResult";
    }
    
    // 공급처 수정
    @PostMapping("/supsUpdate")
    public String supsUpdate(suppliersVO svo, Model model)
    {
    	log.info(svo);
    	System.out.println(svo.getSupsSt());
    	System.out.println(svo.getSupsBnt());
    	int supUpResult = pService.supsUpdate(svo);
    	
    	String result = "";
    	if(supUpResult >= 1 )
    	{
    		result = "supUpSuccess";
    	}
    	else
    	{
    		result = "supUpfail";
    	}
    	
    	model.addAttribute("subUpResult", result);
    	
    	return "/company/productManagement/prdResult";
    }
    
    // 공급처 삭제
    @PostMapping("/supsDelete")
    public String supsDelete(suppliersVO svo, Model model)
    {
    	log.info(svo);

    	int supDelResult = pService.supsDelete(svo);
    	String result = "";
    	if(supDelResult >= 1 )
    	{
    		result = "subDelSuccess";
    	}
    	else
    	{
    		result = "subDelfail";
    	}
    	
    	model.addAttribute("supDelResult", result);
    	
    	
    	return "/company/productManagement/prdResult";

    }
    
    // 공급처 리스트 기능 끝 ------------------------------------------------------------------------------------------------------
}
