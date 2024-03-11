package org.rainbow.company.employeeSupervisePage.service;

import java.util.List;

import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
import org.rainbow.company.employeeSupervisePage.domain.rain_employeeDTO;
import org.rainbow.company.employeeSupervisePage.mapper.searchEmployeeMapper;
<<<<<<< HEAD
=======
import org.rainbow.domain.Criteria;
>>>>>>> origin/master
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
<<<<<<< HEAD
	public List<rain_employeeDTO> getList() {
		log.info("getList...");
		return mapper.getList();
=======
	public List<rain_employeeDTO> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getList(cri);
>>>>>>> origin/master
	}
	
	// 전체 직원 수 카운팅
	@Override 
	public int getTotal() { 
		log.info("getTotal..." ); 
		return mapper.getTotal(); 
	}
	
	// 직원 정보 조회
	@Override
	public rain_EmpVO get(int eno) {
		log.info("get..." + eno);
	    return mapper.get(eno); 
	}
	
	// 직원 정보 등록 
	@Override
	public void insert(rain_EmpVO vo) {
		log.info("insert..." + vo);
		mapper.insert(vo);    
	}
	
	// 직원 정보 편집
	@Override
	public void update(rain_EmpVO vo) {
		log.info("update..." + vo);
		mapper.update(vo);
	}
}
