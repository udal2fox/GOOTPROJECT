package org.rainbow.company.employeeSupervisePage.service;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.get_employeeDTO;
import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;


public interface searchEmployeeService {
	
	// 전체 직원 리스트
	public List<rain_employeeDTO> getList();
	
	// 전체 직원 수 카운팅 
	public int getTotal();
	 
	// 직원 정보 조회 & 편집
	public get_employeeDTO get(int eno);
	
	// 직원 정보 등록
	public void insert(get_employeeDTO dto);
}
