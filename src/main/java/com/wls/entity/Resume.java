package com.wls.entity;

/**
 * 简历实体
 * 
 * @author long
 *
 */
public class Resume {
	private int ur_id;
	private String email;
	//简历的类型：
	//0表示用页面生成的简历
	//1表示用户上传的简历
	private int ur_type;
	//简历存放的位置
	private String ur_url;
	private int ur_comment;
	
	private String ur_content;
	
	public Resume(String email, String ur_content) {
		super();
		this.email = email;
		this.ur_content = ur_content;
	}
	
	
	public final String getUr_content() {
		return ur_content;
	}
	public final void setUr_content(String ur_content) {
		this.ur_content = ur_content;
	}
	public final String getEmail() {
		return email;
	}
	public final void setEmail(String email) {
		this.email = email;
	}
	public final int getUr_type() {
		return ur_type;
	}
	public final void setUr_type(int ur_type) {
		this.ur_type = ur_type;
	}
	public final String getUr_url() {
		return ur_url;
	}
	public final void setUr_url(String ur_url) {
		this.ur_url = ur_url;
	}
	public final int getUr_comment() {
		return ur_comment;
	}
	public final void setUr_comment(int ur_comment) {
		this.ur_comment = ur_comment;
	}
	public final int getUr_id() {
		return ur_id;
	}
	public final void setUr_id(int ur_id) {
		this.ur_id = ur_id;
	}
	public Resume() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Resume(String email, int ur_type, String ur_url) {
		super();
		this.email = email;
		this.ur_type = ur_type;
		this.ur_url = ur_url;
	}
	public Resume(String email, int ur_type, String ur_url, int ur_comment) {
		super();
		this.email = email;
		this.ur_type = ur_type;
		this.ur_url = ur_url;
		this.ur_comment = ur_comment;
	}
	@Override
	public String toString() {
		return "Resume [ur_id=" + ur_id + ", email=" + email + ", ur_type=" + ur_type + ", ur_url=" + ur_url + ", ur_comment=" + ur_comment + "]";
	}
	
}
