package org.rainbow.company.salesManagement.mapper;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.rainbow.company.salesManagement.domain.monthChartVO;
import org.rainbow.company.salesManagement.domain.salasTotalVO;
import org.rainbow.company.salesManagement.domain.salesComVO;
import org.rainbow.company.salesManagement.domain.salesPrdVO;

public interface salesMgtMapper 
{
	/** 월별 매출 데이터 가져오기*/
	public List<monthChartVO> monthChartData();
	
	/** 분기별 매출 데이터 */
	public List<monthChartVO> quarterChartData();
	
	/** 기업별 통계 리스트*/
	public List<salesComVO> salesComList();
	
	/** 판매된 상품수 총 판매액 구입액*/
	public salasTotalVO salesTotal();
	
	/** 기업매출 다운로드 */
	public List<salesComVO> salesComDown(TradeDetailSearchDTO sdto);
	
	/** vat 통계*/
	public salasTotalVO salesVatTotal(TradeDetailSearchDTO sdto);
	
	/** 기업매출 검색*/
	public List<salesComVO> salesComSearch(TradeDetailSearchDTO sdto);
	
	/** 상품별 매출 통계 리스트*/
	public List<salesPrdVO> salesPrdList();
	
	/** 기업매출 다운로드 */
	public List<salesPrdVO> salesPrdDown(TradeDetailSearchDTO sdto);
	
	/** 기업매출 서치*/
	public List<salesPrdVO> salesPrdSearch(TradeDetailSearchDTO sdto);
	
	
}
