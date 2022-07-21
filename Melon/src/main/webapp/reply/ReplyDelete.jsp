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
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String userid = request.getParameter("userid");
	String sno=request.getParameter("album_num");
	
	ReplyDAO dao=new ReplyDAO();
	ReplyVO vo=new ReplyVO();
	
	vo.setNo(Integer.parseInt(no));
	vo.setUserid(userid);
	
	try{
		dao.deleteReply(vo);
		%>
		<script type="text/javascript">
			location.href="albumDetail.jsp?no=<%=sno%>";
			/* window.location=document.referrer; */
		</script>
	<% }catch(SQLException e){
		e.printStackTrace();
	}%>
	

</body>
</html>