package org.rainbow.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class Criteria
{
	private int pageNum;
	private int amount;
	
	/** 검색할때 필요해서 사용함 */
	private String keyword;
	
}
