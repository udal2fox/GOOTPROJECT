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
public class userVO {

	private int userNo, spotNo, companyNo;
	private String uName, uEmail, uContact, uPw;
	private Date  uPwUpdate, uConnectDate;
}
