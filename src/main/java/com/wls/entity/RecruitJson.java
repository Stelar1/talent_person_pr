package com.wls.entity;

import java.util.List;

public class RecruitJson {
	private int code;
	private String message;
	private int results;
	private List<Recruit> rows;
	public final int getCode() {
		return code;
	}
	public final void setCode(int code) {
		this.code = code;
	}
	public final String getMessage() {
		return message;
	}
	public final void setMessage(String message) {
		this.message = message;
	}
	public final int getResults() {
		return results;
	}
	public final void setResults(int results) {
		this.results = results;
	}
	public final List<Recruit> getRows() {
		return rows;
	}
	public final void setRows(List<Recruit> rows) {
		this.rows = rows;
	}
	
}
