package org.rainbow.company.ProductManagement.domain;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode
public class prdInputVO
{
	
	@ExcelProperty("상품코드")
	private String prdNo;
	
	@ExcelProperty("입점업체코드")
	private String supsNo; 
	
	@ExcelProperty("표준유통코드")
	private String prdSdc;
	
	@ExcelProperty("비과세여부")
	private String prdTaxExSt;
	
	@ExcelProperty("대분류")
	private String prdMajorCtg;
	
	@ExcelProperty("소분류")
	private String prdSubCtg; 
	
	@ExcelProperty("상품명")
	private String prdName;	
	
	@ExcelProperty("원가")
	private int	prdCstPri; 
	
	@ExcelProperty("원가-공급액")
	private int	prdCstSup; 
	
	@ExcelProperty("원가-세액")
	private int	prdCstTax; 
	
	@ExcelProperty("판매가")
	private int	prdSal; 
	
	@ExcelProperty("판매가-공급액")
	private int	prdSalSup; 
	
	@ExcelProperty("판매가-세액")
	private int	prdSalTax; 
	
	@ExcelProperty("마진율")
	private double prdMargin; 
	
	@ExcelProperty("상태")
	private String prdSt;
	
	@ExcelProperty("이미지")
	private String prdImg;
	
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
