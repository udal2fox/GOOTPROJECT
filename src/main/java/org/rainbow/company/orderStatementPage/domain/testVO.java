package org.rainbow.company.orderStatementPage.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class testVO {
	
	private Date recDate;
	
	private int spotNo, recNo;
	
	private double recSum, recSup, recTax;
	
	private String cName, sName, cBizType, recPayMth;
	
	private boolean recPayStat;


	
}
