package com.wls.dao;

import java.util.List;

import com.wls.entity.UserInf;

public interface UserInfDao {
	public int add(UserInf userInf);
	public UserInf selectById(String email);
	public int updateinf(UserInf userInf);

	// 统计符合条件的信息数量
	public int getTotalUserInf(UserInf userinf);

	// 分页查询符合条件的信息
	public List<UserInf> getUserInfPager(UserInf userinf);

	//根据Email查询详细信息
	public UserInf showUserinfo(String email);
}