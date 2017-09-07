package com.wls.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.ComResumeDao;
import com.wls.entity.ComResume;
import com.wls.entity.Resume;
import com.wls.service.ComResumeService;
import com.wls.utils.Constant;
import com.wls.utils.ResultHelper;
@Service
public class ComResumeServiceImp implements ComResumeService {
	@Resource
	ComResumeDao dao;
	
	@Override
	public int addComResume(ComResume resume) {
		return dao.addComResume(resume);
	}

	@Override
	public ComResume selectResume(Resume resume) {
		return dao.selectResume(resume);
	}
	
	@Override
	public ResultHelper getComResumePager(ComResume comresume) {
		return new ResultHelper(dao.getComResumePager(comresume),
				dao.getTotalComResume(comresume), Constant.SUCCESS_CODE,
				Constant.SUCCESS_MSG);
	}

	// 删除信息
	@Override
	public ResultHelper delComResume(Integer[] cr_ids) {
		dao.delComResume(cr_ids);
		return new ResultHelper(Constant.SUCCESS_CODE, Constant.SUCCESS_MSG);
	}

}
