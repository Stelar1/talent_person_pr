package com.wls.entity;

import com.wls.utils.PageHelper;

/***
 * 用户类，所有
 * @author long
 *
 */
public class User extends PageHelper<User>{
	private String email;
	private String password;
	//用户权限
	//2表示普通用户
	//1表示企业用户
	private Integer access;
	//密保问题
	private String safe;
	public final String getEmail() {
		return email;
	}
	public final void setEmail(String email) {
		this.email = email;
	}
	public final String getPassword() {
		return password;
	}
	public final void setPassword(String password) {
		this.password = password;
	}
	public final Integer getAccess() {
		return access;
	}
	public final void setAccess(Integer access) {
		this.access = access;
	}
	public final String getSafe() {
		return safe;
	}
	public final void setSafe(String safe) {
		this.safe = safe;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String email, String password, Integer access) {
		super();
		this.email = email;
		this.password = password;
		this.access = access;
	}
	@Override
	public String toString() {
		return "User [email=" + email + ", password=" + password + ", access=" + access + ", safe=" + safe + "]";
	}
	
	//用来生成密保的构造函数
	public User(String email, String safe) {
		super();
		this.email = email;
		this.safe = safe;
	}
	
	
}
