package org.rainbow.company.custMgmt.mapper;

import java.util.List;

import org.rainbow.company.custMgmt.domain.companyVO;
import org.rainbow.domain.Criteria;

public interface enterpriseMapper {
	
	/** 'enterprise.jsp' 에서 상담 요청 리스트 가져오기  */
	public List<companyVO> getEnterpriseList();



}
