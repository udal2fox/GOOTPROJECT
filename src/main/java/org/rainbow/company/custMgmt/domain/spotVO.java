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
public class spotVO {
	
	
	private int spotNo, companyNo, spAgreementTerm, spEmpNum, spBdgt;
	private String spName, spAddr, spDetailAddr, spContact, spAgreementFile, spAutoExtension, spPayMethod, spDefaultGift,
	spStatus, spCancelEname, spCancelReason, spCancelDetailReason;
	
	
	private Date spAgreementDate, spChangeDate, spEmpUpdate;
	
	

}
