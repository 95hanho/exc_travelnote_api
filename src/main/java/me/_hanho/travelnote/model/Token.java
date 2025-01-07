package me._hanho.travelnote.model;

import java.util.Date;

public class Token {
	
	private int token_num;
	private String refresh_token;
	private String agent;
	private String connect_ip;
	private Date created_at;
	private String member_id;
	
	public Token() {
	}
	
	public Token(String refresh_token, String agent, String connect_ip) {
		super();
		this.refresh_token = refresh_token;
		this.agent = agent;
		this.connect_ip = connect_ip;
	}
	
	public Token(String refresh_token, String agent, String connect_ip, String member_id) {
		super();
		this.refresh_token = refresh_token;
		this.agent = agent;
		this.connect_ip = connect_ip;
		this.member_id = member_id;
	}



	public Token(int token_num, String refresh_token, String agent, String connect_ip, Date created_at,
			String member_id) {
		super();
		this.token_num = token_num;
		this.refresh_token = refresh_token;
		this.agent = agent;
		this.connect_ip = connect_ip;
		this.created_at = created_at;
		this.member_id = member_id;
	}

	public int getToken_num() {
		return token_num;
	}

	public void setToken_num(int token_num) {
		this.token_num = token_num;
	}

	public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getConnect_ip() {
		return connect_ip;
	}

	public void setConnect_ip(String connect_ip) {
		this.connect_ip = connect_ip;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "Token [token_num=" + token_num + ", refresh_token=" + refresh_token + ", agent=" + agent
				+ ", connect_ip=" + connect_ip + ", created_at=" + created_at + ", member_id=" + member_id + "]";
	}
}
