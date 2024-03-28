package org.rainbow.company.orgChart.service;

import java.util.List;

import org.rainbow.company.orgChart.domain.orgChartDTO;
import org.rainbow.company.orgChart.mapper.orgChartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class orgChartServiceImpl implements orgChartService {
	
	@Autowired
	private orgChartMapper mapper;
	
	// 조직도 차트 가져오기
	@Override
	public List<orgChartDTO> getList() {
		log.info("get orgChart...");
		return mapper.getList();
	}
}	