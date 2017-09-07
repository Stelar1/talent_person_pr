package com.wls.service;

import java.util.List;

import com.wls.entity.Recruit;
import com.wls.entity.Subject;
import com.wls.utils.ResultHelper;

public interface SubjectService {
	//获取所有的考题信息
	public ResultHelper getAllSubject();
	
	//添加试题
	public ResultHelper addSubject(Subject subject);
	//编辑考题
	public ResultHelper editSubject(Subject subject);
	//删除考题
	public ResultHelper delSubject(Integer[] subjectIDs);
	//根据编号获取信息
	public Subject showSubjectById(Integer subjectID);
	//分页
	public ResultHelper getSubjectPager(Subject subject);
	
	public List<Subject> randomFindSubject(int number);

}
