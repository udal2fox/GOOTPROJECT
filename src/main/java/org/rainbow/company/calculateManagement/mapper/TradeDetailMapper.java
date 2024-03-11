package org.rainbow.company.calculateManagement.mapper;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
<<<<<<< HEAD
=======
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
>>>>>>> origin/master


public interface TradeDetailMapper {

<<<<<<< HEAD
	public List<TradeDetailListVO> tradeDetailList();
	
=======
	/** tdList 조회*/
	public List<TradeDetailListVO> tradeDetailList();
	
	/** tdList 서치*/
	public List<TradeDetailListVO> searchTd(TradeDetailSearchDTO tdDTO);
	
>>>>>>> origin/master
	
}
