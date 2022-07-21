package com.melon.mymusic.model;

public class PlayListVO {
	private int sNo;
	private String sTitle;
	private String sArtist;
	private String sFile;

	public int getsNo() {
		return sNo;
	}

	public String getsTitle() {
		return sTitle;
	}

	public String getsArtist() {
		return sArtist;
	}

	public String getsFile() {
		return sFile;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public void setsArtist(String sArtist) {
		this.sArtist = sArtist;
	}

	public void setsFile(String sFile) {
		this.sFile = sFile;
	}
}
