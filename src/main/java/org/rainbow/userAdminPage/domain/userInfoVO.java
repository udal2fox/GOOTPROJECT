package org.rainbow.userAdminPage.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class userInfoVO {
    private int userNo, spotNo, companyNo;
    private String uName, uEmail, uContact, uPw;
    private Date uPwUpdate, uConnectDate;

}
