package com.melon.song.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.melon.db.ConnectionPoolMgr2;




public class SongDAO {
	
		private ConnectionPoolMgr2 pool;
		public SongDAO() {
			pool=new ConnectionPoolMgr2();
		}
	public List<SongVO> selectAll(String searchInput) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<SongVO> list=new ArrayList<SongVO>();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from song ";
			if(searchInput!=null && !searchInput.isEmpty()) {
				sql+=" where stitle like '%' || ? || '%'";
			}
			sql+= " order by sno desc";
			ps=con.prepareStatement(sql);
			
			if(searchInput!=null && !searchInput.isEmpty()) {
				ps.setString(1, searchInput);
			}
			
			//4
			rs=ps.executeQuery();
		
			while(rs.next()) {
				int sNo=rs.getInt("sNo");
				String sTitle=rs.getString("sTitle");
				String sArtist=rs.getString("sArtist");
				String sAlbum=rs.getString("sAlbum");
				int sLike=rs.getInt("sLike");
				String smp3=rs.getString("smp3");
				String smp3path=rs.getString("smp3path");
				int aNo=rs.getInt("aNo");
				
				SongVO vo= new SongVO(sNo, sTitle, sArtist, sAlbum, sLike, smp3, smp3path, aNo);
				System.out.println("list : " + vo);
				list.add(vo);
			}

			System.out.println("전체 조회 결과 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public List<SongVO> selectAll2(String searchInput) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<SongVO> list=new ArrayList<SongVO>();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from song ";
			if(searchInput!=null && !searchInput.isEmpty()) {
				sql+=" where sartist like '%' || ? || '%'";
			}
			sql+= " order by sno desc";
			ps=con.prepareStatement(sql);
			if(searchInput!=null && !searchInput.isEmpty()) {
				ps.setString(1, searchInput);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int sNo=rs.getInt("sNo");
				String sTitle=rs.getString("sTitle");
				String sArtist=rs.getString("sArtist");
				String sAlbum=rs.getString("sAlbum");
				int sLike=rs.getInt("sLike");
				String smp3=rs.getString("smp3");
				String smp3path=rs.getString("smp3path");
				int aNo=rs.getInt("aNo");
				
				SongVO vo= new SongVO(sNo, sTitle, sArtist, sAlbum, sLike, smp3, smp3path, aNo);
				System.out.println("list2 : " + vo);
				list.add(vo);
			}

			System.out.println("전체 조회 결과 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
public List<SongVO> selectByNumber(int aNo) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<SongVO> list=new ArrayList<SongVO>();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from song where ano=? ";
			ps=con.prepareStatement(sql);
			
				ps.setInt(1, aNo);
			
			
			//4
			rs=ps.executeQuery();
		
			while(rs.next()) {
				int sNo=rs.getInt("sNo");
				String sTitle=rs.getString("sTitle");
				String sArtist=rs.getString("sArtist");
				String sAlbum=rs.getString("sAlbum");
				int sLike=rs.getInt("sLike");
				String smp3=rs.getString("smp3");
				String smp3path=rs.getString("smp3path");
				aNo=rs.getInt("aNo");
				
				SongVO vo= new SongVO(sNo, sTitle, sArtist, sAlbum, sLike, smp3, smp3path, aNo);
				System.out.println("list : " + vo);
				list.add(vo);
			}

			System.out.println("앨범병 조회 결과 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
