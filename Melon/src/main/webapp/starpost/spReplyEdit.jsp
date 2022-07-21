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
	String[] replyNo=request.getParameterValues("replyNo");
	String[] contents=request.getParameterValues("contents");
	String[] spNoArr=request.getParameterValues("spNo");
	
	ReplyService replyService = new ReplyService();
	
	int no=0;
	String content="";
	int spNo=0;
	
	for(int i=0;i<contents.length;i++){
		if(!contents[i].equals("")){
			no=Integer.parseInt(replyNo[i]);
			content=contents[i];
			spNo=Integer.parseInt(spNoArr[i]);
			break;
		}
	}
	
	try{
		int cnt=replyService.updateReply(no, content);
		if(cnt>0){%>
		<script type="text/javascript">
			alert("댓글수정완료");
			location.href="detail.jsp?no=<%=spNo%>";
		</script>
		<%}else{ %>
		<script type="text/javascript">
			alert("댓글수정실패");
			location.href="detail.jsp?no=<%=spNo%>";
		</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>