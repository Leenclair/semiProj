package com.melon.starpost.reply.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int no;
	private int spNo;
	private String userid;
	private String nickname;
	private String content;
	private Timestamp regdate;
	
	public ReplyVO() {
		super();
	}

	public ReplyVO(int no, int spNo, String userid, String nickname, String content, Timestamp regdate) {
		super();
		this.no = no;
		this.spNo = spNo;
		this.userid = userid;
		this.nickname = nickname;
		this.content = content;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSpNo() {
		return spNo;
	}

	public void setSpNo(int spNo) {
		this.spNo = spNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [no=" + no + ", spNo=" + spNo + ", userid=" + userid + ", nickname=" + nickname +
				", content=" + content + ", regdate=" + regdate + "]";
	}

	
	
}
