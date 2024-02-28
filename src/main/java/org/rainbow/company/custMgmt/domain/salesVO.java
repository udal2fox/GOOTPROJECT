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
public class salesVO {
	
	
	private int cnslNo, cnslBdgt, cnslEmpNum;
	private String  cnslCoName, cnslArea, cnslName, cnslCt, cnslEmail, 
	cnslInqCnt, cnslSaleSt, cnslEname, cnslFailRsn, cnslFailCmt;
	
	private Date cnslReqDt, cnslRespDt;

	
	


	
	


}
