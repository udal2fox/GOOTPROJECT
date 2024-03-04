package org.rainbow.company.employeeSupervisePage.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class get_employeeDTO {
	
	
	private String eName;
	
	private String email;
	
	private String ePhone;
	
	private String identyNum;
	
	private String dName; 
	
	private String job;
	
	private String workType;
	
	private int sal;
	
	private String eAddr;
	
	private String eAddr2;
	
	private String eBank;
	
	private String salAccount;
	
	private Date hireDt; 
	
	private Date endDt;
	
	private String idStatus;
}
