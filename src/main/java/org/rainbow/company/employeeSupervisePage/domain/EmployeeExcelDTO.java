package org.rainbow.company.employeeSupervisePage.domain;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class EmployeeExcelDTO {

	//사원번호
	@ExcelProperty("사원번호")
	private int eno;

	// 사원 이름
	@ExcelProperty("이름")
	private String eName; 
	
	// 사원 이메일
	@ExcelProperty("이메일")
	private String email;
	
	// 사원 연락처
	@ExcelProperty("연락처")
	private String ePhone;
	
	// 부서명
	@ExcelProperty("부서")
	private String dName;
	
	// 사원 직급
	@ExcelProperty("직급")
	private String job;
	
	// 근무형태
	@ExcelProperty("근무형태")
	private String workType;
	
	// 사원 연봉
	@ExcelProperty("연봉")
	private int sal;
	
	// 사원 주소
	@ExcelProperty("주소")
	private String eAddr;
	
	// 상세주소
	@ExcelProperty("상세주소")
	private String eAddr2;
	
	// 급여 수급 은행
	@ExcelProperty("급여 수급 은행")
	private String eBank;
	
	// 급여 계좌
	@ExcelProperty("계좌번호")
	private String salAccount;
	
	// 주민등록번호
	@ExcelProperty("주민등록번호")
	private String identyNum;
}


	

	
	

	
	
	
	
	
	

	
