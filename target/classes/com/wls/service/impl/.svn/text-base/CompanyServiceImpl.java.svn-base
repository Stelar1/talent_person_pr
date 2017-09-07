package com.wls.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.CompanyDao;
import com.wls.entity.Company;
import com.wls.service.CompanyService;
import com.wls.utils.Constant;
import com.wls.utils.ResultHelper;

/**
 * 
 * @author wang
 *
 */

@Service
public class CompanyServiceImpl implements CompanyService {
	@Resource
 CompanyDao companyDao;

	@Override
	public int addCompany(Company company) {
		return companyDao.addCompany(company);
	}

	@Override
	public int updateCompany(Company company) {
		
		return companyDao.updateCompany(company);
	}

	@Override
	public Company selectById(String email) {
		return companyDao.selectById(email);
	}
	
}
