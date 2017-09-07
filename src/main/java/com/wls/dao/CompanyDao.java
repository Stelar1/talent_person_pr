package com.wls.dao;

import com.wls.entity.Company;

/**
 * 
 * @author wang
 *公司信息的数据访问层接口
 */

public interface CompanyDao {
	//添加公司信息
	public int addCompany(Company company);
	//根据email查询公司资料是否已经填写了。
	public Company selectById(String email);
	//更新
	public int updateCompany(Company company);
	

}
