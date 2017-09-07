package com.wls.service;

import com.wls.entity.ComResume;
import com.wls.entity.Resume;
import com.wls.utils.ResultHelper;

public interface ComResumeService {
	public int addComResume(ComResume resume);
	public ComResume selectResume(Resume resume);

	// 分页查询符合条件的信息
	public ResultHelper getComResumePager(ComResume comresume);
	//删除简历
	public ResultHelper delComResume(Integer[] cr_ids);
}
