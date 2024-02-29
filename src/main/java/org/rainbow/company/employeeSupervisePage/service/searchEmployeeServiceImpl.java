package org.rainbow.company.employeeSupervisePage.service;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.get_employeeDTO;
import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;
import org.rainbow.company.employeeSupervisePage.mapper.searchEmployeeMapper;
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
	public List<rain_employeeDTO> getList() {
		log.info("getList...");
		return mapper.getList();
	}
	
	// 전체 직원 수 카운팅
	@Override 
	public int getTotal() { 
		log.info("getTotal..." ); 
		return mapper.getTotal(); }
		
	// 직원 정보 조회 & 편집
	@Override
	public get_employeeDTO get(int eno) {
		log.info("get..." + eno);
		return mapper.get(eno);
	}
	
}
