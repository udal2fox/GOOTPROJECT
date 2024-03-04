package org.rainbow.company.custMgmt.mapper;

import java.util.List;

import org.rainbow.company.custMgmt.domain.companyVO;


public interface companyMapper {
	
	/** 'companyList.jsp' 에서 기업 리스트 가져오기  */
	public List<companyVO> companyList();



}
