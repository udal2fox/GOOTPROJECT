package org.rainbow.company.employeeSupervisePage.mapper;

import java.util.List;

<<<<<<< HEAD
import org.rainbow.company.employeeSupervisePage.domain.get_employeeDTO;
import org.rainbow.company.employeeSupervisePage.domain.insert_employeeDTO;
=======
import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;


public interface searchEmployeeMapper {
	
	// 전체 직원 리스트
	public List<rain_employeeDTO> getList();
	
	// 전체 직원 수 카운팅 
	public int getTotal();
	
	// 직원 정보 조회 
<<<<<<< HEAD
	public get_employeeDTO get(int eno);
	
	// 직원 정보 등록
	public void insert(insert_employeeDTO dto); 
=======
	public rain_EmpVO get(int eno);
	
	// 직원 정보 등록
	public void insert(rain_EmpVO vo); 
	
	// 직원 정보 편집
	public void update(rain_EmpVO vo);
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
}
