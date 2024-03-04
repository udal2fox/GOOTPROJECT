package org.rainbow.company.ProductManagement.service;

import java.util.List;
import java.util.Map;

import org.rainbow.company.ProductManagement.domain.prdDownVO;
import org.rainbow.company.ProductManagement.domain.prdInputVO;
import org.rainbow.company.ProductManagement.domain.productListVO;
import org.rainbow.company.ProductManagement.domain.suppliersVO;
import org.rainbow.domain.Criteria;

public interface productPageService 
{
	//------------------ 상품관리 ---------------------- 
	
	/**상품 리스트 조회    version 2024-02-21 */
	public List<productListVO> prdList();
	
	/** 검색 상품 리스트 조회      version 2024-02-21 */
	public List<productListVO> getSearch(String keyword);
	
	/** 엑셀 파일 업로드 version 2024-02-21 */
	public int insertPrdExcel(prdInputVO vo);
	
	/** 체크박스 벨류를 받아서 필터링된 전체 데이터를 리스트로 가져온다. */
	public List<prdDownVO> downExcelList(Map<String, Object> checkValue); // 파라미터 이름 수정
	
	//------------------ 공급처 ------------------------
	
	/** 공급처 리스트 조회 */ 
	public List<suppliersVO> supsList();
	
	/** 공급처 검색  */
	public List<suppliersVO> supsSearch(String keyword);
	
	/** sups 엑셀 파일 업로드 */
	public int insertSupsExcel(suppliersVO vo);
	
	
}
