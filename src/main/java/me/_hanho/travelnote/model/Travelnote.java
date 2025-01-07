package me._hanho.travelnote.model;

import java.sql.Date;

public class Travelnote {

	private int lecture_idx;
	private String program_description;
	private String program_title;
	private int week;
	private int s_id;
	
	private Date sc_date;
	private int company_id;
	
	public Travelnote() {
		// TODO Auto-generated constructor stub
	}

	public Travelnote(int lecture_idx, String program_description, String program_title, int week, int s_id) {
		super();
		this.lecture_idx = lecture_idx;
		this.program_description = program_description;
		this.program_title = program_title;
		this.week = week;
		this.s_id = s_id;
	}
	
	public Travelnote(int lecture_idx, String program_description, String program_title, int week, int s_id,
			Date sc_date) {
		super();
		this.lecture_idx = lecture_idx;
		this.program_description = program_description;
		this.program_title = program_title;
		this.week = week;
		this.s_id = s_id;
		this.sc_date = sc_date;
	}
	
	public Travelnote(int lecture_idx, String program_description, String program_title, int week, int s_id,
			Date sc_date, int company_id) {
		super();
		this.lecture_idx = lecture_idx;
		this.program_description = program_description;
		this.program_title = program_title;
		this.week = week;
		this.s_id = s_id;
		this.sc_date = sc_date;
		this.company_id = company_id;
	}
	
	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public Date getSc_date() {
		return sc_date;
	}

	public void setSc_date(Date sc_date) {
		this.sc_date = sc_date;
	}

	public int getLecture_idx() {
		return lecture_idx;
	}

	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}

	public String getProgram_description() {
		return program_description;
	}

	public void setProgram_description(String program_description) {
		this.program_description = program_description;
	}

	public String getProgram_title() {
		return program_title;
	}

	public void setProgram_title(String program_title) {
		this.program_title = program_title;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	@Override
	public String toString() {
		return "Travelnote [lecture_idx=" + lecture_idx + ", program_description=" + program_description
				+ ", program_title=" + program_title + ", week=" + week + ", s_id=" + s_id + ", sc_date=" + sc_date
				+ ", company_id=" + company_id + "]";
	}

}
