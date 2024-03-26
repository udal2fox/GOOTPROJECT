package org.rainbow.company.ProductManagement.service;

import java.util.List;
import java.util.Map;

import org.rainbow.company.ProductManagement.domain.prdDownVO;
import org.rainbow.company.ProductManagement.domain.prdInputVO;
import org.rainbow.company.ProductManagement.domain.prdInsertVO;
import org.rainbow.company.ProductManagement.domain.productListVO;
import org.rainbow.company.ProductManagement.domain.suppliersVO;
import org.rainbow.company.ProductManagement.domain.supsDownVO;
import org.rainbow.company.calculateManagement.domain.TradeDetailSearchDTO;

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
	public List<prdDownVO> downExcelList(TradeDetailSearchDTO sdto); // 파라미터 이름 수정
	
	/** 입점업체코드 가져오기 */
	public String getsupsNumber(String code);
	/** 소분류 가져오기 */
	public List<prdInputVO> getSubCtg();

	/** 상품 개별 등록 */
	public int productInput(prdInsertVO pvo);
	
	/** 상품 수정 리스트 가져오기*/
	public prdInputVO getprdVo(String prdNo);
	
	/** 상품 수정 */
	public int prdUpdate(prdInsertVO pvo);
	
	/** 상품 삭제*/
	public int prdDelete(prdInsertVO pvo);
	
	//------------------ 공급처 ------------------------
	
	/** 공급처 리스트 조회 */ 
	public List<suppliersVO> supsList();
	
	/** 공급처 검색  */
	public List<suppliersVO> supsSearch(String keyword);
	
	/** sups 엑셀 파일 업로드 */
	public int insertSupsExcel(suppliersVO vo);
	
	/** 체크박스 벨류를 받아서 필터링된 전체 데이터를 리스트로 가져온다. */
	public List<supsDownVO> supsExcelDown(TradeDetailSearchDTO sdto); // 파라미터 이름 수정
	
	/** 공급처 등록 자동 할당값에 쓸 카운팅 */
	public int supsNoCount();
	
	/** 공급처 등록 reg */
	public int insertSups(suppliersVO vo);
	
	/** 공급처 수정 기존정보 가져오기ㅏ */
	public suppliersVO getSupsVO(String supsNo);
	
	/** 공급처 수정 */
	public int supsUpdate(suppliersVO vo);
	
	/** 공급처 삭제*/
	public int supsDelete(suppliersVO vo);
	
	
	
}
