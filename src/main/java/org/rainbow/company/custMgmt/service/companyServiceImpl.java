package org.rainbow.company.custMgmt.service;


import java.util.List;
import java.util.Map;

import org.rainbow.company.custMgmt.domain.companyDownVO;
import org.rainbow.company.custMgmt.domain.companyInputVO;
import org.rainbow.company.custMgmt.domain.companySearchDTO;
import org.rainbow.company.custMgmt.domain.companyVO;
import org.rainbow.company.custMgmt.domain.consultVO;
import org.rainbow.company.custMgmt.mapper.companyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class companyServiceImpl implements companyService{
	
	@Override
	public List<companyVO> giveKeyword(String keyword) {
		
		return companyMapper.giveKeyword(keyword);
	}
	
	@Autowired
	private companyMapper companyMapper;
	
	
	@Override
	public List<companyVO> companyList() {
		
		return companyMapper.companyList();
	}
	
	@Override
	public int companyRegister(companyVO vo) {
		
		log.info("companyRegister...  vo: " + vo);
		
		return companyMapper.companyRegister(vo);
	}
	
	@Override
	public companyVO companyView(int companyNo) {
		
		return companyMapper.companyView(companyNo);
	}
	
	
	@Override
	public List<companyVO> checkBizNum(List<String> bizNumArray) {
		
		return companyMapper.checkBizNum(bizNumArray);
	}
	
	@Override
	public int insertCompanyExcel(companyInputVO vo) {
		
		return companyMapper.insertCompanyExcel(vo);
	}
	@Override
	public List<companyDownVO> downExcelList(Map<String, Object> filteredValue) {
		
		return companyMapper.downExcelList(filteredValue);
	}
	@Override
	public List<companyVO> getCompanyLicenseFileURL(String jsonData) {
	
		log.info("getCompanyLicenseFileURL...." );
		return companyMapper.getCompanyLicenseFileURL(jsonData);
	}
	@Override
	public int updateCompany(companyVO vo) {
		log.info("updateCompany...." + vo);
		
		int list = companyMapper.updateCompany(vo);
		log.info(list);
		return list;
	}

}
