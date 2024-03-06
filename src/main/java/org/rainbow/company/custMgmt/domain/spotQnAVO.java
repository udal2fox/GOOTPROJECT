package org.rainbow.company.custMgmt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class spotQnAVO {
	
	private int spotQnANo, spotNo;
	private String  questionTitle, questionContent, answerContent;
	private Date questionDate, answerDate;
	
	

}
