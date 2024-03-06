package org.rainbow.company.employeeSupervisePage.service;

import java.util.List;

<<<<<<< HEAD
import org.rainbow.company.employeeSupervisePage.domain.get_employeeDTO;
import org.rainbow.company.employeeSupervisePage.domain.insert_employeeDTO;
=======
import org.rainbow.company.employeeSupervisePage.domain.rain_EmpVO;
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
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
		return mapper.getTotal(); 
	}
<<<<<<< HEAD
		
	// 직원 정보 조회 & 편집
	@Override
	public get_employeeDTO get(int eno) {
		log.info("get..." + eno);
		return mapper.get(eno);
=======
	
	// 직원 정보 조회
	@Override
	public rain_EmpVO get(int eno) {
		log.info("get..." + eno);
	    return mapper.get(eno); 
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
	}
	
	// 직원 정보 등록 
	@Override
<<<<<<< HEAD
	public void insert(insert_employeeDTO dto) {
		log.info("insert..." + dto);
		mapper.insert(dto);    
=======
	public void insert(rain_EmpVO vo) {
		log.info("insert..." + vo);
		mapper.insert(vo);    
	}
	
	// 직원 정보 편집
	@Override
	public void update(rain_EmpVO vo) {
		log.info("update..." + vo);
		mapper.update(vo);
>>>>>>> 4c4150e691fa61b13ae5a8dbfb64d70e7ba06f03
	}
}
