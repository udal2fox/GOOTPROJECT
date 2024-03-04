package org.rainbow.company.custMgmt.service;


import java.util.List;

import org.rainbow.company.custMgmt.domain.companyVO;
import org.rainbow.company.custMgmt.mapper.companyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class companyServiceImpl implements companyService{
	
	@Autowired
	private companyMapper companyMapper;
	
	
	@Override
	public List<companyVO> companyList() {
		
		return companyMapper.companyList();
	}
	

}
