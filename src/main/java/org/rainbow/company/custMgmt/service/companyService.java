package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.companySearchDTO;
import org.rainbow.company.custMgmt.domain.companyVO;




public interface companyService {
	
	/** 서치바-키워드 검색*/
	public List<companyVO> getSearch(companySearchDTO companySearchDTO);
	
	
	/** 'companyList.jsp' 에서 기업 리스트 가져오기  */
	public List<companyVO> companyList();
	
	/** 'companyRegister.jsp' 에서 새로운 기업 등록하기*/
	public int companyRegister(companyVO vo);
	
	
	/** 'companyList.jsp' 에서 기업 정보 가져오기  */
	public companyVO companyView(int companyNo);
	

	/** 사업자등록번호 유효 api*/
	public List<companyVO> checkBizNum(List<String> bizNumArray);

}
