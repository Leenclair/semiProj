package com.melon.notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.melon.db.ConnectionPoolMgr2;



public class noticeDAO {
	public ConnectionPoolMgr2 pool;

	public noticeDAO() {
		pool=new ConnectionPoolMgr2();
	}

	public List<noticeVO> selectAll(String condition, String keyword) 
			throws SQLException {
		/*
	select * from board
	where title like '%안%';

	select * from board
	where name like '%길%';

	select * from board
	where content like '%k%';
		 */

		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<noticeVO> list=new ArrayList<noticeVO>();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from notice ";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+=" order by ntno desc";
			ps=con.prepareStatement(sql);

			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}

			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("ntNo");
				String cate=rs.getString("ntCate");
				String title=rs.getString("ntTitle");
				int num=rs.getInt("ntNum");
				Timestamp regdate=rs.getTimestamp("ntRegdate");
				String content=rs.getString("ntContent");


				noticeVO vo = new noticeVO(no, cate, title, num, regdate, content);
				list.add(vo);
			}

			System.out.println("전체 조회 결과 list.size="+list.size()
			+", 매개변수 condition="+condition+", keyword="
			+ keyword);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public noticeVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		noticeVO vo = new noticeVO();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from notice where ntno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setNtNo(no);
				vo.setNtContent(rs.getString("ntCate"));
				vo.setNtTitle(rs.getString("ntTitle"));
				vo.setNtNum(rs.getInt("ntNum"));
				vo.setNtRegdate(rs.getTimestamp("ntRegdate"));
				vo.setNtContent(rs.getString("ntContent"));
			}

			System.out.println("글 상세보기 결과 vo="+vo+", 매개변수 no="+no);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int updateCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update notice set ntnum=ntnum+1"
		               + " where ntno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);

			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+no);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
