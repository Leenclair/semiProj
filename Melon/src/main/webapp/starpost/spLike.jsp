<%@page import="com.melon.starpost.model.spLikeService"%>
<%@page import="com.melon.starpost.model.spLikeVO"%>
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
	String spNo=request.getParameter("spNo");

	spLikeService spLikeService=new spLikeService();
	spLikeVO vo=null;
	try{
		vo=spLikeService.selectByNo(Integer.parseInt(spNo));
		int like=vo.getSpLike();
		like=like+1;
		vo.setSpLike(like);
		
		int cnt = spLikeService.updateSpLike(vo);
		
		if(cnt>0){%>
			<script type="text/javascript">
				location.href="list.jsp";
			</script>
		<%}else{ %>
			<script type="text/javascript">
				location.href="list.jsp";
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>