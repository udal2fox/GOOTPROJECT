package org.rainbow.company.employeeSupervisePage.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
/*** 필터링 한 데이트 담을 DTO */
public class EmployeeSearchDTO {

	private String keyword;
	
	private String dName;
	
}
