package org.rainbow.company.calculateManagement.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 리스트 띄우는 용도
@AllArgsConstructor
@NoArgsConstructor
@Data
public class TradeDetailListVO
{
	// 거래명세번호
	private int recNo;
	// 기업명
	private String comName;
	// 기업구분
	private String comBizType;
	// 지점명
	private String spName;
	// 일자
	private Date recDate;
	// 합계
	private int recSum;
	// 공급액
	private int recSup;
	// 세액
	private int recTax;
	// 원가
	private int prdCstPri;
	// 마진율
	private double prdMargin;
	// 결제 수단
	private String recPayMth;
	// 정산여부
	private String recSortation;
	// 기업 기본키
	private String companyNo;
	// 지점 기본키
	private int spotNo;
	// 기업이메일 메일기능 삽입시 활용해봄
	private String comEmail;
	// 담당자 이메일
	private String cEmpEmail;
	/** 차금 금액 */
	private int recDed;
	/** 추가 금액  */
	private int recAdd;
	/** 차금 금액 */
	private int recDedSup;
	/** 추가 금액 */
	private int recAddSup;
	/** 차금 금액 */
	private int recDedTax;
	/** 추가 금액 */
	private int recAddTax;
	
	
	
	
	
}
