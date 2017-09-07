package com.wls.service;

import com.wls.entity.Resume;

public interface ResumeService {
	public int addResume(Resume resume);
	public int updateResume(Resume resume);
	public Resume findResume(String email);
	public String findJsonResume(String email);
}
