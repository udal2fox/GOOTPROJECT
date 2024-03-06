package org.rainbow.company.custMgmt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode
@Getter
@Setter
public class consultVO {
	
	
	private int consultNo, csBdgt, csEmpNum;
	private String csCompanyName, csArea, csName, csContact, csEmail, csContent, 
	csStatus, csEname, csFailReason, csFailDetailReason;
	private Date  csDate, csResponseDate;
	
	
	
	

	
	
	

}
