package org.rainbow.company.ProductManagement.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
/** 프로젝트 리스트 출력용 VO  */
public class productListVO 
{
	/** 상품코드 */
	private String prdNo;
	
	/** 입점업체코드 */
	private String supsNo; 
	
	/** 공급업체 상호명 */
	private String supsCo;
	
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
	private int	prdCstPri; 
	
	/** 원가-공급액 */
	private int	prdCstSup; 
	
	/** 원가-세액 */
	private int	prdCstTax; 
	
	/** 판매가 */
	private int	prdSal; 
	
	/** 판매가-공급액 */
	private int	prdSalSup; 
	
	/** 판매가-세액 */
	private int	prdSalTax; 
	
	/** 마진율 */
	private double prdMargin; 
	
	/** 상태 */
	private String prdSt;
	
	/** 이미지 */
	private String prdImg;

    
}
