package org.rainbow.company.employeeSupervisePage.service;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;
import org.rainbow.domain.Criteria;


public interface searchEmployeeService {
	
	// 전체 직원 리스트
	public List<rain_employeeDTO> getList(Criteria cri);
	
	// 전체 직원 수 카운팅 
	public int getTotal();
	 
	// 직원 정보 조회 
	public rain_EmpVO get(int eno);
	
	// 직원 정보 등록
	public void insert(rain_EmpVO vo);
	
	// 직원 정보 편집
	public void update(rain_EmpVO vo);
}
