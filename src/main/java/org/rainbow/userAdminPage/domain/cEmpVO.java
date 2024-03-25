package org.rainbow.userAdminPage.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode
public class cEmpVO {
	private int cEmpNo, spotNo; 
	private String cEmpName, cEmpTel, cEmpEmail, cEmpPosition; 
	private Date cEmpBirth;
}
