package org.rainbow.domain;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;

import javax.servlet.http.HttpServletResponse;

import org.rainbow.company.ProductManagement.domain.prdDownVO;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/** 엑셀 다운로드  클래스 */
public class ExcelDownloadUtil 
{
		/** VO만던져서 사용할수있도록 개편 ver2024-03-04*/
		public static <T> void dowonloadUtill(HttpServletResponse response, List<T> excelData) throws IOException 
	    {
	        // ExcelWriter 객체를 초기화
	        ExcelWriter excelWriter = null;
	        try 
	        {
	        	String fileName = "excelData.xlsx";
	        	
	            // ExcelWriter 객체를 생성
	        	excelWriter = EasyExcel.write(response.getOutputStream(), excelData.get(0).getClass()).build();

	            // WriteSheet 객체를 생성
	            WriteSheet writeSheet = EasyExcel.writerSheet("Sheet1").build();

	            // ExcelWriter를 사용하여 데이터를 엑셀 입력.
	            excelWriter.write(excelData, writeSheet);

	            // HTTP 응답 헤더를 설정.
	            response.setContentType("application/vnd.ms-excel");
	            response.setCharacterEncoding("UTF-8");

	            // 파일 이름을 UTF-8로 인코딩하여 설정
	            response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
	            response.flushBuffer();
	        }
	        catch (IOException e)
	        {
	            e.printStackTrace();
	        } 
	        finally 
	        {
	            // ExcelWriter 객체를 닫기. 
	            if (excelWriter != null)
	            {
	                excelWriter.finish();
	            }
	        }    
	    }
	
//    /** 엑셀 파일을 다운로드하는 메서드  사용시 메서드 복사해서 List부분 fileName 변경하고 VO들 다운로드용으로 갈아끼고 사용하면됩니다. */
//    public static void downloadProductList(HttpServletResponse response, List<prdDownVO> excelData) throws IOException 
//    {
//        // 다운로드할 파일의 이름 설정
//        String fileName = "excelData.xlsx";
//
//        // ExcelWriter 객체를 초기화
//        ExcelWriter excelWriter = null;
//        try 
//        {
//            // ExcelWriter 객체를 생성
//        	excelWriter = EasyExcel.write(response.getOutputStream(), prdDownVO.class).build(); // 
//
//            // WriteSheet 객체를 생성
//            WriteSheet writeSheet = EasyExcel.writerSheet("Sheet1").build();
//
//            // ExcelWriter를 사용하여 데이터를 엑셀 입력.
//            excelWriter.write(excelData, writeSheet);
//
//            // HTTP 응답 헤더를 설정.
//            response.setContentType("application/vnd.ms-excel"); // 엑셀 파일의 MIME 타입 설정
//            response.setCharacterEncoding("UTF-8"); // 응답 문자 인코딩 설정
//            
//            // 이름 설정해서 헤더로 날리는 설정  //다운로드할 파일의 이름은 .js 에서 주는것이 편하다 안정성? 특수문자나 유니코드 문자가 포함? 이런상황시 이코드로 이름을 지어주어야한다.
//            response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8")); 
//            response.flushBuffer(); // 버퍼를 비워서 데이터를 클라이언트로 전송
//        }
//        catch (IOException e)
//        {
//            e.printStackTrace();
//        } 
//        finally 
//        {
//            // ExcelWriter 객체를 닫기. 
//            if (excelWriter != null)
//            {
//                excelWriter.finish();
//            }
//        }    
//    }
    
  
    
    
    
    
} // 클래스 끝

