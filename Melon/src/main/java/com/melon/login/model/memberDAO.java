package com.melon.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.melon.db.ConnectionPoolMgr2;

public class memberDAO {
	private ConnectionPoolMgr2 pool;
	
	public memberDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertMember(memberDTO dto) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into member(no,userid,pwd,name,nickname)"
					+ " values(member_seq.nextval,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1,dto.getUserid());
			ps.setString(2,dto.getPwd());
			ps.setString(3,dto.getName());
			ps.setString(4,dto.getNickname());
			
			
			int cnt=ps.executeUpdate();
			System.out.println("회원가입 결과 cnt="+cnt+", 매개변수 dto"+dto);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int duplicateId(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			con=pool.getConnection();
			
			String sql="select COUNT(*) from member where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) {
					result=MemberService.UNUSABLE_ID;
				}else {
					result=MemberService.USABLE_ID;
					
				}
			}
			System.out.println("아이디 중복확인 결과 result="+result+", 매개변수 userid="+userid);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int checklogin(String userid,String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			con=pool.getConnection();
			
			String sql="select pwd from member"
		               + " where userid=? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				String dbPwd=rs.getString(1);            
	            if(dbPwd.equals(pwd)) {
	               result=MemberService.LOGIN_OK;
	            }else {
	               result=MemberService.DISAGREE_PWD;
	            }
	         }else {
	            result=MemberService.NONE_USERID;
	         }
			System.out.println("로그인 체크 결과 result="+result
		            +", 매개변수 userid="+userid+", pwd="+pwd);
		        
			return result;
				
		}finally {
			pool.dbClose(rs, ps, con);
		}
			
	}
	
	public memberDTO selectByUserid(String userid) throws SQLException {
		Connection con=null;
	      PreparedStatement ps=null;
	      ResultSet rs=null;
	      
	      memberDTO dto= new memberDTO();
	      try {
	         con=pool.getConnection();
	         
	         String sql="select * from member where userid=?";
	         ps=con.prepareStatement(sql);         
	         ps.setString(1, userid);
	         
	         rs=ps.executeQuery();
	         if(rs.next()) {
	            dto.setNo(rs.getInt("no"));
	            dto.setUserid(userid);
	            dto.setPwd(rs.getString("pwd"));
	            dto.setName(rs.getString("name"));
	            dto.setNickname(rs.getString("nickname"));
	            dto.setRegdate(rs.getTimestamp("regdate"));
	            dto.setOutdate(rs.getTimestamp("outdate"));            
	         }
	         System.out.println("아이디로 조회 결과 dto="+dto
	               +", 매개변수 userid="+userid);
	         
	         return dto;
	      }finally {
	         pool.dbClose(rs, ps, con);
	      }
	}
	
	public int duplicatenick(String nickname) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			con=pool.getConnection();
			
			String sql="select COUNT(*) from member where nickname=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, nickname);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) {
					result=MemberService.UNUSABLE_ID;
				}else {
					result=MemberService.USABLE_ID;
					
				}
			}
			System.out.println("아이디 중복확인 결과 result="+result+", 매개변수 nickname="+nickname);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int update(memberDTO dto) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update member"
					+ " set nickname=?"
					+ " where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getNickname());
			ps.setString(2, dto.getUserid());
			
			int cnt=ps.executeUpdate();
			System.out.println("수정 결과 cnt="+cnt+", 매개변수 dto="+dto);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public int deletemember(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update member"
		               + " set outdate=sysdate"
		               + " where userid=? and outdate is null";;
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
	         
	         int cnt=ps.executeUpdate();         
	         System.out.println("회원 탈퇴 결과 cnt="+cnt+", 매개변수 userid="+userid);
	         
	         return cnt;
	      }finally {
	         pool.dbClose(ps, con);
	      }
		
	}
}
