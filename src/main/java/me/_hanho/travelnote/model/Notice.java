package me._hanho.travelnote.model;

import java.util.Date;

public class Notice {

	private int id;
	private String title;
	private Date date;
	private int this_page;
	private String content;
	private int company_id;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int id, String title, Date date, String content, int company_id) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.content = content;
		this.company_id = company_id;
	}
	
	public Notice(int id, String title, Date date, int this_page, String content, int company_id) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.this_page = this_page;
		this.content = content;
		this.company_id = company_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public int getThis_page() {
		return this_page;
	}

	public void setThis_page(int this_page) {
		this.this_page = this_page;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", date=" + date + ", this_page=" + this_page + ", content="
				+ content + ", company_id=" + company_id + "]";
	}
}
