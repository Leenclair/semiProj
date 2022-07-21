<%@page import="com.melon.starpost.reply.model.ReplyVO"%>
<%@page import="com.melon.starpost.reply.model.ReplyService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String spNo=request.getParameter("no");

	String userid=request.getParameter("userid");
	String nickName=request.getParameter("nickName");
	String content=request.getParameter("content");
	
	ReplyService replyService=new ReplyService();
	ReplyVO vo=new ReplyVO();
	vo.setSpNo(Integer.parseInt(spNo));
	vo.setUserid(userid);
	vo.setNickname(nickName);
	vo.setContent(content);
	
	try{
		int cnt=replyService.insertReply(vo);
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert("댓글이 등록되었습니다");
				location.href="detail.jsp?no=<%=spNo%>";
			</script>
		<%}else{ %>
			<script type="text/javascript">
				alert("댓글 등록을 실패했습니다");
				history.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>