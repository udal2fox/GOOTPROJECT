package org.rainbow.company.calculateManagement.service;

import java.util.List;

import org.rainbow.company.calculateManagement.domain.TradeDetailEditVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailListVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.rainbow.company.calculateManagement.domain.tdDownVO;
import org.rainbow.company.calculateManagement.domain.ucBranchDownVO;
import org.rainbow.company.calculateManagement.domain.ucComDownVO;
import org.rainbow.company.calculateManagement.domain.ucTdDown;
import org.rainbow.company.calculateManagement.mapper.TradeDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class TradeDetaiServiceImpl implements TradeDetaiService {

	@Autowired
	TradeDetailMapper tMapper;

	@Override
	public List<TradeDetailListVO> tradeDetailList() {
		return tMapper.tradeDetailList();
	}

	@Override
	public List<TradeDetailListVO> searchTd(TradeDetailSearchDTO tdDTO) {
		return tMapper.searchTd(tdDTO);
	}

	@Override
	public int paymentProcessing(List<String> recNo) {
		return tMapper.paymentProcessing(recNo);
	}

	@Override
	public int bigHandProcessing(List<String> recNo) {
		return tMapper.bigHandProcessing(recNo);
	}

	@Override
	public List<tdDownVO> tdDownList(TradeDetailSearchDTO sdto) {
		return tMapper.tdDownList(sdto);
	}

	@Override
	public TradeDetailEditVO editTdList(String recNo) {
		return tMapper.editTdList(recNo);
	}
	
	@Transactional
	@Override
	public int editTdupdate(TradeDetailEditVO vo) {
		tMapper.editOrder(vo);
		return tMapper.editTdupdate(vo);
	}

	// 미수관리 시작
	@Override
	public List<TradeDetailListVO> ucCompany() {
		return tMapper.ucCompany();
	}

	@Override
	public List<TradeDetailListVO> ucComSearch(TradeDetailSearchDTO tdDTO) {
		return tMapper.ucComSearch(tdDTO);
	}

	@Override
	public List<ucComDownVO> ucComDown(TradeDetailSearchDTO sdto) {
		return tMapper.ucComDown(sdto);
	}

	@Override
	public List<TradeDetailListVO> ucBranchList() {
		return tMapper.ucBranchList();
	}

	@Override
	public List<TradeDetailListVO> ucBranchSearch(TradeDetailSearchDTO tdDTO) {
		List<TradeDetailListVO> ucbvo = tMapper.ucBranchSearch(tdDTO);
		return ucbvo;
	}
	
	@Override
	public List<TradeDetailListVO> uctdList() {
		return tMapper.uctdList();
	}

	@Override
	public List<ucBranchDownVO> ucBranchDown(TradeDetailSearchDTO sdto) {
		return tMapper.ucBranchDown(sdto);
	}

	@Override
	public List<TradeDetailListVO> ucTdSearch(TradeDetailSearchDTO tdDTO) {
		return tMapper.ucTdSearch(tdDTO);
	}

	@Override
	public List<tdDownVO> ucTdDown(TradeDetailSearchDTO sdto) {
		return tMapper.ucTdDown(sdto);
	}

	@Override
	public List<TradeDetailListVO> IoBillList() {
		return tMapper.IoBillList();
	}

	@Override
	public int billMakeProcessing(List<String> recNo) {
		return tMapper.billMakeProcessing(recNo);
	}

	@Override
	public List<TradeDetailListVO> billSearch(TradeDetailSearchDTO tdDTO) {
		return tMapper.billSearch(tdDTO);
	}

	
	
	
	


}
