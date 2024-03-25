package org.rainbow.company.employeeSupervisePage.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
/*** 필터링 한 데이트 담을 DTO */
public class EmployeeSearchDTO {

	private String keyword;
	
	private String dName;
}
