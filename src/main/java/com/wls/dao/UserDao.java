package com.wls.dao;

import java.util.List;

import com.wls.entity.User;

public interface UserDao {
	public int addUser(User user);
//	通过email查询user
	public User selectByEmail(String email);
//	查询密保
	public String selectSafe(String email);
//	修改密包
	public int updateSafe(User user);
	// 获取所有用户的信息
	public List<User> getUserPager(User user);

	// 统计符合条件的信息数量
	public int getTotalUser(User user);

	// 删除信息
	public void delUser(String[] emails);
	
//	修改密码
	public int updatePwd(User user);
}

