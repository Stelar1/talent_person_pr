package com.wls.dao;

import java.util.List;

import com.wls.entity.Recruit;
import com.wls.entity.Subject;
import com.wls.utils.ResultHelper;

public interface SubjectDao {
	//获取所有的考题信息
    public List<Subject> getAllSubject();
	//添加试题
	public void addSubject(Subject subject);
	//编辑考题
	public void editSubject(Subject subject);
	//删除考题
	public void delSubject(Integer[] subjectIDs);
	//根据编号获取信息
	public Subject showSubjectById(Integer subjectID);
	
	public List<Subject> getSubjectPager(Subject subject);
	
	//统计符合条件的信息数量
	public int getTotalSubject(Subject subject);
	
	public List<Subject> randomFindSubject(int number);

}
