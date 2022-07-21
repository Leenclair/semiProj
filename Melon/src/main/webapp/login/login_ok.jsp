<%@page import="java.nio.file.WatchKey"%>
<%@page import="com.melon.login.model.memberDTO"%>
<%@page import="com.melon.login.model.MemberService"%>
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
<jsp:useBean id="memService" class="com.melon.login.model.MemberService" 
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	
	String msg="로그인 실패",url="login.jsp";
	try{
		int cnt=memService.checklogin(userid, pwd);
		if(cnt==MemberService.LOGIN_OK){
			memberDTO dto=memService.selectByUserid(userid);
			
			session.setAttribute("userid", userid);		
			session.setAttribute("userName", dto.getName());
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("loginType", "normal");
			System.out.println(dto.getNickname());
			
			Cookie ck=new Cookie("ck_userid",userid);
			ck.setPath("/");
			
			msg=dto.getName()+"님, 로그인되었습니다";
			url="../inc/main.jsp";
		}else if(cnt==MemberService.DISAGREE_PWD){
			msg="비밀번호가 일치하지 않습니다";
		}else if(cnt==MemberService.NONE_USERID){
			msg="해당 아이디가 존재하지 않습니다";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>