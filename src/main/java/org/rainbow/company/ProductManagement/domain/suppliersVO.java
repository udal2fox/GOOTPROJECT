package org.rainbow.company.ProductManagement.domain;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class suppliersVO 
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
	@ExcelProperty("공급처사업자법인등록번호")
	private String supsBizRegNum;
	
	/** 공급처주소 */
	@ExcelProperty("공급처주소")
	private String supsAddr;
	
	/** 공급처사업자등록증 */
	@ExcelProperty("공급처사업자등록증")
	private String supsBizLic;
	
	/** 공급처이메일 */
	@ExcelProperty("공급처이메일")
	private String supsCoEmail;
	
	/** 연락처 */
	@ExcelProperty("연락처")
	private String supsCt;
	
	/** 거래상태 */
	@ExcelProperty("거래상태")
	private String supsSt;
	
	/** 공급처담당자 */
	@ExcelProperty("공급처담당자")
	private String supsName;
	
	/** 공급처담당자연락처 */
	@ExcelProperty("공급처담당자연락처")
	private String supsPhone;
	
	/** 공급처담당자메일주소 */
	@ExcelProperty("공급처담당자메일주소")
	private String supsEmail;
	
	/** 공급처담당자(sub) */
	@ExcelProperty("공급처담당자(sub)")
	private String supsSubName;
	
	/** 공급처담당자연락처(sub) */
	@ExcelProperty("공급처담당자연락처(sub)")
	private String supsSubPhone;
	
	/** 공급처담당자메일주소(sub) */
	@ExcelProperty("공급처담당자메일주소(sub)")
	private String supsSubEmail;
}
