package org.rainbow.company.employeeSupervisePage.service;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;
import org.rainbow.company.employeeSupervisePage.mapper.searchEmployeeMapper;
import org.rainbow.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class searchEmployeeServiceImpl implements searchEmployeeService {
	
	@Autowired
	private searchEmployeeMapper mapper;
	
	// 전체 직원 리스트
	@Override
	public List<rain_employeeDTO> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getList(cri);
	}
	
	// 전체 직원 수 카운팅
	@Override public int getTotal() { log.info("getTotal..." ); 
	return mapper.getTotal(); }
	
}
