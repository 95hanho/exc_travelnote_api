package me._hanho.travelnote.model;

import java.sql.Date;

public class Schedule {

	private int s_id;
	private String html_raw;
	private Date sc_Date;
	private Date sc_date_build;
	private int company_id;
	
	public Schedule() {
		// TODO Auto-generated constructor stub
	}

	public Schedule(int s_id, String html_raw, Date sc_Date, int company_id) {
		super();
		this.s_id = s_id;
		this.html_raw = html_raw;
		this.sc_Date = sc_Date;
		this.company_id = company_id;
	}
	

	public Date getSc_date_build() {
		return sc_date_build;
	}

	public void setSc_date_build(Date sc_date_build) {
		this.sc_date_build = sc_date_build;
	}

	public Schedule(int s_id, String html_raw, Date sc_Date, Date sc_date_build, int company_id) {
		super();
		this.s_id = s_id;
		this.html_raw = html_raw;
		this.sc_Date = sc_Date;
		this.sc_date_build = sc_date_build;
		this.company_id = company_id;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public String getHtml_raw() {
		return html_raw;
	}

	public void setHtml_raw(String html_raw) {
		this.html_raw = html_raw;
	}

	public Date getSc_Date() {
		return sc_Date;
	}

	public void setSc_Date(Date sc_Date) {
		this.sc_Date = sc_Date;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	@Override
	public String toString() {
		return "Schedule [s_id=" + s_id + ", html_raw=" + html_raw + ", sc_Date=" + sc_Date + ", sc_date_build="
				+ sc_date_build + ", company_id=" + company_id + "]";
	}
}
