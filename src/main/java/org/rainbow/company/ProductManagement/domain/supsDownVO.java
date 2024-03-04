package org.rainbow.company.ProductManagement.domain;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/** 공급처 관리 화면 다운로드에 사용될  VO */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class supsDownVO 
{
	/** 입점업체코드 */
	@ExcelProperty("입점업체코드")
	private String supsNo;
	
	/** 공급처명 */
	@ExcelProperty("공급처명")
	private String supsCo;
	
	/** 공급처구분 */
	@ExcelProperty("공급처구분")
	private String supsBnt;
	
	/** 공급처사업자법인등록번호 */
	@ExcelProperty("공급처사업자등록번호")
	private String supsBizRegNum;
	
	/** 공급처주소 */
	@ExcelProperty("공급처주소")
	private String supsAddr;
	
	/** 연락처 */
	@ExcelProperty("연락처")
	private String supsCt;
	
	/** 공급처이메일 */
	@ExcelProperty("공급처이메일")
	private String supsCoEmail;
	
	/** 거래상태 */
	@ExcelProperty("거래상태")
	private String supsSt;
	
}
	
	
