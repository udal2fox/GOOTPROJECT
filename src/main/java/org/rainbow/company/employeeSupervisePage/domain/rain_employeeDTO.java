package org.rainbow.company.employeeSupervisePage.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class rain_employeeDTO {
    
	//사원 번호
	private int eno;
	
	// 사원 이름
	private String eName;
	
	// 사원 이메일
	private String email; 
	
	// 사원 연락처
	private String ePhone; 
	
	// 부서명
	private String dName;
	
	// 사원 직급
	private String job;
	
	// 사원 입사일
	private Date hireDt; 
	
	// 사원 퇴사일
	private Date endDt;
	
	// 계정 상태
	private String idStatus;
}

