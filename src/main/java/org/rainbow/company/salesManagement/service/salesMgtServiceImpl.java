package org.rainbow.company.salesManagement.service;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.rainbow.company.salesManagement.domain.monthChartVO;
import org.rainbow.company.salesManagement.domain.salasTotalVO;
import org.rainbow.company.salesManagement.domain.salesComVO;
import org.rainbow.company.salesManagement.domain.salesPrdVO;
import org.rainbow.company.salesManagement.domain.smgtComDownVO;
import org.rainbow.company.salesManagement.mapper.salesMgtMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class salesMgtServiceImpl implements salesMgtService
{
	@Autowired
	salesMgtMapper smMapper;

	@Override
	public List<monthChartVO> monthChartData() {
		return smMapper.monthChartData();
	}

	@Override
	public List<monthChartVO> quarterChartData() {
		return smMapper.quarterChartData();
	}

	@Override
	public List<salesComVO> salesComList() {
		return smMapper.salesComList();
	}

	@Override
	public salasTotalVO salesTotal() {
		return smMapper.salesTotal();
	}

	@Override
	public List<smgtComDownVO> salesComDown(TradeDetailSearchDTO sdto) {
		return smMapper.salesComDown(sdto);
	}

	@Override
	public salasTotalVO salesVatTotal(TradeDetailSearchDTO sdto) {
		return smMapper.salesVatTotal(sdto);
	}

	@Override
	public List<salesComVO> salesComSearch(TradeDetailSearchDTO sdto) {
		return smMapper.salesComSearch(sdto);
	}

	@Override
	public List<salesPrdVO> salesPrdList() {
		return smMapper.salesPrdList();
	}

}
