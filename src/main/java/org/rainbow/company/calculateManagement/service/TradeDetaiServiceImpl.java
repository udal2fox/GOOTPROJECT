package org.rainbow.company.calculateManagement.service;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
<<<<<<< HEAD
=======
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
<<<<<<< HEAD
>>>>>>> origin/master
=======
import org.rainbow.company.calculateManagement.domain.tdDownVO;
>>>>>>> 71ecaf1cff3f3faa16691b0f27a6dcfc96adea51
import org.rainbow.company.calculateManagement.mapper.TradeDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class TradeDetaiServiceImpl implements TradeDetaiService {

	@Autowired
	TradeDetailMapper tMapper;

	@Override
	public List<TradeDetailListVO> tradeDetailList() {
		return tMapper.tradeDetailList();
	}
<<<<<<< HEAD
=======

	@Override
	public List<TradeDetailListVO> searchTd(TradeDetailSearchDTO tdDTO) {
		return tMapper.searchTd(tdDTO);
	}
<<<<<<< HEAD
>>>>>>> origin/master
=======

	@Override
	public int paymentProcessing(List<String> recNo) {
		return tMapper.paymentProcessing(recNo);
	}

	@Override
	public int bigHandProcessing(List<String> recNo) {
		return tMapper.bigHandProcessing(recNo);
	}

	@Override
	public List<tdDownVO> tdDownList(List<String> checkValues) {
		return tMapper.tdDownList(checkValues);
	}
	
	
>>>>>>> 71ecaf1cff3f3faa16691b0f27a6dcfc96adea51
	


}
