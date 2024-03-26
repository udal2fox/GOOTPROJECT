package org.rainbow.company.ProductManagement.service;

import java.util.List;
import java.util.Map;

import org.rainbow.company.ProductManagement.domain.prdDownVO;
import org.rainbow.company.ProductManagement.domain.prdInputVO;
import org.rainbow.company.ProductManagement.domain.prdInsertVO;
import org.rainbow.company.ProductManagement.domain.productListVO;
import org.rainbow.company.ProductManagement.domain.suppliersVO;
import org.rainbow.company.ProductManagement.domain.supsDownVO;
import org.rainbow.company.ProductManagement.mapper.productPageMapper;
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class productPageServiceImpl implements productPageService
{
	@Autowired
	productPageMapper pMapper;

	@Override
	public List<productListVO> prdList() {
		return pMapper.prdList();
	}

	@Override
	public List<productListVO> getSearch(String keyword) 
	{
		return pMapper.getSearch(keyword);
	}

	@Override
	public int insertPrdExcel(prdInputVO vo) {
		log.info("vo...."+vo);
		return pMapper.insertPrdExcel(vo);
	}

	@Override
	public List<prdDownVO> downExcelList(TradeDetailSearchDTO sdto) {
		return pMapper.downExcelList(sdto);
	}

	@Override
	public List<suppliersVO> supsList() {
		return pMapper.supsList();
	}

	@Override
	public List<suppliersVO> supsSearch(String keyword)
	{
		return pMapper.supsSearch(keyword);
	}

	@Override
	public int insertSupsExcel(suppliersVO vo) {
		
		return pMapper.insertSupsExcel(vo);
	}

	@Override
	public List<supsDownVO> supsExcelDown(TradeDetailSearchDTO sdto) {
		return pMapper.supsExcelDown(sdto);
	}

	@Override
	public int supsNoCount() 
	{
		return pMapper.supsNoCount();
	}

	@Override
	public int insertSups(suppliersVO vo) {
		return pMapper.insertSups(vo);
	}

	@Override
	public suppliersVO getSupsVO(String supsNo) {
		return pMapper.getSupsVO(supsNo);
	}

	@Override
	public int supsUpdate(suppliersVO vo) {
		return pMapper.supsUpdate(vo);
	}

	@Override
	public int supsDelete(suppliersVO vo) {
		return pMapper.supsDelete(vo);
	}

	@Override
	public String getsupsNumber(String code) {
		return pMapper.getsupsNumber(code);
	}

	@Override
	public List<prdInputVO> getSubCtg() {
		return pMapper.getSubCtg();
	}	
	
	public int productInput(prdInsertVO pvo) {
		return pMapper.productInput(pvo);
	}

	@Override
	public prdInputVO getprdVo(String prdNo) {
		return pMapper.getprdVo(prdNo);
	}

	@Override
	public int prdUpdate(prdInsertVO pvo) {
		return pMapper.prdUpdate(pvo);
	}

	@Override
	public int prdDelete(prdInsertVO pvo) {
		return pMapper.prdDelete(pvo);
	}

		
	



	

	

}
