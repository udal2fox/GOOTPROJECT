package org.rainbow.company.calculateManagement.service;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;



public interface TradeDetaiService {

	/** tdList 조회*/
	public List<TradeDetailListVO> tradeDetailList();
	
	/** tdList 서치*/
	public List<TradeDetailListVO> searchTd(TradeDetailSearchDTO tdDTO);
	
}
