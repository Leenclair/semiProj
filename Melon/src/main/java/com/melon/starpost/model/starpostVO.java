package com.melon.starpost.model;

import java.sql.Timestamp;

public class starpostVO {
	private int no;
	private String title;
	private Timestamp regdate;
	private int readcount;
	private String content;
	private String videoRoot;
	
	//댓글
	private int groupNo;
	private int step;
	private int sortNo;
	private String delFlag;
	
	//파일
	private String fileName;
	private long fileSize;
	private int downCount;
	private String originalFileName;
	
	public starpostVO() {
		super();
	}

	public starpostVO(int no, String title, Timestamp regdate, int readcount, String content, String videoRoot,
			int groupNo, int step, int sortNo, String delFlag, String fileName, long fileSize, int downCount,
			String originalFileName) {
		super();
		this.no = no;
		this.title = title;
		this.regdate = regdate;
		this.readcount = readcount;
		this.content = content;
		this.videoRoot = videoRoot;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
		this.delFlag = delFlag;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.downCount = downCount;
		this.originalFileName = originalFileName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVideoRoot() {
		return videoRoot;
	}

	public void setVideoRoot(String videoRoot) {
		this.videoRoot = videoRoot;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	@Override
	public String toString() {
		return "starpostVO [no=" + no + ", title=" + title + ", regdate=" + regdate + ", readcount=" + readcount
				+ ", content=" + content + ", videoRoot=" + videoRoot + ", groupNo=" + groupNo + ", step=" + step
				+ ", sortNo=" + sortNo + ", delFlag=" + delFlag + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", downCount=" + downCount + ", originalFileName=" + originalFileName + "]";
	}

}
