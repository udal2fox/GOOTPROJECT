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



public interface TradeDetaiService {

<<<<<<< HEAD
	public List<TradeDetailListVO> tradeDetailList();
	
=======
	/** tdList 조회*/
	public List<TradeDetailListVO> tradeDetailList();
	
	/** tdList 서치*/
	public List<TradeDetailListVO> searchTd(TradeDetailSearchDTO tdDTO);
	
<<<<<<< HEAD
>>>>>>> origin/master
=======
	/** tdList 결제처리 */
	public int paymentProcessing(List<String> recNo);
	
	/** tdList 대손처리 */
	public int bigHandProcessing(List<String> recNo);
	
	/** 다운받을 리스트 서치 */
	public List<tdDownVO> tdDownList(List<String> checkValues);
	
>>>>>>> 71ecaf1cff3f3faa16691b0f27a6dcfc96adea51
}
