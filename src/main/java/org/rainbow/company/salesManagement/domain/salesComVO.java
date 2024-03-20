package org.rainbow.company.salesManagement.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class salesComVO 
{
	private int companyNo;
	
	private String comName;
	
	private String comBizType;
	
	private int recSumTotal;
	
	private int recSupTotal;
	
	private int recTaxTotal;
	
	private int prdCstPriTotal;
	
	private int prdCstSupTotal;
	
	private int prdCstTaxTotal;
	
	private int resADTotal;
	
	private int resADSupTotal;
	
	private int resADTaxTotal;
	
}
