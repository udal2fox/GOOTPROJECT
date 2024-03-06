package org.rainbow.company.custMgmt.domain;

import java.sql.Date;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class consultExcelDownloadVO {
	
	
	@ExcelProperty("상담 신청 관리 번호")
	private int consultNo;
	@ExcelProperty("예상 예산")
	private int  csBdgt;
	@ExcelProperty("직원 수")
	private int csEmpNum;


	@ExcelProperty("기업명")
	private String csCompanyName;
	@ExcelProperty("지역")
	private String csArea;
	@ExcelProperty("담당자명")
	private String csName;
	@ExcelProperty("담당자 연락처")
	private String csContact;
	@ExcelProperty("담당자 이메일")
	private String csEmail;
	@ExcelProperty("문의 내용")
	private String csContent;
	@ExcelProperty("영업 상태")
	private String	csStatus;
	@ExcelProperty("영업 담당자")
	private String csEname;
	@ExcelProperty("계약 실패 사유")
	private String csFailReason;
	@ExcelProperty("계약 실패 사유 상세 기재")
	private String csFailDetailReason;


	@ExcelProperty("신청일")	
	private Date  csDate;
	@ExcelProperty("응대일")
	private Date csResponseDate;

}
