package org.rainbow.company.calculateManagement.service;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailEditVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.rainbow.company.calculateManagement.domain.tdDownVO;



public interface TradeDetaiService {

	/** tdList 조회*/
	public List<TradeDetailListVO> tradeDetailList();
	
	/** tdList 서치*/
	public List<TradeDetailListVO> searchTd(TradeDetailSearchDTO tdDTO);
	
	/** tdList 결제처리 */
	public int paymentProcessing(List<String> recNo);
	
	/** tdList 대손처리 */
	public int bigHandProcessing(List<String> recNo);
	
	/** 다운받을 리스트 서치 */
	public List<tdDownVO> tdDownList(List<String> checkValues);
	
	/** 거레명세 수정 불러오기*/
	public TradeDetailEditVO editTdList(String recNo);
	
	
}
