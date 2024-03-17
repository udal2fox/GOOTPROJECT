package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.consultSearchDTO;
import org.rainbow.company.custMgmt.domain.consultVO;
import org.rainbow.company.custMgmt.domain.cshVO;
import org.rainbow.company.custMgmt.mapper.salesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class salesServiceImpl implements salesService {

	@Autowired
	private salesMapper salesMapper;
	
	@Override
	public List<consultVO> getSearch(consultSearchDTO consultSearchDTO) {
		
		return salesMapper.getSearch(consultSearchDTO);
	}
	


	@Override
	public List<consultVO> salesList() {
		
		return salesMapper.salesList();
	}
	@Override
	public consultVO salesView(int consultNo) {
		
		return salesMapper.salesView(consultNo);
	}
	

	@Override

	public int saveSales(consultVO vo) {
		
		return salesMapper.saveSales(vo);
	}

	@Override

	public int saveFirstConsultHistory(cshVO cshvo) {
		
		return salesMapper.saveFirstConsultHistory(cshvo);
	}

	@Override

	public int saveConsultHistory(cshVO cshvo) {
		
		return salesMapper.saveConsultHistory(cshvo);
	}




}