package org.rainbow.company.orgChart.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class orgChartDTO {
	
	private int eno;
	
	private int deptNo;
	
	private String dName;
	
	private String eName;
	
	private String ePhone;
	
	private String email;
	
	private String job;
	
}
