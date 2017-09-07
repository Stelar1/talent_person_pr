package com.wls.service;

import com.wls.entity.User;
import com.wls.utils.ResultHelper;

public interface UserService {
	public int addUser(User user);
	public User selectByEmail(String email);
	public String selectSafe(String email);
	public int updateSafe(User user);
	// 获取所有发布的招聘信息
	public ResultHelper getUserPager(User user);

	// 删除信息
	public ResultHelper delUser(String[] emails);
	
//	修改密码
	public int updatePwd(User user);
}
