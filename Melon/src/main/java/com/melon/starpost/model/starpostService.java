package com.melon.starpost.model;

import java.sql.SQLException;

import java.util.List;

public class starpostService {
	private starpostDAO dao;
	
	public starpostService(){
		dao=new starpostDAO();
	}
	
	public List<starpostVO> selectAll() throws SQLException {
		return dao.selectAll();
	}
	
	public starpostVO selectByNo(int no) throws SQLException {
		return dao.selectByNo(no);
	}
}
