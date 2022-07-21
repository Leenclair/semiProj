package com.melon.starpost.model;

public class spLikeVO {
	private int spNo;
	private int spLike;
	
	public spLikeVO() {
		super();
	}

	public spLikeVO(int spNo, int spLike) {
		super();
		this.spNo = spNo;
		this.spLike = spLike;
	}

	public int getSpNo() {
		return spNo;
	}

	public void setSpNo(int spNo) {
		this.spNo = spNo;
	}

	public int getSpLike() {
		return spLike;
	}

	public void setSpLike(int spLike) {
		this.spLike = spLike;
	}

	@Override
	public String toString() {
		return "spLikeVO [spNo=" + spNo + ", spLike=" + spLike + "]";
	}
	
}
