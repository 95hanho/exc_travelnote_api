package me._hanho.travelnote.model;

public class User {
	private String member_id;
	private String member_password;
	private int company_id;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String member_id, String member_password, int company_id) {
		super();
		this.member_id = member_id;
		this.member_password = member_password;
		this.company_id = company_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	@Override
	public String toString() {
		return "User [member_id=" + member_id + ", member_password=" + member_password + ", company_id=" + company_id
				+ "]";
	}
	
}
