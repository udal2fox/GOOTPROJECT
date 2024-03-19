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
	
	private String companyName;
	
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
