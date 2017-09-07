package com.wls.dao;

import java.util.List;

import com.wls.entity.ComResume;
import com.wls.entity.Resume;

public interface ComResumeDao {
	public int addComResume(ComResume resume);
	public ComResume selectResume(Resume resume);
	// 统计符合条件的数量
	public int getTotalComResume(ComResume comresume);
	// 分页查询符合条件的信息
	public List<ComResume> getComResumePager(ComResume comresume);
	//删除简历
	public void delComResume(Integer[] cr_ids);
}
