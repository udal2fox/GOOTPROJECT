package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.spotListVO;
import org.rainbow.company.custMgmt.domain.spotVO;
import org.rainbow.company.custMgmt.domain.userVO;

public interface spotService {
	
	/** 'spotList.jsp' 에서 지점 리스트 가져오기 */
	public List<spotVO> spotList();
	
	/** 서치바-키워드 검색*/
	public List<spotListVO> giveKeyword(String keyword);
	
	
	/** 'spotList.jsp' 에서 지점 정보 가져오기  */
	public spotVO spotView(int spotNo);
	
	/** 'salesView.jsp' 에서  지점 담당자 정보 가져오기  */
	public userVO getUserVO(int spotNo);
	
	/** 지점 정보 저장*/
	public void spotRegisterInsert(spotVO vo,userVO userVO);
	


}
