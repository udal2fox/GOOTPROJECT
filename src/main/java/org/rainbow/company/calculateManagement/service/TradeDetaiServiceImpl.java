package org.rainbow.company.calculateManagement.service;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
<<<<<<< HEAD
=======
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
>>>>>>> origin/master
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
>>>>>>> origin/master
	


}
