package org.rainbow.company.custMgmt.service;

import java.util.List;

import org.rainbow.company.custMgmt.domain.spotListVO;
import org.rainbow.company.custMgmt.domain.spotVO;
import org.rainbow.company.custMgmt.domain.userVO;
import org.rainbow.company.custMgmt.mapper.spotMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class spotServiceImpl implements spotService{
	
	@Autowired
	private spotMapper spotMapper;
	
	@Override
	public List<spotVO> spotList() {
		
		return spotMapper.spotList();
	}
	@Override
	public List<spotListVO> giveKeyword(String keyword) {
		
		return spotMapper.giveKeyword(keyword);
	}
	@Override
	public spotVO spotView(int spotNo) {
		
		return spotMapper.spotView(spotNo);
	}
	
	@Override
	public userVO getUserVO(int spotNo) {
		
		return spotMapper.getUserVO(spotNo);
	}
	
	@Transactional
	@Override
	public void spotRegisterInsert(spotVO vo,userVO userVO) {
		
		// 1. RAIN_consult_tbl 테이블에 항목 내용 업데이트
		spotMapper.spotRegisterInsert(vo);
		
		
		//2. 1번에서 등록된 게시글의 번호 가져오기
	      int spotNo = spotMapper.getSpotNo();
	      log.info("spotNo " + spotNo);
		
	   
		    // 3. 새로운 테이블에 삽입
	      spotMapper.userRegisterInsert(userVO, spotNo);
		
		
	}

}
