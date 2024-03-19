package org.rainbow.company.salesManagement.service;

import java.util.List;

import org.rainbow.company.salesManagement.domain.monthChartVO;
import org.rainbow.company.salesManagement.domain.salesComVO;

public interface salesMgtService {

	/** 월별 매출 데이터 가져오기*/
	public List<monthChartVO> monthChartData();
	
	/** 분기별 매출 데이터 */
	public List<monthChartVO> quarterChartData();
	
	/** 기업별 통계 리스트*/
	public List<salesComVO> salesComList();
	
	
	
}
