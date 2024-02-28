package org.rainbow.company.employeeSupervisePage.mapper;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;
import org.rainbow.domain.Criteria;

public interface searchEmployeeMapper {
	
	// 전체 직원 리스트
	public List<rain_employeeDTO> getList(Criteria cri);
	
	
	// 전체 직원 수 카운팅 
	public int getTotal();
	 
}
