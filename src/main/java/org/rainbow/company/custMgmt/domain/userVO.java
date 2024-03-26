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
public class userVO {

	private int userNo, spotNo, companyNo;
	private String userName, userEmail, userContact, userPw;
	private Date  userPwUpdate, userConnectDate;
	
}
