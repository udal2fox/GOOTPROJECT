package org.rainbow.company.calculateManagement.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class receiptTableVO 
{
	/** 거래 명세 번호 */
	private int recNo;
	
	/** 지점관리 번호*/
	private int spotNo;
	
	/** 주문 번호*/
	private int ordNo;
	
	/** 임직원 관리 번호*/
	private int custEmpNo;
	
	/** 상품 코드*/
	private String prdNo;
	
	/** */
	private Date recDate;
	
	/** 총계*/
	private int recSum;
	
	/** 공급액*/
	private int recSup;
	
	/** 세액*/
	private int recTax;
	
	/** 차감공급액*/
	private int recDedSup;
	
	/** 차감세액*/
	private int recDedTax;
	
	/** 추가정산공급액*/
	private int recDedCstSup;
	
	/** 추가정산세액*/
	private int recDedCstTax;
	
	/** 추가정산원가-공급액*/
	private int recAddSup;
	
	/** 추가정산원가-공급액*/
	private int recAddTax;
	
	/** 추가정산원가-공급액*/
	private int recAddCstSup;
	
	/** 추가정산원가-공급액*/
	private int recAddCstTax;
	
	/** 정산상태*/
	private boolean recPayStat;
	
	/** 결제수단*/
	private int recPayMth;
	
	/** 발급여부*/
	private boolean recIssStat;

}

