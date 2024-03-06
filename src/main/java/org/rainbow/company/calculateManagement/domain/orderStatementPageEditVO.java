package org.rainbow.company.calculateManagement.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
	
@AllArgsConstructor
@NoArgsConstructor
@Data
public class orderStatementPageEditVO {
	
	private Date recDate;
	
	private int spotNo, count, prdSal, companyNo;
	
	private double recSum, recSup, recTax, recDedSup, recDedTax, prdCstPri, prdCstSup, prdCstTax, recAddSup, recAddTax, prdMargin;
	
	private String cName, cBizType, sName, recPayMth, prdName, prdMajorCtg, prdSubCtg, prdNo2, cEmpName;
	
	private boolean recPayStat;
		
}
