package org.rainbow.company.custMgmt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class spotQnAVO {
	
	private int spotQnANo, spotNo;
	private String  questionTitle, questionContent, answerContent;
	private Date questionDate, answerDate;
	
	

}
