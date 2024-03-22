package org.rainbow.company.custMgmt.domain;

import java.sql.Date;


import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode
public class companyInputVO {
	
	
	@ExcelProperty("기업 관리 번호")
	private int companyNo;
	
	@ExcelProperty("상담 신청 관리 번호")
	private int consultNo; 
	
	@ExcelProperty("기업명")
	private String comName;
	
	@ExcelProperty("사업자등록증")
	private String comBizLicenseFile;
	
	@ExcelProperty("사업자 등록 번호")
	private String comBizNum;
	
	@ExcelProperty("사업자 구분")
	private String comBizType;
	
	@ExcelProperty("기업 소재 지역")
	private String comArea; 
	
	@ExcelProperty("기업 주소")
	private String comAddr; 
	
	@ExcelProperty("상세 주소")
	private String comDetailAddr;	
	
	@ExcelProperty("업태")
	private String	comBizStatus; 
	
	@ExcelProperty("업종")
	private String	comBizCategory; 
	
	@ExcelProperty("대표자")
	private String	comCEO; 
	
	@ExcelProperty("회사 연락처")
	private String	comContact; 
	
	@ExcelProperty("이메일")
	private String	comEmail; 
	
	@ExcelProperty("창립 기념일")
	private Date comOpenningDate; 
	
	/*
     * @ExcelProperty("컬럼명")
     * ** 인서트 때 컬럼명으로 읽어옴 
     * ** 다운로드 때도 이컬럼명으로 컬럼 명 만들어짐
     * 
     * 
     *  @ExcelProperty("DATES") // 엑셀의 열 제목을 "DATES"로 지정
    	@DateTimeFormat("yyyy-MM-dd") // 날짜 형식 지정
    	private String dates; // DATES 필드
     */
	

}
