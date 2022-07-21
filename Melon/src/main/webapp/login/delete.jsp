<%@page import="com.melon.login.model.MemberService"%>
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
<style>
.bg-light {
    background-color: #ffffff!important;
    height: 685px;
}
.btn-primary {
    color: #fff;
    background-color: #00cc3b;
    border-color: #00cc3b;
}

</style>
<script type="text/javascript">
<script type="text/javascript"
	src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmdelete]').submit(function(){
			if(confirm('삭제하시겠습니까?')){
				if($('#pwd').val().length<1){
					alert('비번 입력');
					$('#pwd').focus();
					event.preventDefault();
				}
			}else{
				event.preventDefault();
			}						
		});
	});
</script>
<section class="bg-light">
	<div class="container py-4">
		<div class="row align-items-center justify-content-between">
			<a class="navbar-brand h1 text-center" href="../inc/main.jsp"> <span
				class="text-dark h4">회원탈퇴</span>
			</a>
		</div>
		<form name="frmdelete" method="post" action="delete_ok.jsp">
			<div class="form-group">
				<label for="userid" class="form-label mt-4">아이디</label> 
				
				<span  class="form-control" id="userid" 
					aria-describedby="emailHelp"><%=dto.getUserid() %> 
				</span>
			</div>
			<div class="form-group has-success">
				<label class="form-label mt-4" for="pwd">비밀번호</label> <input
					type="password" class="form-control" id="pwd" name="pwd">
				<div class="valid-feedback"></div>
			</div>
			<div class="d-grid gap-2">
				<button class="btn btn-primary btn-lg" type="submit">회원탈퇴</button>
				<a class="btn btn-primary btn-lg" href="../inc/main.jsp" >취소</a>
			</div>
			</form>
		</div>
		</section>
		

<%@ include file="../inc/footer.jsp"%>
