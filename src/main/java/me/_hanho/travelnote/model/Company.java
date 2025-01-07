package me._hanho.travelnote.model;

public class Company {

	private int company_id;
	private String company_url;
	private String custom_id_placeholder;
	private String custom_pw_placeholder;
	private String custom_top_title_plain;
	private String custom_top_title_bold;
	private String list_title;
	private int limit_value;
	private String reflection_title;
	
	public Company() {
	}

	public Company(String company_url, String custom_id_placeholder, String custom_pw_placeholder,
			String custom_top_title_plain, String custom_top_title_bold, String list_title, int limit_value,
			String reflection_title) {
		super();
		this.company_url = company_url;
		this.custom_id_placeholder = custom_id_placeholder;
		this.custom_pw_placeholder = custom_pw_placeholder;
		this.custom_top_title_plain = custom_top_title_plain;
		this.custom_top_title_bold = custom_top_title_bold;
		this.list_title = list_title;
		this.limit_value = limit_value;
		this.reflection_title = reflection_title;
	}
	
	public Company(int company_id, String company_url, String custom_id_placeholder, String custom_pw_placeholder,
			String custom_top_title_plain, String custom_top_title_bold, String list_title, int limit_value,
			String reflection_title) {
		super();
		this.company_id = company_id;
		this.company_url = company_url;
		this.custom_id_placeholder = custom_id_placeholder;
		this.custom_pw_placeholder = custom_pw_placeholder;
		this.custom_top_title_plain = custom_top_title_plain;
		this.custom_top_title_bold = custom_top_title_bold;
		this.list_title = list_title;
		this.limit_value = limit_value;
		this.reflection_title = reflection_title;
	}
	
	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getCompany_url() {
		return company_url;
	}

	public void setCompany_url(String company_url) {
		this.company_url = company_url;
	}

	public String getCustom_id_placeholder() {
		return custom_id_placeholder;
	}

	public void setCustom_id_placeholder(String custom_id_placeholder) {
		this.custom_id_placeholder = custom_id_placeholder;
	}

	public String getCustom_pw_placeholder() {
		return custom_pw_placeholder;
	}

	public void setCustom_pw_placeholder(String custom_pw_placeholder) {
		this.custom_pw_placeholder = custom_pw_placeholder;
	}

	public String getCustom_top_title_plain() {
		return custom_top_title_plain;
	}

	public void setCustom_top_title_plain(String custom_top_title_plain) {
		this.custom_top_title_plain = custom_top_title_plain;
	}

	public String getCustom_top_title_bold() {
		return custom_top_title_bold;
	}

	public void setCustom_top_title_bold(String custom_top_title_bold) {
		this.custom_top_title_bold = custom_top_title_bold;
	}

	public String getList_title() {
		return list_title;
	}

	public void setList_title(String list_title) {
		this.list_title = list_title;
	}

	public int getLimit_value() {
		return limit_value;
	}

	public void setLimit_value(int limit_value) {
		this.limit_value = limit_value;
	}

	public String getReflection_title() {
		return reflection_title;
	}

	public void setReflection_title(String reflection_title) {
		this.reflection_title = reflection_title;
	}

	@Override
	public String toString() {
		return "Company [company_id=" + company_id + ", company_url=" + company_url + ", custom_id_placeholder="
				+ custom_id_placeholder + ", custom_pw_placeholder=" + custom_pw_placeholder
				+ ", custom_top_title_plain=" + custom_top_title_plain + ", custom_top_title_bold="
				+ custom_top_title_bold + ", list_title=" + list_title + ", limit_value=" + limit_value
				+ ", reflection_title=" + reflection_title + "]";
	}

}
