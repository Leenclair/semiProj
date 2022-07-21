package com.melon.login.model;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




public class MemberService {
	//아이디 중복확인에서 사용하는 상수
	public static final int USABLE_ID=1; 
	public static final int UNUSABLE_ID=2; 
	
	//로그인 체크에서 사용하는 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2; //비번 불일치
	public static final int NONE_USERID=3; //해당 아이디 없다
	
	private memberDAO memberDao;
	
	
	public MemberService() {
		memberDao=new memberDAO();
	}
	
	
	public int insertMember(memberDTO dto) throws SQLException {
		int cnt=memberDao.insertMember(dto);
		return cnt;
		
	}
	
	public int duplicateId(String userid) throws SQLException {
		return memberDao.duplicateId(userid);
	}
	
	public int checklogin(String userid,String pwd) throws SQLException {
		return memberDao.checklogin(userid, pwd);
	}
	
	public memberDTO selectByUserid(String userid) throws SQLException {
		return memberDao.selectByUserid(userid);
	}
	
	public int duplicatenick(String nickname) throws SQLException {
		return memberDao.duplicatenick(nickname);
	}
	public int update(memberDTO dto) throws SQLException {
		return memberDao.update(dto);
	}
	public int deletemember(String userid) throws SQLException {
		return memberDao.deletemember(userid);
	}
	
}
