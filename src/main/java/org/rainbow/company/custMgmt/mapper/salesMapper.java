package org.rainbow.company.custMgmt.mapper;

import java.util.List;

import org.rainbow.company.custMgmt.domain.consultVO;
import org.rainbow.company.custMgmt.domain.cshVO;



public interface salesMapper {
	

	
	
	
	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기  */
	public List<consultVO> salesList();
	
	/** 'salesView.jsp' 에서 상담 신청 내용 가져오기  */
	public consultVO salesView(int consultNo);
	
	/** 'salesView.jsp' 에서 영업 내용 저장(수정)하기 */
	public int saveSales(consultVO vo);
	
	/** 'salesView.jsp' 에서 첫번째 영업 히스토리 저장(수정)하기 */
	public int saveFirstConsultHistory(cshVO cshvo);
	
	/** 'salesView.jsp' 에서 영업 히스토리 저장(수정)하기 */
	public int saveConsultHistory(cshVO cshvo);

}
