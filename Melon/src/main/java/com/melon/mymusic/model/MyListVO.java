package com.melon.mymusic.model;

public class MyListVO {
	private int sNo;
	private String userId;
	private String mSong;
	private String mArtist;
	private String mFile;
	public int getsNo() {
		return sNo;
	}
	public String getUserId() {
		return userId;
	}
	public String getmSong() {
		return mSong;
	}
	public String getmArtist() {
		return mArtist;
	}
	public String getmFile() {
		return mFile;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setmSong(String mSong) {
		this.mSong = mSong;
	}
	public void setmArtist(String mArtist) {
		this.mArtist = mArtist;
	}
	public void setmFile(String mFile) {
		this.mFile = mFile;
	}
}
