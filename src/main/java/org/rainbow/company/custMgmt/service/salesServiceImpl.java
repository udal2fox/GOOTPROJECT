package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.consultSearchDTO;
import org.rainbow.company.custMgmt.domain.consultVO;
import org.rainbow.company.custMgmt.domain.cshVO;
import org.rainbow.company.custMgmt.mapper.salesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Configuration
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class salesServiceImpl implements salesService {

	@Autowired
	private salesMapper salesMapper;
	
	@Override
	public List<consultVO> searchConsult(consultSearchDTO csSearchDto) {
		
		return salesMapper.searchConsult(csSearchDto);
	}

	@Override
	public List<consultVO> salesList() {
		
		return salesMapper.salesList();
	}
	@Override
	public consultVO salesView(int consultNo) {
		
		return salesMapper.salesView(consultNo);
	}
	
	@Override
	public cshVO getCshVO(int consultNo) {
		
		return salesMapper.getCshVO(consultNo);
	}
	
	@Transactional
	@Override
	public void saveSales(consultVO vo, cshVO cVO) {
	    log.info("saveSales...." + vo);
	    
	    // 1. RAIN_consult_tbl 테이블에 항목 내용 업데이트
	    salesMapper.saveSales(vo);
	    
	    // 2. 이미 존재하는 ConsultNo 가져오기
	    int consultNo = vo.getConsultNo();
	    log.info("consultNo " + consultNo);
	    
	    // 3. 새로운 테이블에 삽입
	    salesMapper.insertCsh(cVO, consultNo);
	}


	@Override
	public int saveFirstConsultHistory(cshVO cshvo) {
		
		return salesMapper.saveFirstConsultHistory(cshvo);
	}

	@Override

	public int saveConsultHistory(cshVO cshvo) {
		
		return salesMapper.saveConsultHistory(cshvo);
	}
	
	@Override
	public List<consultVO> searchCompanyListModal() {
		log.info("searchCompanyListModal...." );
		
		List<consultVO> list = salesMapper.searchCompanyListModal();
		
		log.info(list);
		
		return list;
	}
	
		@Override
		public List<consultVO> searchModalComName(String companyName) {
			log.info("searchModalComName...." );
			return salesMapper.searchModalComName(companyName);
		}
		
		@Override
		public List<consultVO> takeCsNameList() {
			
			return salesMapper.takeCsNameList();
		}

		@Override
		public List<consultVO> searchTakeCsName(String csName) {
			
			return salesMapper.searchTakeCsName(csName);
		}


}