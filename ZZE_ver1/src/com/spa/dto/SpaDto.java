package com.spa.dto;

public class SpaDto {

	private int no;
	private String spaname;
	private String id;
	private String content;
	private int star;
	private String regdate;

	public SpaDto() {
		super();
	}

	public SpaDto(int no, String spaname, String id, String content, int star, String regdate) {
		super();
		this.no = no;
		this.spaname = spaname;
		this.id = id;
		this.content = content;
		this.star = star;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSpaname() {
		return spaname;
	}

	public void setSpaname(String spaname) {
		this.spaname = spaname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "SpaDto [no=" + no + ", spaname=" + spaname + ", id=" + id + ", content=" + content + ", star=" + star
				+ ", regdate=" + regdate + "]";
	}



}
