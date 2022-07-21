package com.melon.starpost.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.melon.db.ConnectionPoolMgr2;

public class spLikeDAO {
	private ConnectionPoolMgr2 pool;
	
	public spLikeDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int updateSpLike(spLikeVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update spLike set spLike=? where spNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getSpLike());
			ps.setInt(2, vo.getSpNo());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("좋아요 업데이트 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public spLikeVO selectByNo(int spNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		spLikeVO vo=new spLikeVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from spLike where spNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, spNo);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				vo.setSpNo(rs.getInt("spNo"));
				vo.setSpLike(rs.getInt("spLike"));
			}
			
			System.out.println("좋아요 조회 결과 vo="+vo+", 매개변수 spNo="+spNo);
			return vo;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
