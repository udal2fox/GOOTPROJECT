package org.rainbow.company.orgChart.service;

import java.util.List;

import org.rainbow.company.orgChart.domain.orgChartDTO;

public interface orgChartService {
	
	// 조직도 차트 가져오기
	public List<orgChartDTO> getList();
}
