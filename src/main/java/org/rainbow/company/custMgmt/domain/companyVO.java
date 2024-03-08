package org.rainbow.company.custMgmt.domain;



import java.sql.Date;




import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class companyVO {
	
	private int companyNo, consultNo;
	private String comName, comBizLicenseFile, comBizNum, comBizType, comArea, comAddr, comDetailAddr, comBizStatus, 
	comBizCategory, comCEO, comContact, comEmail;
	private Date comOpenningDate;
	
	


}
