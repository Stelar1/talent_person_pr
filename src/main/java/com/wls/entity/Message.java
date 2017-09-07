package com.wls.entity;
/**
 * 消息实体类
 * @author long
 *
 */
public class Message {
	private int m_id;
	private String m_fromEm;
	private String m_toEm;
	private int m_obid;
	private String m_obname;
	private long m_time;
	private int m_status;
	private String m_content;
	public final int getM_id() {
		return m_id;
	}
	public final void setM_id(int m_id) {
		this.m_id = m_id;
	}
	
	public final String getM_fromEm() {
		return m_fromEm;
	}
	public final void setM_fromEm(String m_fromEm) {
		this.m_fromEm = m_fromEm;
	}
	public final String getM_toEm() {
		return m_toEm;
	}
	public final void setM_toEm(String m_toEm) {
		this.m_toEm = m_toEm;
	}
	public final int getM_obid() {
		return m_obid;
	}
	public final void setM_obid(int m_obid) {
		this.m_obid = m_obid;
	}
	public final String getM_obname() {
		return m_obname;
	}
	public final void setM_obname(String m_obname) {
		this.m_obname = m_obname;
	}
	public final long getM_time() {
		return m_time;
	}
	public final void setM_time(long m_time) {
		this.m_time = m_time;
	}
	public final int getM_status() {
		return m_status;
	}
	public final void setM_status(int m_status) {
		this.m_status = m_status;
	}
	public final String getM_content() {
		return m_content;
	}
	public final void setM_content(String m_content) {
		this.m_content = m_content;
	}
	
	public Message(String m_fromEm, String m_toEm, int m_obid, String m_obname, long m_time, int m_status, String m_content) {
		super();
		this.m_fromEm = m_fromEm;
		this.m_toEm = m_toEm;
		this.m_obid = m_obid;
		this.m_obname = m_obname;
		this.m_time = m_time;
		this.m_status = m_status;
		this.m_content = m_content;
	}
	
	public Message(String m_fromEm, String m_toEm, int m_obid) {
		super();
		this.m_fromEm = m_fromEm;
		this.m_toEm = m_toEm;
		this.m_obid = m_obid;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Massage [m_id=" + m_id + ", m_formEm=" + m_fromEm + ", m_toEm=" + m_toEm + ", m_obid=" + m_obid + ", m_obname=" + m_obname + ", m_time=" + m_time + ", m_status=" + m_status + ", m_content=" + m_content + "]";
	}
	
	
}
