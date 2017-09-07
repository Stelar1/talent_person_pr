package com.wls.entity;

import java.sql.Date;

import com.wls.utils.PageHelper;

/**
 * 用户的信息实体
 * 
 * @author long
 *
 */
public class UserInf extends PageHelper<UserInf>{
	private String email;
	private String uworkPlace;
	private String ujob;
	private String uname;
	private String usex;
	private String ubirth;
	private String uhomePlace;
	private String uedu;
	private String uimag;
	private String uphone;
	public final String getEmail() {
		return email;
	}
	public final void setEmail(String email) {
		this.email = email;
	}
	public final String getUworkPlace() {
		return uworkPlace;
	}
	public final void setUworkPlace(String uworkPlace) {
		this.uworkPlace = uworkPlace;
	}
	public final String getUjob() {
		return ujob;
	}
	public final void setUjob(String ujob) {
		this.ujob = ujob;
	}
	public final String getUname() {
		return uname;
	}
	public final void setUname(String uname) {
		this.uname = uname;
	}
	public final String getUsex() {
		return usex;
	}
	public final void setUsex(String usex) {
		this.usex = usex;
	}
	public final String getUbirth() {
		return ubirth;
	}
	public final void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
	public final String getUhomePlace() {
		return uhomePlace;
	}
	public final void setUhomePlace(String uhomePlace) {
		this.uhomePlace = uhomePlace;
	}
	public final String getUedu() {
		return uedu;
	}
	public final void setUedu(String uedu) {
		this.uedu = uedu;
	}
	public final String getUimag() {
		return uimag;
	}
	public final void setUimag(String uimag) {
		this.uimag = uimag;
	}
	public final String getUphone() {
		return uphone;
	}
	public final void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public UserInf(String email, String uworkPlace, String ujob, String uname, String usex, String ubirth, String uhomePlace, String uedu, String uimag, String uphone) {
		super();
		this.email = email;
		this.uworkPlace = uworkPlace;
		this.ujob = ujob;
		this.uname = uname;
		this.usex = usex;
		this.ubirth = ubirth;
		this.uhomePlace = uhomePlace;
		this.uedu = uedu;
		this.uimag = uimag;
		this.uphone = uphone;
	}
	public UserInf() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UserInf [email=" + email + ", uworkPlace=" + uworkPlace + ", ujob=" + ujob + ", uname=" + uname + ", usex=" + usex + ", ubirth=" + ubirth + ", uhomePlace=" + uhomePlace + ", uedu=" + uedu + ", uimag=" + uimag + ", uphone=" + uphone + "]";
	}
	
	
}
