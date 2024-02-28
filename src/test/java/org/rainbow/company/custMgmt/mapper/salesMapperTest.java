package org.rainbow.company.custMgmt.mapper;




import org.junit.Test;
import org.junit.runner.RunWith;
import org.rainbow.company.custMgmt.domain.salesVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class salesMapperTest {
	

	
	
	
	@Autowired
	private salesMapper salesMapper;
	
	/** 상담 요청 내용 가져오기*/
	@Test
	public void testGetSalesView() {
		int cnslNo=1111;
		salesVO vo = new salesVO();
		
		vo = salesMapper.getSalesView(cnslNo);
		
		log.info(vo);
	}
	

	
	

}
