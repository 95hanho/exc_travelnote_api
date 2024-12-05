package me._hanho.travelnote.model;

public class Menu {

	private String name;
	private String code;
	private int company_id;
	
	public Menu() {
		// TODO Auto-generated constructor stub
	}

	public Menu(String name, String code, int company_id) {
		super();
		this.name = name;
		this.code = code;
		this.company_id = company_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	@Override
	public String toString() {
		return "Menu [name=" + name + ", code=" + code + ", company_id=" + company_id + "]";
	}
	
}
