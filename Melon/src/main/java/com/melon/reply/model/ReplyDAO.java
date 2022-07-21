package com.melon.reply.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.melon.db.ConnectionPoolMgr2;




public class ReplyDAO {
	private ConnectionPoolMgr2 pool;
	public ReplyDAO() {
		pool=new ConnectionPoolMgr2();
	}

	public int insertReply(ReplyVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="insert into reply(no, userid, contents, regdate,albumNo)"
					+ " values(reply_seq.nextval, ?,?,sysdate,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getContents());
			ps.setInt(3, vo.getAlbumNo());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("댓글등록 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public List<ReplyVO> selectAll(String condition, String keyword, int ano) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ReplyVO> list=new ArrayList<ReplyVO>();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from reply where albumNo=?";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" and "+condition+" like '%' || ? || '%'";
			}
				sql+= " order by no desc";
				ps=con.prepareStatement(sql);
				ps.setInt(1, ano);
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(2, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String userid=rs.getString("userid");
				String contents=rs.getString("contents");
				Timestamp regdate=rs.getTimestamp("regdate");
				int up=rs.getInt("up");
				int down=rs.getInt("down");
				int albumNo=rs.getInt("albumNo");

				ReplyVO vo = new ReplyVO(no, userid, contents, regdate, 
						up, down,albumNo);
				list.add(vo);
			}

			System.out.println("전체 조회 결과 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public List<ReplyVO> selectAll2(String condition, String keyword) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ReplyVO> list=new ArrayList<ReplyVO>();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from reply ";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+= " order by no";
			ps=con.prepareStatement(sql);
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String userid=rs.getString("userid");
				String contents=rs.getString("contents");
				Timestamp regdate=rs.getTimestamp("regdate");
				int up=rs.getInt("up");
				int down=rs.getInt("down");
				int albumNo=rs.getInt("albumNo");

				ReplyVO vo = new ReplyVO(no, userid, contents, regdate, 
						up, down,albumNo);
				list.add(vo);
			}

			System.out.println("전체 조회 결과 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int deleteReply(ReplyVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="delete reply where no=? and Userid=? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getUserid());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("댓글삭제 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public int editReply(ReplyVO vo) throws SQLException {
		System.out.println(vo.getNo());
		System.out.println(vo.getContents());
		System.out.println(vo.getUserid());
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="update reply"
					+ " set contents=? where no=? and Userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getContents());
			ps.setInt(2, vo.getNo());
			ps.setString(3, vo.getUserid());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("댓글수정 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
