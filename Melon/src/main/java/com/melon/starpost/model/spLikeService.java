package com.melon.starpost.model;

import java.sql.SQLException;

public class spLikeService {
	private spLikeDAO spLikeDao;
	
	public spLikeService() {
		spLikeDao=new spLikeDAO();
	}
	
	public int updateSpLike(spLikeVO vo) throws SQLException {
		return spLikeDao.updateSpLike(vo);
	}
	
	public spLikeVO selectByNo(int spNo) throws SQLException {
		return spLikeDao.selectByNo(spNo);
	}
}
