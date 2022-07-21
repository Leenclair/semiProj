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
	String replyNo=request.getParameter("replyNo");
	String spNo=request.getParameter("spNo");
	
	ReplyService replyService = new ReplyService();
	ReplyVO replyVo = null;
	
	try{
		int cnt=replyService.deleteNo(Integer.parseInt(replyNo));
		if(cnt>0){%>
		<script type="text/javascript">
			alert("댓글이 삭제되었습니다");
			location.href="detail.jsp?no=<%=spNo%>";
		</script>
		<%}else {%>
		<script type="text/javascript">
			alert("댓글 삭제 실패");
			location.href="detail.jsp?no=<%=spNo%>";
		</script>	
		<% }
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>