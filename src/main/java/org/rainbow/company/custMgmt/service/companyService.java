package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.companyVO;


public interface companyService {
	
	
	/** 'companyList.jsp' 에서 상담 요청 리스트 가져오기  */
	public List<companyVO> getCompanyList();

}
