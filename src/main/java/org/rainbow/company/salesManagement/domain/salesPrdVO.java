package org.rainbow.company.salesManagement.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class salesPrdVO
{
	private String prdNo;
	private String prdMajorCtg;
	private String prdSubCtg;
	private String prdName;
	private int totalSum;
	private int totalCstPri;
	private double totalMagin;
	private int prdSal;
	private int prdCstPri;
	private double prdMargin;
	private String prdSt; 
}
