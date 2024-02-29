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
public class cnslHisVO {

	private int cnslHisNo, cnslNo;
	private String cnslHisCnt1, cnslHisCnt2, cnslHisCnt3, 
	cnslHisCnt4, cnslHisCnt5;
	private Date cnslHisCnt1Dt, cnslHisCnt2Dt, cnslHisCnt3Dt, cnslHisCnt4Dt, cnslHisCnt5Dt;
	
	
	
	
}
