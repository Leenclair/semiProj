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
	//1
	

	request.setCharacterEncoding("utf-8");
	String[] contents=request.getParameterValues("contents");
	String[] no=request.getParameterValues("no");
	String[] userid=request.getParameterValues("userid");
	String sno=request.getParameter("album_num");
	
	for (int i=0;i<contents.length;i++){
		if(!contents[i].equals("")){
		ReplyDAO dao= new ReplyDAO();
		ReplyVO vo=new ReplyVO();
		vo.setContents(contents[i]);
		vo.setNo(Integer.parseInt(no[i]));
		vo.setUserid(userid[i]);
		try{
			dao.editReply(vo);
			%>
			<script type="text/javascript">
				location.href="albumDetail.jsp?no=<%=sno%>";
				/* window.location=document.referrer; */
			</script>
		<%
		}catch(SQLException e){
			e.printStackTrace();
		}
	};
		
	}
	%>
</body>
</html>