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
	public List<prdDownVO> downExcelList(Map<String, Object> checkValue) {
		return pMapper.downExcelList(checkValue);
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
	public List<supsDownVO> supsExcelDown(Map<String, Object> checkValue) {
		return pMapper.supsExcelDown(checkValue);
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
	public List<prdInputVO> getsupsNumber() {
		return pMapper.getsupsNumber();
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

		
	



	

	

}
