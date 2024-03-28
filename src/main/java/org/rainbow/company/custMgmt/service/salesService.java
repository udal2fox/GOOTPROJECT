package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.consultAndCshVO;
import org.rainbow.company.custMgmt.domain.consultSearchDTO;
import org.rainbow.company.custMgmt.domain.consultVO;
import org.rainbow.company.custMgmt.domain.cshVO;


public interface salesService {
	
	/** 서치바-키워드 검색*/
	public List<consultVO> searchConsult(consultSearchDTO csSearchDto);
	
	/** 'salesList.jsp' 에서 상담 요청 리스트 가져오기 */
	public List<consultVO> salesList();

	/** 'salesView.jsp' 에서 상담 신청 내용 가져오기  */
	public consultVO salesView(int consultNo);
	
	/** 'salesView.jsp' 에서 영업 히스토리 내용 가져오기  */
	public cshVO getCshVO(int consultNo);
	
	/** 'salesView.jsp' 에서 영업 내용 저장(수정)하기 */
	public void saveSales(consultAndCshVO vo);
	
	/** 'salesView.jsp' 에서 영업 내용 수정하기 */
	public void updateSalesAndHistory(consultAndCshVO vo);
	
	
	/** 기업명 찾기 모달창 : 기업 리스트 가져오기*/
	public List<consultVO> searchCompanyListModal();
	
	/** 기업명 찾기(모달창)에서 기업명 검색 기능 */
	public List<consultVO> searchModalComName(String companyName);
	
	/** 담당자명  모달창 에서 담당자 리스트 가져오기 */
	public List<consultVO> takeCsNameList();
	
	/** 담당자명  모달창 에서 검색한 담당자명 가져오기 */
	public List<consultVO> searchTakeCsName(String csName);
											 

}
