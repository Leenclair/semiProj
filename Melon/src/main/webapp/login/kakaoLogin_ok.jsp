<%@page import="com.melon.login.model.memberDTO"%>
<%@page import="com.melon.login.model.MemberService"%>
<%@page import="com.melon.login.model.memberDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String userid=request.getParameter("nick");
    System.out.println(userid);
    String name=request.getParameter("nick");
    System.out.println(name);
	String pwd="1234";
	String nickname=request.getParameter("nick");
	String img=request.getParameter("img");
	
	session.setAttribute("userid", userid);
	session.setAttribute("userName", userid);
	session.setAttribute("nickname", userid);

	session.setAttribute("loginType","kakao");
	memberDAO dao = new memberDAO();
	try{
		int result=dao.checklogin(userid, pwd);
		
		if(result==MemberService.NONE_USERID){
			memberDTO vo = new memberDTO();
			vo.setUserid(userid);
			vo.setName(name);
			vo.setNickname(nickname);
			vo.setPwd(pwd);
			dao.insertMember(vo);
			
			vo = dao.selectByUserid(userid);
			session.setAttribute("curMemVo", vo);
			
		}else{
			memberDTO vo = dao.selectByUserid(userid);
			session.setAttribute("curMemVo", vo);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String msg=userid+"님, 로그인되었습니다" , url="../inc/main.jsp";
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
    
    %>
    <jsp:forward page="../common/message.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>