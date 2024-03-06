package org.rainbow.company.ProductManagement.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class prdInsertVO
{
	/** 상품코드 */
	private String prdNo;
	
	/** 입점업체코드 */
	private String supsNo; 
	
	/** 표준유통코드 */
	private String prdSdc;
	
	/** 비과세여부 */
	private String prdTaxExSt;
	
	/** 대분류 */
	private String prdMajorCtg;
	
	/** 소분류 */
	private String prdSubCtg; 
	
	/** 상품명 */
	private String prdName;	
	
	/** 원가 */
	private String prdCstPri; 
	
	/** 원가-공급액 */
	private String	prdCstSup; 
	
	/** 원가-세액 */
	private String	prdCstTax; 
	
	/** 판매가 */
	private String	prdSal; 
	
	/** 판매가-공급액 */
	private String	prdSalSup; 
	
	/** 판매가-세액 */
	private String	prdSalTax; 
	
	/** 마진율 */
	private String prdMargin; 
	
	/** 상태 */
	private String prdSt;
	
	/** 이미지 */
	private String prdImg;
	
}
