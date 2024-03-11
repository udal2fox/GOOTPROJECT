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
	
	/** 페이징 처리 할 때 사용 */
	private int offset;
}
