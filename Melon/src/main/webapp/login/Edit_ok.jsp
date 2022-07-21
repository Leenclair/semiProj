<%@page import="com.melon.login.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberEdit_ok.jsp</title>
</head>
<body>

<jsp:useBean id="memService" class="com.melon.login.model.MemberService"
   scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.melon.login.model.memberDTO"
   scope="page"></jsp:useBean>
<%
 
   request.setCharacterEncoding("utf-8");
   String userid=(String)session.getAttribute("userid");

   String pwd=request.getParameter("pwd");
   String nickname=request.getParameter("nickname");
  
   String msg="빈 곳을 입력하세요", url="Edit.jsp";
   try{      
      int result=memService.checklogin(userid, pwd);
      if(result==MemberService.LOGIN_OK){
         memVo.setUserid(userid);
         memVo.setPwd(pwd);
         memVo.setNickname(nickname);
         
         

         
         int cnt=memService.update(memVo);
         if(cnt>0){            
            msg="회원정보가 수정되었습니다.";  
            session.setAttribute("nickname", memVo.getNickname());
         }else{
            msg="회원수정 실패";            
         }
      }else if(result==MemberService.DISAGREE_PWD){
         msg="비밀번호 불일치";
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