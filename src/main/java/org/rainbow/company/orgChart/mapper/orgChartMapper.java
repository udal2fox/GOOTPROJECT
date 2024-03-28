package org.rainbow.company.orgChart.mapper;

import java.util.List;

import org.rainbow.company.orgChart.domain.orgChartDTO;

public interface orgChartMapper {
	
	// 조직도 차트 가져오기
	public List<orgChartDTO> getList();
}
