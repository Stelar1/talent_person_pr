package com.wls.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.wls.entity.Recruit;

/**
 * 
 * @author wang
 * 招聘信息数据访问层接口
 */

public interface RecruitDao {
	// 查询获取所有招聘信息
	public List<Recruit> getAllRecruit();
	
	//统计符合条件的信息数量
	public int getTotalRecruit(Recruit recruit);
	
	//分页查询符合条件的信息
	public List<Recruit> getRecruitPager(Recruit recruit);
	
	//发布招聘信息
	public void addRecruit(Recruit recruit);
	//编辑招聘信息
	public void editRecruit(Recruit recruit);
	//删除信息
	public void delRecruit(Integer[] rids);
	//根据编号获取详细信息
	public Recruit showRecruitById(Integer rid);
	
//	用户查询所有的分页
	
	public int getPageSize(Recruit recruit);
	public List<Recruit> userSelect(Recruit recruit);
	
	

}
