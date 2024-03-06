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
public class companyVO {
	
	private int companyNo, consultNo;
	private String cName, cBizLicenseFile, cBizNum, cBizType, cArea, cAddr, cDetailAddr, cBizStatus, 
	cBizCategory, cCEO, cContact, cEmail;
	private Date cOpenningDate;
	
	


}
