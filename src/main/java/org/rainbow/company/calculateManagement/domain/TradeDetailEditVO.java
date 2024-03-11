package org.rainbow.company.calculateManagement.domain;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
	
// 에딧 창 필요정보
@AllArgsConstructor
@NoArgsConstructor
@Data
public class TradeDetailEditVO {
	
	/** 기업명 */
	private String comName;
	
	/** 지점명 */
	private String spName;
	
	/** 기업구분 */
	private String comBizType;
	
	/** 담당자 */
	private String cEmpName;
		
	/** 대표연락처 */
	private String cEmpTel;
	
	/** 대표메일 */
	private String cEmpEmail;
	
	/** 일자 */
	private Date recDate;
	
	/** 결제수단 */
	private String recPayMth;
	
	/** 정산여부 */
	private String recSortation;
	
	/** 금액차감 적요(품목명) */
	private String ded_prdName;
	
	/** 차감 공급액 */
	private int recDedSup;
	
	/** 원가-공급액 */
	private int recDedCstSup;
	
	/** 원가 -세액 */
	private int recDedCstTax;
	
	/** 추가 정산 적요(품목명) */
	private String add_prdName;
	
	/** 추가정산 공급액 */
	private int recAddSup;
	
	/** 추가정산 세액 */
	private int recAddTax;
	
	/** 원가 -공급액 */
	private int recAddCstSup;
	
	/** 원가-세액 */
	private int recAddCstTax;
	
	/** 대분류*/
	private String prdMajorCtg;
	
	/** 소분류*/
	private String prdSubCtg;
	
	/** 상품코드*/
	private String prdNo;
	
	/** 상품명*/
	private String prdName;
	
	/** 판매가*/
	private int prdSal;
	
	/** 원가*/
	private int prdCstPri;
	
	/** 마진율*/
	private double prdMargin;
	
			
	
}


