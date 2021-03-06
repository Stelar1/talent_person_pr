package com.wls.entity;

import com.wls.utils.PageHelper;

/**
 * 管理员实体
 * @author long
 *
 */
public class Admin extends PageHelper<Admin>{
	private String a_id;
	private String a_password;
	private String a_sex;
	private String a_name;
	private String a_safe;
	public final String getA_id() {
		return a_id;
	}
	public final void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public final String getA_password() {
		return a_password;
	}
	public final void setA_password(String a_password) {
		this.a_password = a_password;
	}
	public final String getA_sex() {
		return a_sex;
	}
	public final void setA_sex(String a_sex) {
		this.a_sex = a_sex;
	}
	public final String getA_name() {
		return a_name;
	}
	public final void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public final String getA_safe() {
		return a_safe;
	}
	public final void setA_safe(String a_safe) {
		this.a_safe = a_safe;
	}
	public Admin(String a_id, String a_password, String a_sex, String a_name, String a_safe) {
		super();
		this.a_id = a_id;
		this.a_password = a_password;
		this.a_sex = a_sex;
		this.a_name = a_name;
		this.a_safe = a_safe;
	}
	public Admin(String a_id, String a_password, String a_sex, String a_name) {
		super();
		this.a_id = a_id;
		this.a_password = a_password;
		this.a_sex = a_sex;
		this.a_name = a_name;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Admin [a_id=" + a_id + ", a_password=" + a_password + ", a_sex=" + a_sex + ", a_name=" + a_name + ", a_safe=" + a_safe + "]";
	}
	
	

}
