package com.melon.starpost.reply.model;

import java.sql.SQLException;
import java.util.List;

public class ReplyService {
	private ReplyDAO replyDao;
	
	public ReplyService() {
		replyDao=new ReplyDAO();
	}
	
	public List<ReplyVO> selectAll(int spNo) throws SQLException{
		return replyDao.selectAll(spNo);
	}
	
	public int insertReply(ReplyVO vo) throws SQLException {
		return replyDao.insertReply(vo);
	}
	
	public int deleteNo(int no) throws SQLException {
		return replyDao.deleteNo(no);
	}
	
	public int updateReply(int no, String content) throws SQLException {
		return replyDao.updateReply(no, content);
	}
}
