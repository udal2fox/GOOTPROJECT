package org.rainbow.company.custMgmt.mapper;

import java.util.List;

import org.rainbow.company.custMgmt.domain.consultVO;

import org.rainbow.domain.Criteria;


public interface salesMapper {
	

	
	
	
	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기  */
	public List<consultVO> salesList();
	
	/** 'salesView.jsp' 에서 상담 신청 내용 가져오기  */
	public consultVO salesView(int consultNo);
	
	/** 'salesView.jsp' 에서 영업 내용 저장하기 */
	public int saveSales(consultVO vo);

}
