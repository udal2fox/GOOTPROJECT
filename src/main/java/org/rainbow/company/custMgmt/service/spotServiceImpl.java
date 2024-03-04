package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.spotVO;
import org.rainbow.company.custMgmt.mapper.spotMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class spotServiceImpl implements spotService{
	
	@Autowired
	private spotMapper spotMapper;
	
	@Override
	public List<spotVO> spotList() {
		
		return spotMapper.spotList();
	}
	

}
