package com.wls.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wls.dao.RecruitDao;
import com.wls.entity.Recruit;
import com.wls.service.RecruitService;
import com.wls.utils.Constant;
import com.wls.utils.ResultHelper;

/**
 * 
 * @author wang
 * 
 */
@Service
public class RecruitServiceImpl implements RecruitService {
	@Resource
	private RecruitDao recruitDao;


	// 获取所有发布的招聘信息
	@Override
	public ResultHelper getAllRecruit() {
		List<Recruit> recruitList = recruitDao.getAllRecruit();
		//System.out.println(recruitList);
		return new ResultHelper(recruitList, recruitList.size(),
				Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
		

	}
	
	//添加信息
	@Override
	public ResultHelper addRecruit(Recruit recruit) {
		
		recruitDao.addRecruit(recruit);
		
		return new ResultHelper(Constant.SUCCESS_CODE,Constant.SUCCESS_MSG);
		
		
	}
	//编辑选中的信息
	@Override
	public ResultHelper editRecruit(Recruit recruit) {
		recruitDao.editRecruit(recruit);
		return new ResultHelper(Constant.SUCCESS_CODE,Constant.SUCCESS_MSG);
		
		
	}
	//删除信息
	@Override
	public ResultHelper delRecruit(Integer[] rids) {
		recruitDao.delRecruit(rids);
		return new ResultHelper(Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}
	//根据编号查询详情
	public Recruit showRecruitById(Integer rid) {
		return recruitDao.showRecruitById(rid);
	}
	
	//分页查询符合条件的信息
		@Override
		public ResultHelper getRecruitPager(Recruit recruit) {
			return new ResultHelper(recruitDao.getRecruitPager(recruit),recruitDao.getTotalRecruit(recruit),
					Constant.SUCCESS_CODE,Constant.SUCCESS_MSG);
			}
	
	//所有招聘信息的分页查询符合条件的信息
	@Override
	public ResultHelper userSelect(Recruit recruit) {
		return new ResultHelper(recruitDao.userSelect(recruit),recruitDao.getPageSize(recruit),
				Constant.SUCCESS_CODE,Constant.SUCCESS_MSG);
	}
}
