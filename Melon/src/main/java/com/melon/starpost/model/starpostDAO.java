package com.melon.starpost.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.melon.db.ConnectionPoolMgr2;


public class starpostDAO {
	private ConnectionPoolMgr2 pool;
	
	public starpostDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public List<starpostVO> selectAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<starpostVO> list=new ArrayList<starpostVO>();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from starpost";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int no=rs.getInt("no");
				String title=rs.getString("title");
				Timestamp regdate=rs.getTimestamp("regdate");
				int readcount=rs.getInt("readcount");
				String content=rs.getString("content");
				String videoRoot=rs.getString("videoRoot");
				
				int groupno=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortno=rs.getInt("sortno");
				
				String delflag=rs.getString("delflag");
				String filename=rs.getString("filename");
				long filesize=rs.getLong("filesize");
				int downcount=rs.getInt("downcount");
				String originalfilename=rs.getString("originalfilename");
				
				starpostVO vo=new starpostVO(no, title, regdate, readcount, content, videoRoot, groupno, step, sortno, delflag, filename, filesize, downcount, originalfilename);
				
				list.add(vo);
			}
			
			System.out.println("매거진 조회 결과 list.size="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public starpostVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		starpostVO vo=new starpostVO();
		
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select * from starpost where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setTitle(rs.getString("title"));
				vo.setVideoRoot(rs.getString("videoRoot"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setContent(rs.getString("content"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setDelFlag(rs.getString("delflag"));
				vo.setFileName(rs.getString("filename"));
				vo.setFileSize(rs.getLong("filesize"));
				vo.setDownCount(rs.getInt("downcount"));
				vo.setOriginalFileName(rs.getString("originalfilename"));
			}
			
			System.out.println("매거진 검색 결과 vo="+vo+",매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
