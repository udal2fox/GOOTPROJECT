package org.rainbow.company.calculateManagement.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/** 거래 명세 검색용 키워드 받는 그릇*/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TradeDetailSearchDTO
{
	// 검색어
	private String keyword;
	
	private String recPayMth;
	
	private Date firDate;
	
	private Date secDate;
	
	private String[] checkedValues;
}
