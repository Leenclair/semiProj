package com.melon.album.model;

import java.sql.Timestamp;

public class AlbumVO {
	private int aNo; /* 앨범번호 */
	private String aname; /* 앨범 명 */
	private Timestamp ondate; /* 앨범 등록일 */
	private String genre; /* 앨범 장르 */
	private String agency; /* 앨범 기획사 */
	private String acomp; /* 앨범 판매사 */
	private int alike; /* 좋아요 */
	private String info; /* 앨범 소개 */
	private String img;	/* 앨범 이미지*/
	private String imgpath; /* 앨범 이미지 경로 */
	
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Timestamp getOndate() {
		return ondate;
	}
	public void setOndate(Timestamp ondate) {
		this.ondate = ondate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public String getAcomp() {
		return acomp;
	}
	public void setAcomp(String acomp) {
		this.acomp = acomp;
	}
	public int getAlike() {
		return alike;
	}
	public void setAlike(int alike) {
		this.alike = alike;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

	
	public AlbumVO(int aNo, String aname, Timestamp ondate, String genre, String agency, String acomp, int alike,
			String info, String img, String imgpath) {
		super();
		this.aNo = aNo;
		this.aname = aname;
		this.ondate = ondate;
		this.genre = genre;
		this.agency = agency;
		this.acomp = acomp;
		this.alike = alike;
		this.info = info;
		this.img = img;
		this.imgpath = imgpath;
	}
	public AlbumVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "AlbumVO [aNo=" + aNo + ", aname=" + aname + ", ondate=" + ondate + ", genre=" + genre + ", agency="
				+ agency + ", acomp=" + acomp + ", alike=" + alike + ", info=" + info + ", img=" + img + ", imgpath="
				+ imgpath + "]";
	}


}
