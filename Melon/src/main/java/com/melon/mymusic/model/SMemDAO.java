package com.melon.mymusic.model;

import java.sql.*; // Connection, PreparedStatement, ResultSet
import java.util.*; // ArrayList

import com.melon.db.ConnectionPoolMgr2;
import com.melon.login.model.memberDTO;

public class SMemDAO {
	
	public ConnectionPoolMgr2 pool;

	public SMemDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	// DAO(JDBC => 기본 셋팅)
	// 기능 => MusicTop200
	public ArrayList<SmemVO> userAllData() throws SQLException {
		ArrayList<SmemVO> list = new ArrayList<SmemVO>();
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		try {
			con=pool.getConnection();// 연결
			// SQL문장 전송
			String sql = "SELECT * FROM smem";
			ps = con.prepareStatement(sql);
			// 결과값 받기
			rs = ps.executeQuery();
			while (rs.next()) {
				SmemVO vo = new SmemVO();
				
				vo.setUserId(rs.getString("userId"));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
		
	}
	/*
	 * public int insertSmem(String nickname) throws SQLException { Connection
	 * con=null; PreparedStatement ps=null;
	 * 
	 * try { con=pool.getConnection();
	 * 
	 * String sql="insert into smem(userid)" + " values(?)";
	 * ps=con.prepareStatement(sql);
	 * 
	 * ps.setString(1,nickname);
	 * 
	 * 
	 * int cnt=ps.executeUpdate(); return cnt; }finally { pool.dbClose(ps, con); } }
	 */
}
