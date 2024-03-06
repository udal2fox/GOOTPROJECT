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
public class spotVO {
	
	
	private int spotNo, companyNo, sAgreementTerm, sEmpNum, sBdgt;
	private String sName, sAddr, sDetailAddr, sContact, sAgreementFile, sAutoExtension, sPayMethod, sDefaultGift,
	sStatus, sCancelEname, sCancelReason, sCancelDetailReason;
	
	
	private Date sAgreementDate, sChangeDate;
	
	

}
