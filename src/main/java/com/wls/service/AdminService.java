package com.wls.service;

import com.wls.entity.Admin;
import com.wls.utils.ResultHelper;
public interface AdminService {

	// 分页查询符合条件的信息
	public ResultHelper getAdminPager(Admin admin);

	// 删除信息
	public ResultHelper delAdmin(String[] a_ids);
	
	public Admin selectById(String name);

}
