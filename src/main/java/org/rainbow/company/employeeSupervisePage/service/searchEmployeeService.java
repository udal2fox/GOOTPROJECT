package org.rainbow.company.employeeSupervisePage.service;

import java.util.HashMap;
import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.EmployeeExcelDTO;
import org.rainbow.company.employeeSupervisePage.domain.EmployeeSearchDTO;
import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;

public interface searchEmployeeService {
	
	// 전체 직원 리스트
	public List<rain_employeeDTO> getList();
	
	// 전체 직원 수 카운팅 
	public int getTotal();
	 
	// 직원 정보 조회 
	public rain_EmpVO get(int eno);
	
	// 직원 정보 등록
	public void insert(rain_EmpVO vo);
	
	// 직원 정보 편집
	public void update(rain_EmpVO vo);
	
	// 개인 프로필 편집
	public int profile_update(HashMap<String, Object> result);
	
	// 프사만 저장
	public int profilePictureUpdate(HashMap<String, Object> result);
	
	// 사원 리스트 엑셀화
	public List<EmployeeExcelDTO> excelDown(EmployeeSearchDTO empdto);
}
