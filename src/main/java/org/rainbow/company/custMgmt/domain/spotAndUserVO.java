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
public class spotAndUserVO {
	
	private int spotNo,companyNo, spAgreementTerm, spEmpNum, spBdgt;
	private String spName, spAddr, spDetailAddr, spContact, spAgreementFile, spAutoExtension, spPayMethod, spDefaultGift,spEditGift,
	spStatus, spCancelEname, spCancelReason, spCancelDetailReason;
	
	
	private Date spAgreementDate, spChangeDate, spEmpUpdate;
	
	//기업명 따로 
	private String comName;
	// 파일 경로 변수
	private String filePath; 
	
	
	private int userNo;
	private String userName, userEmail, userContact, userPw;
	private Date  userPwUpdate, userConnectDate;
	
	// 비밀번호 설정 메서드
    public void setUserPwRandomly() {
        this.userPw = PasswordGenerator.generateRandomPassword(12); // 비밀번호 길이를 12로 설정
    }

}
