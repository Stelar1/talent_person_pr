



package com.wls.entity;

import com.wls.utils.PageHelper;

/**
 * 招聘信息实体类
 * @author Wang
 *
 */
public class Recruit extends PageHelper<Recruit>{
	private Integer rid;//招聘信息id
	private String email;//发布者email
	private Integer cid;//公司id
	private String rtitle;//招聘标题
	private String rexper;//经验
	private String redu;//教育程度
	private String rjob;//职位名
	private String rsalary;//薪水
	private Integer rtype;//工作类型
	private String rplace;//工作地点
	private Integer rnum;//招聘人数
	private String rdesc;//职位描述
	private Integer rcomment;//评论
	//管理查询使用
	private Company company;
	
	public Recruit(int pageIndex, String rexper, String redu, String rjob, Integer rtype, String rplace) {
		super(pageIndex,10);
		this.rexper = rexper;
		this.redu = redu;
		this.rjob = rjob;
		this.rtype = rtype;
		this.rplace = rplace;
	}
	public final Company getCompany() {
		return company;
	}
	public final void setCompany(Company company) {
		this.company = company;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRexper() {
		return rexper;
	}
	public void setRexper(String rexper) {
		this.rexper = rexper;
	}
	public String getRedu() {
		return redu;
	}
	public void setRedu(String redu) {
		this.redu = redu;
	}
	public String getRjob() {
		return rjob;
	}
	public void setRjob(String rjob) {
		this.rjob = rjob;
	}
	public String getRsalary() {
		return rsalary;
	}
	public void setRsalary(String rsalary) {
		this.rsalary = rsalary;
	}
	public Integer getRtype() {
		return rtype;
	}
	public void setRtype(Integer rtype) {
		this.rtype = rtype;
	}
	public String getRplace() {
		return rplace;
	}
	public void setRplace(String rplace) {
		this.rplace = rplace;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public String getRdesc() {
		return rdesc;
	}
	public void setRdesc(String rdesc) {
		this.rdesc = rdesc;
	}
	public Integer getRcomment() {
		return rcomment;
	}
	public void setRcomment(Integer rcomment) {
		this.rcomment = rcomment;
	}
	public Recruit(Integer rid, String email, Integer cid, String rtitle,
			String rexper, String redu, String rjob, String rsalary, Integer rtype,
			String rplace, Integer rnum, String rdesc, Integer rcomment) {
		super();
		this.rid = rid;
		this.email = email;
		this.cid = cid;
		this.rtitle = rtitle;
		this.rexper = rexper;
		this.redu = redu;
		this.rjob = rjob;
		this.rsalary = rsalary;
		this.rtype = rtype;
		this.rplace = rplace;
		this.rnum = rnum;
		this.rdesc = rdesc;
		this.rcomment = rcomment;
	}
	public Recruit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Recruit(Integer pageIndex, Integer limit) {
		super(pageIndex, limit);
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Recruit [rid=" + rid + ", email=" + email + ", cid=" + cid
				+ ", rtitle=" + rtitle + ", rexper=" + rexper + ", redu="
				+ redu + ", rjob=" + rjob + ", rsalary=" + rsalary + ", rtype="
				+ rtype + ", rplace=" + rplace + ", rnum=" + rnum + ", rdesc="
				+ rdesc + ", rcomment=" + rcomment + "]";
	}
	public Recruit(Integer rid, String rtitle, String rexper, String redu,
			String rjob, String rsalary, Integer rtype, String rplace, Integer rnum,
			String rdesc) {
		super();
		this.rid = rid;
		this.rtitle = rtitle;
		this.rexper = rexper;
		this.redu = redu;
		this.rjob = rjob;
		this.rsalary = rsalary;
		this.rtype = rtype;
		this.rplace = rplace;
		this.rnum = rnum;
		this.rdesc = rdesc;
	}
	public Recruit(String email, Integer cid, String rtitle, String rexper,
			String redu, String rjob, String rsalary, Integer rtype, String rplace,
			Integer rnum, String rdesc) {
		super();
		this.email = email;
		this.cid = cid;
		this.rtitle = rtitle;
		this.rexper = rexper;
		this.redu = redu;
		this.rjob = rjob;
		this.rsalary = rsalary;
		this.rtype = rtype;
		this.rplace = rplace;
		this.rnum = rnum;
		this.rdesc = rdesc;
	}

	
	
	

}
