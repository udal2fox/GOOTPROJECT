package org.rainbow.company.custMgmt.domain;

import java.sql.Date;
import java.util.List;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class consultVO {
	
	
	private int consultNo, csBdgt, csEmpNum;
	private String csCompanyName, csArea, csName, csContact, csEmail, csContent, 
	csStatus, csEname, csFailReason, csFailDetailReason;
	private Date  csDate, csResponseDate;
	
	
	
	private List<cshVO> cshVOList;

	
	
	

}
