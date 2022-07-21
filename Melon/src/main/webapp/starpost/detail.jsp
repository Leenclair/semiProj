<%@page import="com.melon.starpost.model.starpostVO"%>
<%@page import="com.melon.starpost.model.starpostService"%>
<%@page import="com.melon.common.PagingVO"%>
<%@page import="com.melon.starpost.reply.model.ReplyVO"%>
<%@page import="com.melon.starpost.reply.model.ReplyService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%

//[1]list.jsp 에서 클릭으로 get방식으로 이돔
	//[2]detail.ok.jsp에서 get 방식으로 이동
	//1
	String spNo=request.getParameter("no"); 
	
	
	
	//2
	ReplyService replyService =new ReplyService();
	List<ReplyVO> list=null;
	
	
	try{
		list=replyService.selectAll(Integer.parseInt(spNo));
		System.out.println("list 결과"+list.size());
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//페이징 처리
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null&&!request.getParameter("currentPage").isEmpty()){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//현재 페이지 무관 변수
	int totalRecord = list.size();
	int pageSize=5;
	int blockSize=5;
	
	PagingVO pageVo=new PagingVO(currentPage,totalRecord,pageSize,blockSize);
	
	starpostService spService=new starpostService();
	starpostVO spVo=null;
	try{
		spVo=spService.selectByNo(Integer.parseInt(spNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("a[name='replyEdit']").toggle(function() {
		$(this).closest("tr").next().show();
	}, function() {
		$(this).closest("tr").next().hide();
	});
	
	$('#replyDel').click(function(){
		if(confirm('삭제하시겠습니까?')){
		}else{
			event.preventDefault();
		}
	});
	
	$('.replyForm').submit(function(){
		if($.trim($('#nickName').val()).length<1){
			alert("닉네임을 입력하세요");
			$('#nickName').focus();
			event.preventDefault();
		}else if($.trim($('#content').val()).length<1){
			alert("내용을 입력하세요");
			$('#content').focus();
			event.preventDefault();
		}
	});

});


</script>
</head>
<body>

<h1 align="center"><%=spVo.getTitle() %><span><button onclick="location.href='list.jsp'">돌아가기</button></span></h1>
<%
	if(spNo.equals(Integer.toString(spVo.getNo()))){%>
		<div align="center"><video controls poster="<%=spVo.getFileName()%>">
		  <source src="<%=spVo.getVideoRoot() %>" type="video/mp4">
		</video></div>
	<%}
%>
<div class="replyForm">
	<form name="replyWrite" method="post" action="detail_ok.jsp?no=<%=spNo%>">
		<fieldset align="center">
			<legend>댓글</legend>
				<span>
					<label for="id">아이디</label>
					<input type="text" id="userid" name="userid" value="<%=t_userid%>" readonly="readonly">
				</span>
				<span>
					<label for="nickName">닉네임</label>
					<input type="text" id="nickName" name="nickName">
				</span>
				<span>
					<label for="content">댓글</label>
					<input type="text" id="content" name="content">
				</span>
				<span>
					<input type="submit" value="등록">
				</span>
		</fieldset>
	</form>
</div>
<div class="spReplyList">
<form action="spReplyEdit.jsp" name="spReplyEdit" method="post">
		<table width="1000px;" style="margin:auto;">
		<tbody>
		<%if(list.isEmpty()){ %>
		<tr>
			<td colspan="4">댓글이 존재하지 않습니다.</td>
		</tr>
		<%}else{ %>
		<!-- 댓글 반복 시작 -->
		<%
		int num=pageVo.getNum();
		int curPos=pageVo.getCurPos();
		
		for(int i=0;i<pageVo.getPageSize();i++){
			if(num--<1) break;
			
			ReplyVO replyVo=list.get(curPos++);
		%>
		<tr>
			<td><%=replyVo.getNickname()%></td>
			<td><%=replyVo.getContent() %></td>
			<td><%=sdf.format(replyVo.getRegdate())%></td>
			<%
			if(t_userid.equals(replyVo.getUserid())){%>
			<td><a href=# name="replyEdit">수정 |</a> <a href="spReplyDelete_ok.jsp?replyNo=<%=replyVo.getNo()%>&spNo=<%=replyVo.getSpNo()%>">삭제</a></td>	
			<%} %>
		</tr>
		<tr class="hide" style="display: none;">
			<td></td>
			<td>	
				<input type="text" name="contents" placeholder="*댓글수정란 입니다" >
			</td>
			<td>
				<input type="hidden" name="replyNo" value="<%=replyVo.getNo()%>">
				<input type="hidden" name="spNo" value="<%=replyVo.getSpNo()%>">
				<input type="submit" value="수정" />
			</td>
			<td></td>
		</tr> 
			<%}//for %>
			<%}//if %>
			</tbody>
		</table>
</form>
</div>
<div class="divPage" align="center">
	<%
		if(pageVo.getFirstPage()>1){%>
		<a href="detail.jsp?no=<%=request.getParameter("no") %>&currentPage=<%=pageVo.getFirstPage()-1 %>">
		<img src="../img/first.JPG">
		</a>
		<%} %>
		<!-- 페이지 번호 -->
		<%
			for(int i=pageVo.getFirstPage();i<pageVo.getLastPage();i++){
				if(i>pageVo.getTotalPage()) break;
				
				if(i==currentPage){%>
			<span style="color: blue;font-size: 1em;font-weight: bold">
			<%=i %></span>
			
		<%}else{%>
		<a href
		='detail.jsp?no=<%=request.getParameter("no") %>&currentPage=<%=i %>'>[<%=i %>]</a>
		<%} %>
		<%} %>
		<!-- 페이징 처리 끝 -->
		<!-- 다음블럭으로 이동(페이지당 5페이지 블럭) -->
		<%
			if(pageVo.getLastPage()<pageVo.getTotalPage()){%>
			<a href='detail.jsp?no=<%=request.getParameter("no") %>&currentPage=<%=pageVo.getLastPage()+1 %>'>
				<img src="../img/last.JPG">
			</a>
		<%}%>
</div>
</body>
</html>
<%@ include file="../inc/footer.jsp"%>