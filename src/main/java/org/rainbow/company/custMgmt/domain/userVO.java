package org.rainbow.company.custMgmt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class userVO {

	private int userNo, spotNo, companyNo;
	private String userName, userEmail, userContact, userPw;
	private Date  userPwUpdate, userConnectDate;
}
