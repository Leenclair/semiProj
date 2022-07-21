package com.melon.mymusic.model;

// Connection, PreparedStatement, ResultSet
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
// ArrayList
import java.util.ArrayList;
import java.util.List;

import com.melon.db.ConnectionPoolMgr2;

public class MyListDAO {
	public ConnectionPoolMgr2 pool;

	public MyListDAO() {
		pool=new ConnectionPoolMgr2();
	}


	// DAO(JDBC => 기본 셋팅)
	// 기능 => MusicTop200
	public ArrayList<MyListVO> mymusicAllData() throws SQLException {
		ArrayList<MyListVO> list = new ArrayList<MyListVO>();
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		try {
			con=pool.getConnection();
			String sql = "SELECT * FROM mylist";
			ps = con.prepareStatement(sql);
			// 결과값 받기
			rs = ps.executeQuery();
			while (rs.next()) {
				MyListVO vo = new MyListVO();
				
				vo.setsNo(rs.getInt("sNo"));
				vo.setUserId(rs.getString("userId"));
				vo.setmSong(rs.getString("mSong"));
				vo.setmArtist(rs.getString("mArtist"));
				vo.setmFile(rs.getString("mFile"));
				
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

	public ArrayList<MyListVO> mymusicAllData(int page) throws SQLException {
		ArrayList<MyListVO> list = new ArrayList<MyListVO>();
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		try {
			con=pool.getConnection();
			int rowSize = 10;
			int start = (page * rowSize) - (rowSize - 1);
			int end = page * rowSize;

			String sql = "SELECT sNo, userId, sTitle, sArtist, sFile "
					+ "FROM (SELECT sNo, userId, sTitle, sArtist, sFile, rownum as num "
					+ "FROM (SELECT sNo, userId, sTitle, sArtist, sFile "
					+ "FROM mylist ORDER BY no)) " + "WHERE num BETWEEN ? and ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);

			rs = ps.executeQuery();
			while (rs.next()) {
				MyListVO vo = new MyListVO();
				vo.setsNo(rs.getInt("sNo"));
				vo.setUserId(rs.getString("userId"));
				vo.setmSong(rs.getString("mSong"));
				vo.setmArtist(rs.getString("mArtist"));
				vo.setmFile(rs.getString("mFile"));

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

	public int mymusicTotalpage() throws SQLException {
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		int total = 0;
		try {
			con=pool.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10.0) FROM mylist";
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
	
	public void mymusicInsert(MyListVO item) throws SQLException {
		Connection con= null;
		PreparedStatement ps= null;
		try {
			con=pool.getConnection();
			String sql = "INSERT INTO mylist (sNo, userId, mSong, mArtist, mFile) VALUES (?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, item.getsNo());
			ps.setString(2, item.getUserId());
			ps.setString(3, item.getmSong());
			ps.setString(4, item.getmArtist());
			ps.setString(5, item.getmFile());

			ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			pool.dbClose(ps, con);
		}

	}
	
	public List<MyListVO> mymusiclist(String userId) throws SQLException {
		Connection con= null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		ArrayList<MyListVO> list = new ArrayList<MyListVO>();
		try {
			con=pool.getConnection();
			String sql = "select * from mylist where userid= ? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
//			System.out.println(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MyListVO vo = new MyListVO();
				
				vo.setsNo(rs.getInt("sNo"));
				vo.setUserId(rs.getString("userid"));
				vo.setmSong(rs.getString("msong"));
				vo.setmArtist(rs.getString("martist"));
				vo.setmFile(rs.getString("mfile"));
				list.add(vo);
			}
			return list;

		} finally {
			pool.dbClose(rs, ps, con);
		}
		

	}
}
