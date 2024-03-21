package org.rainbow.company.custMgmt.domain;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Getter
@Setter
public class consultSearchDTO {
	
	// 검색어
	private String keyword;
	
	private String serviceStatus;
	
	private Date firDate;
	
	private Date secDate;

}
