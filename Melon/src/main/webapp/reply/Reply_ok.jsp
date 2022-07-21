<%@page import="com.melon.reply.model.ReplyVO"%>
<%@page import="com.melon.reply.model.ReplyDAO"%>
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
	//1 세션 정보 받아오기
	String t_userid=(String)session.getAttribute("userid");
	String t_nickname=(String)session.getAttribute("nickname");
	String t_username=(String)session.getAttribute("userName");
	
	request.setCharacterEncoding("utf-8");
	String userid=t_nickname;
	String contents=request.getParameter("contents");
	String sno=request.getParameter("album_num");
	//2
	ReplyDAO dao = new ReplyDAO();
	ReplyVO vo = new ReplyVO();
	vo.setUserid(userid);
	vo.setContents(contents);
	vo.setAlbumNo(Integer.parseInt(sno));
	
	
	try{
		
		
		//3
		if(t_userid==null){ %>
			<script type="text/javascript">
				alert("로그인해주세요");
				location.href="../login/login.jsp";
			</script>
			<%}else{
			int cnt=dao.insertReply(vo);%>
			<script type="text/javascript">
			//location.href="albumDetail.jsp?no=3"; */
			window.location=document.referrer;
			</script>	
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>