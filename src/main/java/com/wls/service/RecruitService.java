package com.wls.service;

import com.wls.entity.Recruit;
import com.wls.utils.ResultHelper;

/**
 * 
 * @author wang 招聘信息服务层接口
 * 
 */

public interface RecruitService {
	// 获取所有发布的招聘信息
	public ResultHelper getAllRecruit();

	// 分页查询符合条件的信息，一个公司内的查询
	public ResultHelper getRecruitPager(Recruit recruit);

	// 发布招聘信息
	public ResultHelper addRecruit(Recruit recruit);

	// 编辑招聘信息
	public ResultHelper editRecruit(Recruit recruit);

	// 删除信息
	public ResultHelper delRecruit(Integer[] rids);
	//根据编号获取详细信息
	public Recruit showRecruitById(Integer rid);
	
	//分页查询，不过这次是查询所有公司
	public ResultHelper userSelect(Recruit recruit);

}
