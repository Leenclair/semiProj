package com.melon.starpost.reply.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.melon.db.ConnectionPoolMgr2;


public class ReplyDAO {
	private ConnectionPoolMgr2 pool;
	
	public ReplyDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public List<ReplyVO> selectAll(int spNo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ReplyVO> list=new ArrayList<ReplyVO>();
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from spReply where spNo=? order by regdate desc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, spNo);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ReplyVO vo=new ReplyVO();
				vo.setNo(rs.getInt("no"));
				vo.setSpNo(spNo);
				vo.setUserid(rs.getString("userid"));
				vo.setNickname(rs.getString("nickname"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				
				list.add(vo);
			}
			
			System.out.println("해당 글 댓글 전체조회 결과 list.size="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertReply(ReplyVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="insert into spReply(no, spno, userid, nickname, content) values(spReply_SEQ.nextval,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getSpNo());
			ps.setString(2, vo.getUserid());
			ps.setString(3, vo.getNickname());
			ps.setString(4, vo.getContent());
			
			int cnt=ps.executeUpdate();
			System.out.println("댓글 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="delete from spReply where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("댓글 삭제 결과 cnt="+cnt+", 매개변수 no="+no);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateReply(int no, String content) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update spReply set content=? where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, content);
			ps.setInt(2, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("댓글 수정 결과 cnt="+cnt+", 매개변수 no="+no+", content="+content);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
