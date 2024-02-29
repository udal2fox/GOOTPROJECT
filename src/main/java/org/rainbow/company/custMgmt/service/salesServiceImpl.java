package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.salesVO;
import org.rainbow.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class salesServiceImpl implements salesService {
	
	 @Autowired
	 private org.rainbow.company.custMgmt.mapper.salesMapper salesMapper;
	
	 

	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기  */
	@Override
	public List<salesVO> getSalesList(Criteria cri) {
		log.info("getSalesList...." + cri);
		return salesMapper.getSalesList(cri);
	}
	
	
	
	/** 'salesView.jsp' 에서 상담 신청 내용 가져오기  */
	@Override
	public salesVO getSalesView(int cnslNo) {
		log.info("getSalesView...." + cnslNo);
		return salesMapper.getSalesView(cnslNo);
	}
	
	/** 'salesView.jsp' 에서 영업 내용 저장하기 */
	@Override
	public int saveSales(salesVO vo) {
		log.info("saveSales...." + vo);
		return salesMapper.saveSales(vo);
	}
	

}
