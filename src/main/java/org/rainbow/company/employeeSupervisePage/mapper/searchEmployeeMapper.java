package org.rainbow.company.employeeSupervisePage.mapper;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
import org.rainbow.domain.Criteria;

public interface searchEmployeeMapper {
	
	// 전체 리스트
	public List<rain_EmpVO> getList(Criteria cri);
}
