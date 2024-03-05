package org.rainbow.company.orderStatementPage.service;

import java.util.List;

import org.rainbow.company.orderStatementPage.domain.orderStatementPageVO;
import org.rainbow.company.orderStatementPage.domain.testVO;
import org.rainbow.company.orderStatementPage.mapper.orderStatementPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class orderStatementPageServiceImpl implements orderStatementPageService {

	@Autowired
	orderStatementPageMapper ordStatMapper;
	
	@Override
	public List<testVO> ordStatlist(){
		return ordStatMapper.ordStatlist();
	}

}
