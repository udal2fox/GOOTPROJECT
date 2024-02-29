package org.rainbow.company.custMgmt.service;


import java.util.List;

import org.rainbow.company.custMgmt.domain.companyVO;
import org.rainbow.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class enterpriseServiceImpl implements enterpriseService{
	
	@Autowired
	private org.rainbow.company.custMgmt.mapper.enterpriseMapper enterpriseMapper;
	
	
	@Override
	public List<companyVO> getEnterpriseList() {
		
		return enterpriseMapper.getEnterpriseList();
	}
	

}
