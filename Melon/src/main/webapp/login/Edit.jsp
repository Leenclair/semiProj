<%@page import="com.melon.login.model.MemberService"%>
<%@page import="com.melon.login.model.memberDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.melon.login.model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/register.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<%
	String userid=(String)session.getAttribute("userid");
	
	memberDTO dto=null;
	MemberService memService=new MemberService();
	
	try{
		dto=memService.selectByUserid(userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<script type="text/javascript"
src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	 $('form[name=frm1]').submit(function(){  	 	 
    if($("#pwd").val().length<1) {
       alert("비밀번호를 입력하세요");
       $("#pwd").focus();
       event.preventDefault();
    }else if($("#pwd").val()!=$("#pwd2").val()) {
       alert("비밀번호가 일치하지 않습니다.");
       $("#pwd2").focus();
       event.preventDefault(); 
    }else if($('#chkId1').val()!='Y'){
		alert("닉네임 중복확인해야 합니다");
       $("#btnChknick").focus();
       event.preventDefault();		 		 
	 }
	 
});
	
	$('#btnChknick').click(function(){
	 	var nick = $("#nickname").val();
    	window.open("checknicklname.jsp?nickname="+nick,"chk",
   	"width=400,height=300, location=yes,resizable=yes,top=100,left=50");
 });
 
});






</script>
<style>
.bg-light {
    background-color: #ffffff!important;
}

* {
    margin: 3px;
    padding: 0px;
    box-sizing: border-box;
    letter-spacing: 0;
}

.bg-light{
	height: 1345px;
	padding-top: 55px;
	padding-bottom: 75px;
	background-color: #ffffff!important;
}
label {
    margin-bottom: 0.5rem;
    display: block;
}

input#hp2 {
    display: inline-block;
    width: 177px;
}

input#hp3 {
    display: inline-block;
    width: 203px;
}
input#birth1 {
    display: inline-block;
    width: 189px;
}
input#birth3 {
    display: inline-block;
    width: 216px;
}
span.text-dark.h4 {
    margin-left: 200px;
}
.btn-primary {
    color: #fff;
    background-color: #00cc3b;
    border-color: #00cc3b;
}
</style>

<section class="bg-light">
	<div class="container py-4">
		<div class="row align-items-center justify-content-between">
			<a class="navbar-brand h1 text-center" href="../inc/main.jsp"> <span
				class="text-dark h4">회원수정</span>
			</a>
		</div>
		<form name="frm1" method="post" action="Edit_ok.jsp">
			<div class="form-group">
				<label for="userid" class="form-label mt-4" >아이디</label> 
				<span  class="form-control" id="userid" 
					aria-describedby="emailHelp" ><%=dto.getUserid() %>
				</span>
			</div>
			<div class="form-group has-success">
				<label class="form-label mt-4" for="pwd">비밀번호</label> <input
					type="password" class="form-control" id="pwd" name="pwd">
				<div class="valid-feedback"></div>
			</div>

			<div class="form-group has-danger">
				<label class="form-label mt-4" for="pwd2">비밀번호 재확인</label> <input
					type="password" class="form-control" id="pwd2"
					name="pwd2">
			</div>
			<div class="form-group">
				<label for="name" class="form-label mt-4">이름</label> 
				<span  class="form-control" id="name" 
					aria-describedby="emailHelp"><%=dto.getName() %>
				</span>
			</div>

			<div class="form-group">
				<label for="nickname" class="form-label mt-4">닉네임</label> <input
					type="text" class="form-control" id="nickname" name="nickname"
					aria-describedby="emailHelp">
					<input type="button"
					value="중복확인" id="btnChknick" title="새창열림">
			</div>

			
			<div class="d-grid gap-2">
				<button class="btn btn-primary btn-lg" type="submit">수정하기</button>
			</div>
			
			<input type ="text" name="chkId1" id="chkId1">
		</form>
	</div>

</section>
<%@ include file="../inc/footer.jsp"%>
