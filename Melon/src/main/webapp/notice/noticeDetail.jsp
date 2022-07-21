<%@page import="com.melon.notice.model.noticeVO"%>
<%@page import="com.melon.notice.model.noticeDAO"%>
<%@ include file="../inc/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>

<%
	//list.jsp에서 get방식으로 이동
	//=> http://192.168.0.100:9090/herbmall/board/detail.jsp?no=2
	//1
	String no=request.getParameter("ntNo");
	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="noticeList.jsp";
		</script>
		
	<%	return;
	}
	
	//2
	noticeDAO dao=new noticeDAO();
	noticeVO vo=null;
	try{
		vo=dao.selectByNo(Integer.parseInt(no));	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content=vo.getNtContent();
	if(content!=null && !content.isEmpty()){
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
%>    
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>디테일</title>
 <link rel="stylesheet" href="../css/noticeDetail.css">

</head>
<body>
	<h2></h2>
	<div class="divForm">
	<div class="center">
        	<a href='noticeList.jsp' class="ntc">공지사항</a>			
		</div>
	
		<div class="firstDiv">
			<span class="op">제목</span> <span class="info"><%=vo.getNtTitle() %></span>
		</div>
		<div>
			<span class="op">등록일</span> <span class="info"><%=vo.getNtRegdate()%></span>
		</div>
		<div>
			<span class="op">조회수</span> <span class="info"><%=vo.getNtNum() %></span>
		</div>
		<div class="lastDiv">			
			<p class="content"><%=content %></p>
		</div>
		
	</div>
	
</body>
</html>
<%@ include file="../inc/footer.jsp"%>