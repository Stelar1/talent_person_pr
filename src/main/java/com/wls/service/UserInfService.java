package com.wls.service;

import com.wls.entity.UserInf;
import com.wls.utils.ResultHelper;

public interface UserInfService {
	public int add(UserInf userInf);
	public UserInf selectById(String email);
	public int updateInf(UserInf userInf);
	// 分页查询符合条件的信息
	public ResultHelper getUserInfPager(UserInf userinf);

	public UserInf showUserinfo(String email);

}
