package org.rainbow.company.custMgmt.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.rainbow.company.custMgmt.domain.cnslHisVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class cnslHisMapperTest {
	
	
	@Autowired
	private cnslHisMapper cnslHisMapper;
	
	
	/** 'salesView.jsp' 에서 영업 내용 insert  */
	@Test
	public void testInsertCnslHis() {
		
		cnslHisVO vo = new cnslHisVO();
		
		vo.setCnslHisCnt1("ㅎㅇ");
		vo.setCnslNo(1);
		vo.setCnslHisNo(11);
		
		
		int result = cnslHisMapper.insertCnslHis(vo);
		log.info("영업 내용"+result); 
	
		
		
		
	}

}
