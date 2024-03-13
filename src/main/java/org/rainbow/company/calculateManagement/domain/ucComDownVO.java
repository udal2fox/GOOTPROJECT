package org.rainbow.company.calculateManagement.domain;

import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ucComDownVO
{
	@ExcelProperty("기업관리번호")
	private String companyNo;
	@ExcelProperty("기업명")
	private String comName;
	@ExcelProperty("기업구분")
	private String comBizType;
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
