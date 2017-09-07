package com.wls.entity;

import com.wls.utils.PageHelper;

/** 
 * 公司收到的简历实体类
 * 
 * @author long
 */
public class ComResume extends PageHelper<ComResume>{
	//公司到的简历id
	private Integer cr_id;
	private String sendEm;
	private Integer ur_id;
	private String sendName;
	private long time;
	private Integer c_id;
	private String toEm;
	private Integer r_id;
	public final Integer getCr_id() {
		return cr_id;
	}
	public final void setCr_id(Integer cr_id) {
		this.cr_id = cr_id;
	}
	public final String getSendEm() {
		return sendEm;
	}
	public final void setSendEm(String sendEm) {
		this.sendEm = sendEm;
	}
	public final Integer getUr_id() {
		return ur_id;
	}
	public final void setUr_id(Integer ur_id) {
		this.ur_id = ur_id;
	}
	public final String getSendName() {
		return sendName;
	}
	public final void setSendName(String sendName) {
		this.sendName = sendName;
	}
	public final long getTime() {
		return time;
	}
	public final void setTime(long time) {
		this.time = time;
	}
	public final Integer getC_id() {
		return c_id;
	}
	public final void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public final String getToEm() {
		return toEm;
	}
	public final void setToEm(String toEm) {
		this.toEm = toEm;
	}
	public final Integer getR_id() {
		return r_id;
	}
	public final void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public ComResume(String sendEm, Integer ur_id, String sendName, long time, Integer c_id, String toEm, Integer r_id) {
		super();
		this.sendEm = sendEm;
		this.ur_id = ur_id;
		this.sendName = sendName;
		this.time = time;
		this.c_id = c_id;
		this.toEm = toEm;
		this.r_id = r_id;
	}
	public ComResume() {
		super();
	}
	@Override
	public String toString() {
		return "ComResume [cr_id=" + cr_id + ", sendEm=" + sendEm + ", ur_id=" + ur_id + ", sendName=" + sendName + ", time=" + time + ", c_id=" + c_id + ", toEm=" + toEm + ", r_id=" + r_id + "]";
	}
	
}
