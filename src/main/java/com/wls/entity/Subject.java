package com.wls.entity;

import com.wls.utils.PageHelper;

public class Subject extends PageHelper<Subject>{
	private Integer subjectID;//试题ID
	private String subjectTitle;//题目
	private String subjectOptionA;//选项A
	private String subjectOptionB;//选项B
	private String subjectOptionC;//选项C
	private String subjectOptionD;//选项D
	private String subjectAnswer;//答案
	private String subjectParse;//解释
	
	public Integer getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(Integer subjectID) {
		this.subjectID = subjectID;
	}
	public String getSubjectTitle() {
		return subjectTitle;
	}
	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}
	public String getSubjectOptionA() {
		return subjectOptionA;
	}
	public void setSubjectOptionA(String subjectOptionA) {
		this.subjectOptionA = subjectOptionA;
	}
	public String getSubjectOptionB() {
		return subjectOptionB;
	}
	public void setSubjectOptionB(String subjectOptionB) {
		this.subjectOptionB = subjectOptionB;
	}
	public String getSubjectOptionC() {
		return subjectOptionC;
	}
	public void setSubjectOptionC(String subjectOptionC) {
		this.subjectOptionC = subjectOptionC;
	}
	public String getSubjectOptionD() {
		return subjectOptionD;
	}
	public void setSubjectOptionD(String subjectOptionD) {
		this.subjectOptionD = subjectOptionD;
	}
	public String getSubjectAnswer() {
		return subjectAnswer;
	}
	public void setSubjectAnswer(String subjectAnswer) {
		this.subjectAnswer = subjectAnswer;
	}
	public String getSubjectParse() {
		return subjectParse;
	}
	public void setSubjectParse(String subjectParse) {
		this.subjectParse = subjectParse;
	}
	@Override
	public String toString() {
		return "Subject [subjectID=" + subjectID + ", subjectTitle="
				+ subjectTitle + ", subjectOptionA=" + subjectOptionA
				+ ", subjectOptionB=" + subjectOptionB + ", subjectOptionC="
				+ subjectOptionC + ", subjectOptionD=" + subjectOptionD
				+ ", subjectAnswer=" + subjectAnswer + ", subjectParse="
				+ subjectParse + "]";
	}
	public Subject(Integer subjectID, String subjectTitle,
			String subjectOptionA, String subjectOptionB,
			String subjectOptionC, String subjectOptionD, String subjectAnswer,
			String subjectParse) {
		super();
		this.subjectID = subjectID;
		this.subjectTitle = subjectTitle;
		this.subjectOptionA = subjectOptionA;
		this.subjectOptionB = subjectOptionB;
		this.subjectOptionC = subjectOptionC;
		this.subjectOptionD = subjectOptionD;
		this.subjectAnswer = subjectAnswer;
		this.subjectParse = subjectParse;
	}
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Subject(int pageIndex, int limit) {
		super(pageIndex, limit);
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	

}
