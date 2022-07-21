package com.melon.song.model;

public class SongVO {
	private int sNo;
	private String sTitle;
	private String sArtist;
	private String sAlbum;
	private int sLike;
	private String smp3;
	private String smp3path;
	private int aNo;
	public SongVO() {
		super();
	}
	public SongVO(int sNo, String sTitle, String sArtist, String sAlbum, int sLike, String smp3, String smp3path,
			int aNo) {
		super();
		this.sNo = sNo;
		this.sTitle = sTitle;
		this.sArtist = sArtist;
		this.sAlbum = sAlbum;
		this.sLike = sLike;
		this.smp3 = smp3;
		this.smp3path = smp3path;
		this.aNo = aNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsArtist() {
		return sArtist;
	}
	public void setsArtist(String sArtist) {
		this.sArtist = sArtist;
	}
	public String getsAlbum() {
		return sAlbum;
	}
	public void setsAlbum(String sAlbum) {
		this.sAlbum = sAlbum;
	}
	public int getsLike() {
		return sLike;
	}
	public void setsLike(int sLike) {
		this.sLike = sLike;
	}
	public String getSmp3() {
		return smp3;
	}
	public void setSmp3(String smp3) {
		this.smp3 = smp3;
	}
	public String getSmp3path() {
		return smp3path;
	}
	public void setSmp3path(String smp3path) {
		this.smp3path = smp3path;
	}
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	@Override
	public String toString() {
		return "SongVO [sNo=" + sNo + ", sTitle=" + sTitle + ", sArtist=" + sArtist + ", sAlbum=" + sAlbum + ", sLike="
				+ sLike + ", smp3=" + smp3 + ", smp3path=" + smp3path + ", aNo=" + aNo + "]";
	}
	
}
