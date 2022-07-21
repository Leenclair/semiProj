<%@page import="com.melon.common.PagingVO"%>
<%@page import="com.melon.song.model.SongVO"%>
<%@page import="com.melon.song.model.SongDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String searchInput=request.getParameter("searchInput");
	
	SongDAO dao=new SongDAO();
	List<SongVO> list=null;
	
	
	try{
		list=dao.selectAll(searchInput);	
	}catch(SQLException e){
		e.printStackTrace();
	}
	if(searchInput==null) searchInput="";
	
	//페이징 처리
		int currentPage=1;
		
		if(request.getParameter("currentPage")!=null){
			currentPage=Integer.parseInt((request.getParameter("currentPage")));
		}
		int totalRecord=list.size();  //총레코드 수
		int pageSize=10; //한 페이지에 보여줄 레코드 수
		int blockSize=5; //한 블럭에 보여줄 페이지 수

		PagingVO pageVo
			=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
table{
 border: 1px solid gray;
 border-collapse: collapse;
 border-left: none;
 border-right: none;
 }
.tb_list{
	border-bottom:1px solid #80ba00
}
</style>
</head>
<body>
<div>
	<div style="width:1200px; margin:auto; padding-top: 60px;">
		<p>
			<span style="color: #80ba00;">'<%=searchInput%> '</span> 에 대한 검색 결과 입니다
		</p>
	</div>
	<br>
	<div style="width:1200px; margin:auto;">
	<p><strong>곡 명으로 검색(<%=list.size() %>)</strong></p>
	<br>
	</div>
	<div>
		<table border="1" style="width:1200px; text-align:center; margin:auto; margin-bottom: 80px;">
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 35%;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 5%;" />
				<col style="width: 5%;" />
			</colgroup>
			<thead>
				<tr style="color:#80ba00;">
					<th colspan="2" scope="col" class="tb_list">No</th>
					<th colspan="2" scope="col" class="tb_list"></th>
					<th scope="col" class="tb_list">곡명</th>
					<th scope="col" class="tb_list">아티스트</th>
					<th scope="col" class="tb_list">앨범</th>
					<th scope="col" class="tb_list">좋아요</th>
					<th scope="col" class="tb_list">뮤비</th>
					<th scope="col" class="tb_list">다운</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(list.isEmpty()){ %>
		<tr>
			<td colspan="10" class="align_center" style="text-align: center;font-weight: 600; height: 60px;"><%=searchInput%>에 대한 검색 결과가 없습니다.</td>
		</tr>
	<%}else{ %>	
	  <!--곡명 검색시 곡 목록 반복문 시작-->
	    <%
	  int num =pageVo.getNum();
	  int curPos =pageVo.getCurPos();
	  
	  for(int i=0;i<pageVo.getPageSize();i++){
		  	if(num-- <1) break;
		  	
	  		SongVO vo = list.get(curPos++);
	  %>
				<tr>
					<td colspan="2"><%=vo.getsNo() %></td>
					<td colspan="2"> 
						<!-- <audio controls src="../aud/MYX.mp3"></audio> -->
					<audio controls src="<%=vo.getSmp3path()%><%=vo.getSmp3()%>">
					</audio></td>
					<td><a href=#><%=vo.getsTitle() %></a></td>
					<td><a href=#><%=vo.getsArtist() %></a></td>
					<td><a href=#><%=vo.getsAlbum() %></a></td>
					<td><a href=#><img src='../images/likebtn.jpg'></a></td>
					<td><a href=#><img src='../images/mvbtn.jpg'></a></td>
					<td><a href=#><img src='../images/downbtn.jpg'></a></td>
				</tr>
				<%}//for %>	 
	  <!--곡명 검색시 곡 목록 반복문 시작-->
	 <%}//if %>	
			</tbody>
		</table>
	</div>
	

	<%
	List<SongVO> list2=null;
	
	try{
		list2=dao.selectAll2(searchInput);	
	}catch(SQLException e){
		e.printStackTrace();
	}
	//페이징 처리
			int currentPage2=1;
			
			if(request.getParameter("currentPage2")!=null){
				currentPage2=Integer.parseInt((request.getParameter("currentPage2")));
			}
			int totalRecord2=list2.size();
			int pageSize2=10; 
			int blockSize2=5;

			PagingVO pageVo2
				=new PagingVO(currentPage2, totalRecord2, pageSize2, blockSize2);
	%>
	
	<div style="width:1200px; margin:auto;">
		<p>
			<span style="color: #80ba00;">'<%=searchInput%> '</span> 에 대한 검색 결과 입니다
		</p>
	</div>
	<br>
	<div style="width:1200px; margin:auto;">
	<p><strong>가수 명으로 검색(<%=list2.size() %>)</strong></p>
	<br>
	</div>
	<div>
		<table border="1" style="width:1200px; text-align:center; margin:auto; margin-bottom:30px;">
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 35%;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 5%;" />
				<col style="width: 5%;" />
			</colgroup>
			<thead>
				<tr style="color:#80ba00;">
					<th colspan="2" scope="col" class="tb_list">No</th>
					<th colspan="2" scope="col" class="tb_list"></th>
					<th scope="col" class="tb_list">곡명</th>
					<th scope="col" class="tb_list">아티스트</th>
					<th scope="col" class="tb_list">앨범</th>
					<th scope="col" class="tb_list">좋아요</th>
					<th scope="col" class="tb_list">뮤비</th>
					<th scope="col" class="tb_list">다운</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(list2.isEmpty()){ %>
		<tr>
			<td colspan="10" class="align_center" style="text-align: center;font-weight: 600; height: 40px;"><%=searchInput%>에 대한 검색 결과가 없습니다.</td>
		</tr>
	<%}else{ %>	
	  <!--가수명 검색시 곡 목록 반복문 시작  -->
	    <%
	  int num2 =pageVo2.getNum();
	  int curPos2 =pageVo2.getCurPos();
	  
	  for(int i=0;i<pageVo2.getPageSize();i++){
		  	if(num2-- <1) break;
		  	
	  		SongVO vo2 = list2.get(curPos2++);
	  		
	  %>
				<tr>
					<td colspan="2"><%=vo2.getsNo() %></td>
					<td colspan="2"> 
						<audio controls src="<%=vo2.getSmp3path()%><%=vo2.getSmp3()%>">
					</audio></td>
					<td style="font-weight: bold;"><p><%=vo2.getsTitle() %></p></td>
					<td style="font-weight: bold; color: #80ba00;"><p><%=vo2.getsArtist() %></p></td>
					<td><p><%=vo2.getsAlbum() %><p></td>
					<td><p><img src='../images/likebtn.jpg'></p></td>
					<td><p><img src='../images/mvbtn.jpg'></p></td>
					<td><p><img src='../images/downbtn.jpg'></p></td>
				</tr>
				<%}//for %>	 
	  <!--가수명 검색시 곡 목록 반복문 끝  -->
	 <%}//if %>	
			</tbody>
		</table>
	</div>		
</div>
</body>
</html>
<%@ include file="../inc/footer.jsp"%>