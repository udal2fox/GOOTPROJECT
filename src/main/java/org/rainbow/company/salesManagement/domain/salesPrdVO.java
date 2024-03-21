package org.rainbow.company.salesManagement.domain;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class salesPrdVO
{
	@ExcelProperty("상품코드")
	private String prdNo;
	
	@ExcelProperty("대분류")
	private String prdMajorCtg;
	
	@ExcelProperty("소분류")
	private String prdSubCtg;
	
	@ExcelProperty("상품명")
	private String prdName;
	
	@ExcelProperty("매출합계")
	private int totalSum;
	
	@ExcelProperty("매입합계")
	private int totalCstPri;
	
	@ExcelProperty("전체마진율")
	private double totalMagin;
	
	@ExcelProperty("상품판매가")
	private int prdSal;
	
	@ExcelProperty("상품원가")
	private int prdCstPri;
	
	@ExcelProperty("상품마진율")
	private double prdMargin;
	
	@ExcelProperty("상품상태")
	private String prdSt; 
}
