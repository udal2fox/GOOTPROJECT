package org.rainbow.company.custMgmt.mapper;

import java.util.List;
import java.util.Map;

import org.rainbow.company.custMgmt.domain.spotAndUserVO;
import org.rainbow.company.custMgmt.domain.spotListVO;
import org.rainbow.company.custMgmt.domain.spotVO;
import org.rainbow.company.custMgmt.domain.userVO;

public interface spotMapper {
	
	/** 'spotList.jsp' 에서 지점 리스트 가져오기  */
	public List<spotVO> spotList();
	
	/** 서치바-키워드 검색*/
	public List<spotListVO> giveKeyword(String keyword);
	
	/** 'spotList.jsp' 에서 지점 정보 가져오기  */
	public spotVO spotView(int spotNo);
	
	/** 'salesView.jsp' 에서  지점 담당자 정보 가져오기  */
	public userVO getUserVO(int spotNo);
	
	/** 지점 정보 저장*/
	public void spotRegisterInsert(spotAndUserVO vo);
	
	/** 지점 담당자 정보 저장*/
	public void userRegisterInsert(Map<String, Object> params);
	
	/**마지막  spotNo 값 */
	public int getSpotNo();
	
	/** 지점 정보 수정*/
	public void spotUpdate(spotAndUserVO vo);
	
	/** 지점 담당자 정보 수정*/
	public void userUpdate(Map<String, Object> params);
	
	/**담당자 정보 모달창 : 담당자 정보 가져오기 */
	public userVO getManagerInfo(int spotNo);

}
