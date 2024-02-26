package org.rainbow.company.ProductManagement.service;

import java.util.List;

import org.rainbow.company.ProductManagement.domain.prdInputVO;
import org.rainbow.company.ProductManagement.domain.productListVO;
import org.rainbow.domain.Criteria;

public interface productPageService 
{
	/**상품 리스트 조회 메서드 페이징 처리 완료      version 2024-02-21 */
	public List<productListVO> prdList(Criteria cri);
	
	/** 상품 리스트 갯수 카운팅      version 2024-02-21 */
	public int prdCount();
	
	/** 검색 상품 리스트 조회      version 2024-02-21 */
	public List<productListVO> getSearch(Criteria cri);
	
	/** 검색된 상품 리스트 갯수 카운팅      version 2024-02-21 */
	public int getKeywordCount(Criteria cri);
	
	/** 엑셀 파일 업로드 version 2024-02-21 */
	public int insertPrdExcel(prdInputVO vo);
	
}
