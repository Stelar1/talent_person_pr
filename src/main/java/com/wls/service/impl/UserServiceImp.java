package com.wls.service.impl;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.UserDao;
import com.wls.entity.Admin;
import com.wls.entity.User;
import com.wls.service.UserService;
import com.wls.utils.Constant;
import com.wls.utils.ResultHelper;
@Service
public class UserServiceImp implements UserService {
	@Resource
	UserDao dao;

	@Override
	public int addUser(User user) {
		return dao.addUser(user);
	}

	@Override
	public User selectByEmail(String email) {
		return dao.selectByEmail(email);
	}

	@Override
	public String selectSafe(String email) {
		return dao.selectSafe(email);
	}

	@Override
	public int updateSafe(User user) {
		return dao.updateSafe(user);
	}

	public ResultHelper getUserPager(User user) {
		return new ResultHelper(dao.getUserPager(user),dao.getTotalUser(user),
				Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}


	//删除信息
	public ResultHelper delUser(String[] emails) {
		dao.delUser (emails);
		return new ResultHelper(Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}

	@Override
	public int updatePwd(User user) {
		return dao.updatePwd(user);
	}



}
