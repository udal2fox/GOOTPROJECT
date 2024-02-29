package org.rainbow.company.custMgmt.mapper;

import org.rainbow.company.custMgmt.domain.cnslHisVO;

public interface cnslHisMapper {
	
	/** 'salesView.jsp' 에서 영업 내용 insert  */
	public int insertCnslHis(cnslHisVO vo);

}
