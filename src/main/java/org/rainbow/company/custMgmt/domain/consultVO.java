package org.rainbow.company.custMgmt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class consultVO {
	
	
	private int consultNo, csBdgt, csEmpNum;
	private String csCompanyName, csArea, csName, csContact, csEmail, csContent, 
	csStatus, csEname, csFailReason, csFailDetailReason;
	private Date  csDate, csResponseDate;
	
	
	
	

	
	
	

}
