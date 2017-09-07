package com.wls.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.UserInfDao;
import com.wls.entity.UserInf;
import com.wls.service.UserInfService;
import com.wls.utils.Constant;
import com.wls.utils.ResultHelper;
@Service
public class UserInfServiceImp implements UserInfService {

	@Resource
	UserInfDao dao;
	
	@Override
	public int add(UserInf userInf) {
		return dao.add(userInf);
	}
	@Override
	public UserInf selectById(String email) {
		return dao.selectById(email);
	}
	@Override
	public int updateInf(UserInf userInf) {
		return dao.updateinf(userInf);
	}
	
	//分页查询符合条件的信息
		@Override
		public ResultHelper getUserInfPager(UserInf userinf) {
			return new ResultHelper(dao.getUserInfPager(userinf),dao.getTotalUserInf(userinf),
					Constant.SUCCESS_CODE,Constant.SUCCESS_MSG);
			
		}
		@Override
		public UserInf showUserinfo(String email) {
		
			return dao.showUserinfo(email);
		}

}
