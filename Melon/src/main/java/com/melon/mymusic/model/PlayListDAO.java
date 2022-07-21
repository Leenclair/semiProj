package com.melon.mymusic.model;

import java.sql.*; // Connection, PreparedStatement, ResultSet

import java.util.*; // ArrayList

import com.melon.db.ConnectionPoolMgr2;


public class PlayListDAO {
	public ConnectionPoolMgr2 pool;

	public PlayListDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public ArrayList<PlayListVO> musicAllData() throws SQLException {
		ArrayList<PlayListVO> list = new ArrayList<PlayListVO>();
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		try {
			con=pool.getConnection();
			// SQL문장 전송
			String sql = "SELECT * FROM playlist";
			ps =con.prepareStatement(sql);
			// 결과값 받기
			rs = ps.executeQuery();
			while (rs.next()) {
				PlayListVO vo = new PlayListVO();
				
				vo.setsNo(rs.getInt("sNo"));
				vo.setsTitle(rs.getString("sTitle"));
				vo.setsArtist(rs.getString("sArtist"));
				vo.setsFile(rs.getString("sFile"));
				list.add(vo);
				System.out.println("담기 성공!");
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
	}

	public ArrayList<PlayListVO> musicAllData(int page) throws SQLException {
		ArrayList<PlayListVO> list = new ArrayList<PlayListVO>();
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		try {
			con=pool.getConnection();
			int rowSize = 10;
			int start = (page * rowSize) - (rowSize - 1);
			int end = page * rowSize;

			String sql = "SELECT sNo, sTitle, sArtist, sFile "
					+ "FROM (SELECT sNo, sTitle, sArtist, sFile, rownum as num "
					+ "FROM (SELECT sNo, sTitle, sArtist, sFile "
					+ "FROM playlist ORDER BY no)) " + "WHERE num BETWEEN ? and ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);

			rs = ps.executeQuery();
			while (rs.next()) {
				PlayListVO vo = new PlayListVO();
				vo.setsNo(rs.getInt("sNo"));
				vo.setsTitle(rs.getString("sTitle"));
				vo.setsArtist(rs.getString("sArtist"));
				vo.setsFile(rs.getString("sFile"));

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

	public int musicTotalpage() throws SQLException {
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		int total = 0;
		try {
			con=pool.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10.0) FROM playlist";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			pool.dbClose(rs, ps, con);
		}
		return total;
	}
}
