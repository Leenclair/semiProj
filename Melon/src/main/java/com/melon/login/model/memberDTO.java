package com.melon.login.model;

import java.sql.Timestamp;

public class memberDTO {
	private int no;
	private String userid;
	private String pwd;
	private String name;
	private String nickname;	
	private Timestamp regdate;
	private Timestamp outdate;
	
	public memberDTO() {
		super();
	}

	public memberDTO(int no, String userid, String pwd, String name, String nickname, Timestamp regdate,
			Timestamp outdate) {
		super();
		this.no = no;
		this.userid = userid;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.regdate = regdate;
		this.outdate = outdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getOutdate() {
		return outdate;
	}

	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}

	@Override
	public String toString() {
		return "memberDTO [no=" + no + ", userid=" + userid + ", pwd=" + pwd + ", name=" + name + ", nickname="
				+ nickname + ", regdate=" + regdate + ", outdate=" + outdate + "]";
	}
	
	

	 
}
