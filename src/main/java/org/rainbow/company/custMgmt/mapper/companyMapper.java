package org.rainbow.company.custMgmt.mapper;

import java.util.List;
import java.util.Map;

import org.rainbow.company.custMgmt.domain.companyDownVO;
import org.rainbow.company.custMgmt.domain.companyInputVO;
import org.rainbow.company.custMgmt.domain.companyVO;


public interface companyMapper {
	
	
	/** 서치바-키워드 검색*/
	public List<companyVO> giveKeyword(String keyword);
	
	
	/** 'companyList.jsp' 에서 기업 리스트 가져오기  */
	public List<companyVO> companyList();
	
	
	/** 'companyRegister.jsp' 에서 새로운 기업 등록하기*/
	public int companyRegister(companyVO vo);
	
	/** 'companyList.jsp' 에서 기업 정보 가져오기  */
	public companyVO companyView(int companyNo);
	
	
	/** 사업자등록번호 유효 api*/
	public List<companyVO> checkBizNum(List<String> bizNumArray);


	/** 엑셀 파일 업로드 version 2024-02-21 */
	public int insertCompanyExcel(companyInputVO vo);
	
	/** 체크박스 벨류를 받아서 필터링된 전체 데이터를 리스트로 가져온다. */
	public List<companyDownVO> downExcelList(Map<String, Object> filteredValue); // 파라미터 이름 수정


	/** db에 저장된 파일들 가져오기 및 파일 다운로드 */
	public List<companyVO> getCompanyLicenseFileURL(String jsonData);

	/** 기업 정보 update*/
	public int updateCompany(companyVO vo);
	
	/** 기업 연결 모달창 에서 기업 리스트 가져오기 */
	public List<companyVO> takeComNameList();
	
	/** 기업 연결 모달창 에서 검색한 기업명 가져오기 */
	public List<companyVO> searchTakeComName(String comName);

}
