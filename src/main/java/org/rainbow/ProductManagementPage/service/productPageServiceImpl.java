package org.rainbow.ProductManagementPage.service;

import java.util.List;

import org.rainbow.ProductManagement.domain.prdInputVO;
import org.rainbow.ProductManagement.domain.productListVO;
import org.rainbow.ProductManagement.mapper.productPageMapper;
import org.rainbow.domain.Criteria;
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
	public List<productListVO> prdList(Criteria cri) {
		log.info("prdList..."+cri);
		return pMapper.prdList(cri);
	}

	@Override
	public int prdCount() {
		return pMapper.prdCount();
	}

	@Override
	public List<productListVO> getSearch(Criteria cri) {
		return pMapper.getSearch(cri);
	}

	@Override
	public int getKeywordCount(Criteria cri) {
		return pMapper.getKeywordCount(cri);
	}

	@Override
	public int insertPrdExcel(prdInputVO vo) {
		log.info("vo...."+vo);
		return pMapper.insertPrdExcel(vo);
	}

}
