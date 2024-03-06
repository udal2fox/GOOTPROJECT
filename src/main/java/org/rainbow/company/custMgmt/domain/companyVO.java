package org.rainbow.company.custMgmt.domain;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@AllArgsConstructor
@NoArgsConstructor
@Data
public class companyVO {
	
	private int companyNo, consultNo;
	private String comName, comBizLicenseFile, comBizNum, comBizType, comArea, comAddr, comDetailAddr, comBizStatus, 
	comBizCategory, comCEO, comContact, comEmail;
	private Date comOpenningDate;
	
	


}
