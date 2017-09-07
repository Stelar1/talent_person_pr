package com.wls.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.SubjectDao;
import com.wls.entity.Recruit;
import com.wls.entity.Subject;
import com.wls.service.SubjectService;
import com.wls.utils.Constant;
import com.wls.utils.ResultHelper;

@Service
public class SubjectServiceImpl implements SubjectService{
	@Resource
     private SubjectDao subjectDao;
	@Override
	public ResultHelper getAllSubject() {
		List<Subject> subjectList = subjectDao.getAllSubject();
		return new ResultHelper(subjectList,subjectList.size(),
				                Constant.SUCCESS_CODE,Constant.SUCCESS_MSG);
	}

	@Override
	public ResultHelper addSubject(Subject subject) {
		subjectDao.addSubject(subject);
		return new ResultHelper(Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}

	@Override
	public ResultHelper editSubject(Subject subject) {
		subjectDao.editSubject(subject);
		return new ResultHelper(Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}

	@Override
	public ResultHelper delSubject(Integer[] subjectIDs) {
		subjectDao.delSubject(subjectIDs);
		return new ResultHelper(Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}

	@Override
	public Subject showSubjectById(Integer subjectID) {
		// TODO Auto-generated method stub
		return subjectDao.showSubjectById(subjectID);
	}
	//分页查询符合条件的信息
	@Override
	public ResultHelper getSubjectPager(Subject subject) {
	     return new ResultHelper(subjectDao.getSubjectPager(subject),subjectDao.getTotalSubject(subject),
						Constant.SUCCESS_CODE,Constant.SUCCESS_MSG);
		}
			
			
	public List<Subject> randomFindSubject(int number) {
		return subjectDao.randomFindSubject(number);
			}

}
