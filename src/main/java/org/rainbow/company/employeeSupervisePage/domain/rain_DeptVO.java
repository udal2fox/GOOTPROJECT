package org.rainbow.company.employeeSupervisePage.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class rain_DeptVO {
	
	// 부서번호
	private int deptNo;	
	
	// 부서명
	private String dName;	
	
	// 매니저 번호
	private int mno;	

}
