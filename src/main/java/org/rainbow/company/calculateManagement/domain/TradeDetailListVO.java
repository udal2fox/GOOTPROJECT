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
<<<<<<< HEAD
	private double	 prdMargin;
=======
	private double prdMargin;
>>>>>>> origin/master
	// 결제 수단
	private String recPayMth;
	// 정산여부
	private String recSortation;
<<<<<<< HEAD
=======
	// 기업 기본키
	private String companyNo;
	// 지점 기본키
	private String spotNo;
>>>>>>> origin/master
	
	
}
