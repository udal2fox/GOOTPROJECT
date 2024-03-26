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
	
	// 비밀번호 설정 메서드
    public void setUserPwRandomly() {
        this.userPw = PasswordGenerator.generateRandomPassword(12); // 비밀번호 길이를 12로 설정
    }
}
