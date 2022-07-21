package com.melon.reply.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int no;
	private String userid;
	private String contents;
	private Timestamp regdate;
	private int up;
	private int down;
	private int albumNo;
	public ReplyVO() {
		super();
	}
	public ReplyVO(int no, String userid, String contents, Timestamp regdate, int up, int down, int albumNo) {
		super();
		this.no = no;
		this.userid = userid;
		this.contents = contents;
		this.regdate = regdate;
		this.up = up;
		this.down = down;
		this.albumNo = albumNo;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public int getAlbumNo() {
		return albumNo;
	}
	public void setAlbumNo(int albumNo) {
		this.albumNo = albumNo;
	}
	@Override
	public String toString() {
		return "ReplyVO [no=" + no + ", userid=" + userid + ", contents=" + contents + ", regdate=" + regdate + ", up="
				+ up + ", down=" + down + ", albumNo=" + albumNo + "]";
	}
		
	
}

