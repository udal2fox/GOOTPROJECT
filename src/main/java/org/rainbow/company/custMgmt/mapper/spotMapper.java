package org.rainbow.company.custMgmt.mapper;

import java.util.List;

import org.rainbow.company.custMgmt.domain.spotVO;

public interface spotMapper {
	
	/** 'spotList.jsp' 에서 지점 리스트 가져오기  */
	public List<spotVO> spotList();

}
