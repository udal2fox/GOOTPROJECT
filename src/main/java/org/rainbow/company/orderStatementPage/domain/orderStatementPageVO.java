package org.rainbow.company.orderStatementPage.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class orderStatementPageVO {

	private Date recDate;
	
	private int spotNo, recNo;
	
	private double recSum, recSup, recTax;
	
	private String cName, sName, cBizType, recPayMth, recPayStat;
	
}

//public class orderStatementPageVO {
//
//	private Date recDate, orderDate;
//	
//	private int spotNo, recNo, deptNo, companyNo;
//	
//	private double recSum, recSup, recTax;
//	
//	private String cName, sName, cBizType, uName, cContact, recPayMth, cEmail, uEmail;
//	
//	private boolean recPayStat, recIssStat;
//	
//}
