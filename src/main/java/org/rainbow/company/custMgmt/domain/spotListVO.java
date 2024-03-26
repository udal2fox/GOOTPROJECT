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
public class spotListVO {

	
	private int companyNo,spotNo;
	private String comName, spName, spAddr, spStatus, userName;
	private Date spAgreementDate, spChangeDate;
}
