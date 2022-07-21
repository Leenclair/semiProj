<%@page import="com.melon.mymusic.model.SMemDAO"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register2_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memService" class="com.melon.login.model.MemberService"
 scope="session"></jsp:useBean>
<jsp:useBean id="dto" class="com.melon.login.model.memberDTO"
 scope="page"></jsp:useBean>
<%	
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String nickname=request.getParameter("nickname");
	
	dto.setUserid(userid);
	dto.setPwd(pwd);
	dto.setName(name);
	dto.setNickname(nickname);
	SMemDAO sdao= new SMemDAO();
	
	//2
	String msg="회원가입 실패",url="register.jsp";
	try{
		int cnt=memService.insertMember(dto);

		if(cnt>0){
			msg="회원가입 완료";
			url="../inc/main.jsp";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>

</body>
</html>