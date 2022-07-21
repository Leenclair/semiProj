
<%@page import="com.melon.mymusic.model.MyListVO"%>
<%@page import="com.melon.mymusic.model.MyListDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MyListDAO myListDAO = new MyListDAO();

	MyListVO item = new MyListVO();
	item.setsNo(Integer.parseInt(request.getParameter("sNo")));
	item.setUserId(request.getParameter("userId"));
	item.setmSong(request.getParameter("sTitle"));
	item.setmArtist(request.getParameter("sArtist"));
	item.setmFile(request.getParameter("sFile"));
	
	myListDAO.mymusicInsert(item);
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert MyList</title>
</head>
<body>

</body>
</html>