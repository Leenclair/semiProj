<%@page import="com.melon.notice.model.noticeDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
<%	
	//list.jsp에서 제목 클릭하면 get방식으로 이동
	//=> http://localhost:9090/herbmall/board/countUpdate.jsp?no=6
	//1
	String ntNo=request.getParameter("ntNo");
	if(ntNo==null || ntNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list.jsp";
		</script>
	
		<%	return;
	}
	
	//2
	noticeDAO dao = new noticeDAO();
	
	try{
		int cnt=dao.updateCount(Integer.parseInt(ntNo));
		//3
		if(cnt>0){
			response.sendRedirect("noticeDetail.jsp?ntNo="+ntNo);
		}else{%>
			<script type="text/javascript">
				alert("조회수 증가 실패!");
				history.back();
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>