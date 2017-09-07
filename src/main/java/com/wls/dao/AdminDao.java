package com.wls.dao;

import java.util.List;

import com.wls.entity.Admin;

public interface AdminDao {

	// 分页查询符合条件的信息
	public List<Admin> getAdminPager(Admin admin);

	// 统计符合条件的信息数量
	public int getTotalAdmin(Admin admin);

	// 删除信息
	public void delAdmin(String[] a_ids);
	
   //	管理员查找
	public Admin selectById(String name);

}
