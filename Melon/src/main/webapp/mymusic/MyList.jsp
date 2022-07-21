
<%@page import="com.melon.mymusic.model.MyListVO"%>
<%@page import="com.melon.mymusic.model.MyListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%	
	
	//String userId=(String)session.getAttribute("userId");
	//String userId= request.getParameter("userId");
	String userId="test";
	MyListDAO myListDAO = new MyListDAO();
	List<MyListVO> list=null;
	try{
		list=myListDAO.mymusiclist(userId) ;	
	}catch(SQLException e){
		e.printStackTrace();
	}
	

	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
table {
	border: 1px solid gray;
	border-collapse: collapse;
	border-left: none;
	border-right: none;
	width:100%
}

.tb_list {
	border-bottom: 3px solid #80ba00
}
.tb_list2{
	border-bottom: 1px solid lightgray
	
}
tr {
	height: 35px;
}


#chbx{
	accent-color: #469d23f2;
}
img {width: 22px;}

a#nick {color: #0ebb0e;font-size: 23px;font-weight: bold;}

a#nick2 {font-weight: bold;}

td#sTitle {color: darkslategray;font-weight: lighter;}

td#sArtist {font-weight: lighter;color: dimgray;}
</style>
</head>
<body>
<a id="nick"><%=userId %></a> <a id="nick2">님의 플레이리스트</a>
<img src="../img/csplay.png">
<table border="1">
<colgroup>
		<col style="width:70%;" />
		<col style="width:30%;" />	
			
	</colgroup>
		<thead>
			<tr  style="color: #80ba00;">
				<th scope="col" style="text-align:center" class="tb_list">곡명</th>
				<th scope="col" style="text-align:center" class="tb_list">가수</th>
			</tr>
		</thead>
		<tbody>
		<%for(int i=0; i < list.size(); i++) {
			MyListVO vo = list.get(i);
			%>
			<tr name="music_item">
				<td id="mTitle" style="text-align:center" class="tb_list2"><%=vo.getmSong() %></td>
				<td id="mrtist" style="text-align:center" class="tb_list2"><%=vo.getmArtist() %></td>
			</tr>
		<% }%>
		</tbody>
	</table>
</body>
</html>