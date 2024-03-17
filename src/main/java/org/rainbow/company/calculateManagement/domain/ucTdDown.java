package org.rainbow.company.calculateManagement.domain;

import java.sql.Date;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ucTdDown 
{
	@ExcelProperty("거래명세번호")
	private int recNo;
	
	@ExcelProperty("기업명")
	private String comName;
	
	@ExcelProperty("기업구분")
	private String comBizType;
	
	@ExcelProperty("지점명")
	private String spName;
	
	@ExcelProperty("일자")
	private Date recDate;
	
	@ExcelProperty("합계")
	private int recSum;
	
	@ExcelProperty("공급액")
	private int recSup;
	
	@ExcelProperty("세액")
	private int recTax;
	
	@ExcelProperty("원가")
	private int prdCstPri;
	
	@ExcelProperty("마진율")
	private double prdMargin;
	
	@ExcelProperty("결제수단")
	private String recPayMth;
	
	@ExcelProperty("정산여부")
	private String recSortation;
}
