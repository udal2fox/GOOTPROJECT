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
public class prdDownVO 
{
	@ExcelProperty("공급처명")
	private String supsCo;
	
	@ExcelProperty("상품코드")
	private String prdNo;
	
	@ExcelProperty("표준유통코드")
	private String prdSdc;
	
	@ExcelProperty("대분류")
	private String prdMajorCtg;
	
	@ExcelProperty("소분류")
	private String prdSubCtg; 
	
	@ExcelProperty("상품명")
	private String prdName;	
	
	@ExcelProperty("원가")
	private String prdCstPri; 
	
	@ExcelProperty("판매가")
	private String prdSal; 
	
	@ExcelProperty("마진율")
	private double prdMargin; 
	
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
    	
    	ex)
    	테이블에 값을 가져올때 5.0% vo에서 double 받거나
    	숫자를 파싱해서 5,000 == $5,000 이런값을 다운 받으려면 String 으로 받는것이 정신건강에 이롭다.
    	
     */
	
}
