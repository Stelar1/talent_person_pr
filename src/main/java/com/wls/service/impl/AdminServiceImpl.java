package com.wls.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.AdminDao;
import com.wls.entity.Admin;
import com.wls.service.AdminService;
import com.wls.utils.Constant;
import com.wls.utils.ResultHelper;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	AdminDao dao;

	@Override
	public ResultHelper getAdminPager(Admin admin) {
		return new ResultHelper(dao.getAdminPager(admin),
				dao.getTotalAdmin(admin), Constant.SUCCESS_CODE,
				Constant.SUCCESS_MSG);
		
	}
	
	@Override
	public ResultHelper delAdmin(String[] a_ids) {
		dao.delAdmin(a_ids);
		return new ResultHelper(Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}

	@Override
	public Admin selectById(String name) {
		return dao.selectById(name);
	}
	
	
	
}
