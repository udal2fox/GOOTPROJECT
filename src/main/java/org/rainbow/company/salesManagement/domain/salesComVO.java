package org.rainbow.company.salesManagement.domain;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class salesComVO 
{
	@ExcelProperty("기업관리번호")
	private int companyNo;
	
	@ExcelProperty("기업명")
	private String comName;
	
	@ExcelIgnore
	private String comBizType;
	
	@ExcelProperty("매출액")
	private int recSumTotal;
	
	@ExcelProperty("매출액-공급액")
	private int recSupTotal;
	
	@ExcelProperty("매출액-세액")
	private int recTaxTotal;
	
	@ExcelProperty("매입액")
	private int prdCstPriTotal;
	
	@ExcelProperty("매입액-세액")
	private int prdCstSupTotal;
	
	@ExcelProperty("매입액-세액")
	private int prdCstTaxTotal;
	
	@ExcelProperty("조정금액")
	private int resADTotal;
	
	@ExcelProperty("조정금액-공급액")
	private int resADSupTotal;
	
	@ExcelProperty("조정금액-세액")
	private int resADTaxTotal;
	
	@ExcelProperty("마진율")
	private double marginPer;
	
}
