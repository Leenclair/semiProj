package com.melon.album.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.melon.db.ConnectionPoolMgr2;



public class AlbumDAO {
	private ConnectionPoolMgr2 pool;
	
	public AlbumDAO() {
		pool= new ConnectionPoolMgr2();
	}
	
	public AlbumVO showAlbumByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		AlbumVO vo= new AlbumVO();
		try {
			con=pool.getConnection();
			
			
			String sql="select ano, aname, ondate, genre, agency, acomp, alike, info, img, imgpath from album where ano=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int ano=rs.getInt("ano");
				String aname=rs.getString("aname");
				Timestamp ondate=rs.getTimestamp("ondate");
				String genre=rs.getString("genre");
				String agency=rs.getString("agency");
				String acomp=rs.getString("acomp");
				int alike=rs.getInt("alike");
				String info=rs.getString("info");
				String img=rs.getString("img");
				String imgpath=rs.getString("imgpath");
				
				vo.setaNo(ano);
				vo.setAname(aname);
				vo.setOndate(ondate);
				vo.setGenre(genre);
				vo.setAgency(agency);
				vo.setAcomp(acomp);
				vo.setAlike(alike);
				vo.setInfo(info);
				vo.setImg(img);
				vo.setImgpath(imgpath);
			}
			System.out.println("앨범 조회 결과 vo ="+vo+"매개변수 no="+no);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
}
