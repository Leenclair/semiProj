package com.melon.notice.model;

import java.sql.Timestamp;

public class noticeVO {
	private int ntNo;
	private String ntCate;
	private String ntTitle;
	private int ntNum;
	private Timestamp ntRegdate;
	private String ntContent;
	public noticeVO() {
		super();
	}
	public noticeVO(int ntNo, String ntCate, String ntTitle, int ntNum, Timestamp ntRegdate, String ntContent) {
		super();
		this.ntNo = ntNo;
		this.ntCate = ntCate;
		this.ntTitle = ntTitle;
		this.ntNum = ntNum;
		this.ntRegdate = ntRegdate;
		this.ntContent = ntContent;
	}
	public int getNtNo() {
		return ntNo;
	}
	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}
	public String getNtCate() {
		return ntCate;
	}
	public void setNtCate(String ntCate) {
		this.ntCate = ntCate;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public int getNtNum() {
		return ntNum;
	}
	public void setNtNum(int ntNum) {
		this.ntNum = ntNum;
	}
	public Timestamp getNtRegdate() {
		return ntRegdate;
	}
	public void setNtRegdate(Timestamp ntRegdate) {
		this.ntRegdate = ntRegdate;
	}
	public String getNtContent() {
		return ntContent;
	}
	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}
	@Override
	public String toString() {
		return "noticeVO [ntNo=" + ntNo + ", ntCate=" + ntCate + ", ntTitle=" + ntTitle + ", ntNum=" + ntNum
				+ ", ntRegdate=" + ntRegdate + ", ntContent=" + ntContent + "]";
	}
	
	
}