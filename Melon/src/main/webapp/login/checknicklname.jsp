<%@page import="com.melon.login.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="memService" class="com.melon.login.model.MemberService"
    scope="session"></jsp:useBean>
<%

	//1
	request.setCharacterEncoding("utf-8");
	String nickname=request.getParameter("nickname");
	//2
	int result=0;
	if(nickname != null && !nickname.isEmpty()){
		result=memService.duplicatenick(nickname);
	}
	//3
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css"/>
<script type="text/javascript"
src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#nickname').val('<%=nickname%>');
			$(opener.document).find('#chkId1').val('Y');
			
			self.close();		
		});
	})
</script>
</head>
<body>
<h2>아이디 중복 검사</h2><br>
<form name="frmId" method="post" action="checknicklname.jsp">
<input type="text" name="nickname" id="nickname" value="<%=nickname %>" 
	title="아이디입력">
<input type="submit" id="submit" value="닉네임 확인">

<%if(result==MemberService.UNUSABLE_ID){ %>
	<p>이미 등록된 닉네임입니다. 다른 닉네임을 입력하세요</p>
<%}else if(result==MemberService.USABLE_ID){ %>
	<input type="button" value="사용하기" id="btUse">
	<p>사용가능한 닉네임입니다. [사용하기]버튼을 클릭하세요</p>
<%} %>
</form>
</body>
</html>