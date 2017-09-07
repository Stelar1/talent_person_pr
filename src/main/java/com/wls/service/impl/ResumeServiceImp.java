package com.wls.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.ResumeDao;
import com.wls.entity.Resume;
import com.wls.service.ResumeService;

@Service
public class ResumeServiceImp implements ResumeService {
	@Resource
	ResumeDao dao;
	
	@Override
	public int addResume(Resume resume) {
		return dao.addResume(resume);
	}

	@Override
	public int updateResume(Resume resume) {
		return dao.updateResume(resume);
	}

	@Override
	public Resume findResume(String email) {
		return dao.findResume(email);
	}

	@Override
	public String findJsonResume(String email) {
		return dao.findJsonResume(email);
	}

}
