<%@page import="com.melon.song.model.SongVO"%>
<%@page import="com.melon.song.model.SongDAO"%>
<%@page import="com.melon.common.Utility"%>
<%@page import="com.melon.common.PagingVO"%>
<%@page import="com.melon.reply.model.ReplyVO"%>
<%@page import="com.melon.reply.model.ReplyDAO"%>
<%@page import="com.melon.album.model.AlbumVO"%>
<%@page import="com.melon.album.model.AlbumDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
	<link rel="stylesheet" href="../css/main-style.css">
<%
if(t_nickname==null) t_nickname="";
	//요청파라미터 받아오기
	request.setCharacterEncoding("utf-8");
	String sno=request.getParameter("no");
	
	//String sno="2";
	
	//db작업
	AlbumDAO dao= new AlbumDAO();
	AlbumVO vo= new AlbumVO();
	try{
		vo=dao.showAlbumByNo(Integer.parseInt(sno));
	}catch(SQLException e){
		e.printStackTrace();
	}
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");	
	
	ReplyDAO dao2=new ReplyDAO();
		
	List<ReplyVO> list=null;
	try{
		list=dao2.selectAll(condition, keyword, Integer.parseInt(sno));	
	}catch(SQLException e){
		e.printStackTrace();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	if(keyword==null) keyword="";
	
	//페이징 처리
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}
	int totalRecord=list.size();  //총레코드 수
	int pageSize=20; //한 페이지에 보여줄 레코드 수
	int blockSize=5; //한 블럭에 보여줄 페이지 수

	PagingVO pageVo
		=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
	
	SongDAO sDao = new SongDAO();
	SongVO sVo = new SongVO();
	List<SongVO> alist= null;
	try{
		alist=sDao.selectByNumber(Integer.parseInt(sno));
	}catch(SQLException e){
		e.printStackTrace();
	} 

	
%>
<style type="text/css">
table{
 border: 1px solid gray;
 border-collapse: collapse;
 border-left: none;
 border-right: none;
 }
.tb_list{
	border-bottom:2px solid #80ba00
}

 .menu a{
 	cusor:pointer;
 }
 .menu .hide{
 	display:none;
 }
</style>

<script type="text/javascript" src="jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("a[name='trigger']").toggle(function() {
			$(this).closest("tr").next().show();
		}, function() {
			$(this).closest("tr").next().hide();
		});
	});

</script>
	<section style="width:1008px; margin: auto; padding-top:30px;">
	<h1>앨범 상세보기</h1>
	
	<div class="divForm" style="width:1008px; margin: auto; padding-top:30px; position: relative;">
		<!--앨범 정보   -->
		<div class="Div2" >
			<div style="margin-bottom: 20px; display: inline-block;">
				<span class="sp1">
				<!-- <img src="../img/albumImg/melomans.jpg"> -->
				<img src="<%=vo.getImgpath()+vo.getImg() %> ">
				</span>
			</div>
			<div style="display: inline-block; position: absolute; top: 50%; transform: translateY(-50%);padding-left: 45px; font-size: 18px;">
			<div style="margin-bottom: 15px;">
				<span class="sp1" style="font-weight: bold;">앨범번호 :</span> <span><%=sno%></span>
			</div>
			<div style="margin-bottom: 15px;">
				<span class="sp1" style="font-weight: bold;">앨범명 :</span> <span><%=vo.getAname()%></span>
			</div>
			<div style="margin-bottom: 15px;">
				<span class="sp1" style="font-weight: bold;">발매일 :</span> <span><%=sdf.format(vo.getOndate())%></span>
			</div>
			<div style="margin-bottom: 15px;">
				<span class="sp1" style="font-weight: bold;">장르 :</span> <span><%=vo.getGenre()%></span>
			</div>
			<div style="margin-bottom: 15px;">
				<span class="sp1" style="font-weight: bold;">발매사 :</span> <span><%=vo.getAgency()%></span>
			</div>
			<div>
				<span class="sp1" style="font-weight: bold;">기획사 :</span> <span><%=vo.getAcomp()%></span>
			</div>
			
		</div>
		</div>
	</div>
	<div style="width:1008px; margin: auto;   margin-bottom:20px; font-size: 19px; color: gray;">
	<%=vo.getInfo() %>
	<br>
	</div>
	<div style="padding-top:5px; margin-bottom:15px;">
	<h3 style="text-align: left; font-size: 20px; ">수록곡<span style="color: #80ba00;">(<%=alist.size() %>)</span></h3>
	</div>
         <div>
		<table border="1" style="width:1008px; text-align:center; margin:auto; margin-bottom:30px;">
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
				<%for(int i=0;i<alist.size();i++){
					sVo=alist.get(i);%>
				<tr>
					<td colspan="2"><%=sVo.getsNo() %></td>
					<td colspan="2"> 
						<!-- <audio controls src="../aud/MYX.mp3"></audio> -->
					<audio controls src="<%=sVo.getSmp3path()%><%=sVo.getSmp3()%>">
					</audio></td>
					<td><p style="font-weight: bold;"><%=sVo.getsTitle() %></p></td>
					<td><p style="font-weight: bold; color: #80ba00;"><%=sVo.getsArtist() %></p></td>
					<td><p><%=sVo.getsAlbum() %></p></td>
					<td><p><img src='../images/likebtn.jpg'></p></td>
					<td><p><img src='../images/mvbtn.jpg'></p></td>
					<td><p><img src='../images/downbtn.jpg'></p></td>
				</tr>
				<%}//for %>
		</table>
	</div>		 
	<!-- 댓글 시작부분 -->

<div style="width:1008px; margin: auto; padding-top:30px;">
	<div class="reply_title">
		<h3 style="text-align: left; font-size: 25px; margin-bottom:20px; ">댓글</h3>
	</div>
	<div class="section2" style="text-align: center; border: 1px solid #a3a3a3; border-radius: 13px; height: 150px; 
							padding: 10px 0px; margin-bottom: 40px; background-color: #f1eff5;">
		<form action="Reply_ok.jsp" name="replyform" method="post">
			<input type="hidden" name="album_num" value="<%=sno %>" style="height: 0px;"/> 
			<input type="hidden" name="reply_num" value="댓글번호" style="height: 0px;" /> 
			<input type="hidden" name="reply_userid" value="로그인아이디" style="height: 0px;" /> 
			<div style="display: inline-block; width:110px;">
				<div style="font-weight: bold"><p><%=t_nickname %></p></div>
			</div>
			<div style="display: inline-block;">
				<input type="text" size="200" name="contents"
				style="width: 700px; height: 125px; border-radius: 8px;" 
				placeholder=" *게시물의 저작권 등 분쟁, 개인정보 노출로 인한 책임은 작성자 또는 게시자에게 있음을 유의해주세요."
				required> 
			</div>
			<div style="display: inline-block;">
				<input type="submit" value="등록"  style=" width: 120px; height:125px; border-radius: 8px;"/>
			</div>
		</form>
	</div>
	<div class="divList" style="margin-bottom: 10px;">
	<form action="ReplyEdit.jsp" name="replyEdit" method="post">
	<div style="margin-bottom:5px;">
		<div style="display: inline-block;">
	<% if(keyword!=null && !keyword.isEmpty()){ %>
		<p>
			<span style="color: #80ba00; font-weight: bold; ">'<%=keyword %>'</span> 검색결과 총<span style="color: #80ba00; font-weight: bold;"> <%=list.size() %></span>개
		</p>
	<%}else{%>
			<p>총<span style="color:#80ba00; font-weight: bold">&nbsp;&nbsp;<%=list.size() %></span>&nbsp; 개</p>
		<%} %>	
		</div>
		<div style="display: inline-block; float: right;">
			<a href=albumDetail.jsp?no=<%=sno%>>최신순</a> |
	       	<a href=#>추천순</a>
		</div>
	</div>
		<table class="box2" width="1000px;" style="margin:auto;">
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 40%;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="tb_list">작성자</th>
					<th scope="col" class="tb_list">내용</th>
					<th scope="col" class="tb_list">시간</th>
					<th scope="col" class="tb_list">추천수</th>
					<th scope="col" class="tb_list">비추천수</th>
					<th scope="col" class="tb_list"></th>
				</tr>
			</thead>
			<tbody>
			<%
			if(list.isEmpty()){ %>
		<tr>
			<td colspan="6" class="align_center" style="text-align: center; font-weight: bold; height: 100px; ">등록된 글이 없습니다.</td>
		</tr>
	<%}else{ %>	
	  <!--댓글 내용 반복문 시작  -->
	    <%
	  int num =pageVo.getNum();
	  int curPos =pageVo.getCurPos();
	  
	  for(int i=0;i<pageVo.getPageSize();i++){
		  	if(num-- <1) break;
		  	
	  		ReplyVO vo2 = list.get(curPos++);
	  %>	
		<tr style="text-align: center; display: table-row;">
			<td style="font-weight: bold "><%=vo2.getUserid() %></td>
			<td style="text-align: left; padding-left: 10px;"><%=Utility.displayNew(vo2.getRegdate()) + vo2.getContents() %></td>
			<td style="font-weight: bold; "><%=Utility.checkTime(vo2.getRegdate()) %></td>
			<td><a href=#><img src='../images/up.jpg'></a>  <%= vo2.getUp() %></td>
			<td><a href=#><img src='../images/down.jpg'></a>  <%= vo2.getDown() %></td>	
			
			<!--로그인 하지 않았을 때, 다른아이디 접속시 수정 삭제버튼 숨김,   -->
			<%if(t_nickname!=null && vo2.getUserid().equals(t_nickname)){%>
			<td>
			<a href=# name="trigger">수정 |</a>
			<a href='ReplyDelete.jsp?no=<%=vo2.getNo()%>&userid=<%=vo2.getUserid()%>&album_num=<%=vo2.getAlbumNo()%>'>삭제</a></td>	
				
			<%}%>
		</tr>
		
		<tr class="hide" style="text-align: center; display: none;">
			<td></td>
			<td colspan="4">	
				<input type="text" size="100" name="contents" id="i" placeholder=" *댓글수정란 입니다" style="border-radius: 4px;" >
			</td>
			<td>
				<input type="hidden" name="no" value=<%=vo2.getNo()%>>
				<input type="hidden" name="userid" value=<%=vo2.getUserid() %>>
				<input type="hidden" name="album_num" value=<%=vo2.getAlbumNo() %>>
				<input type="submit" value="수정" />
			</td>
		</tr> 
		
	  <%}//for %>	 
	  <!-- 댓글 내용 반복처리 끝  -->
	 <%}//if %> 	
			</tbody>
		</table>
		</form>
	</div>
	<div class="divPage" style=" text-align:center; margin-bottom:10px;">
	<!-- 이전블럭으로 이동 -->
	<%
		if(pageVo.getFirstPage()>1){ %>
			<a href='albumDetail.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				이전 
			</a>	
	<%	} %>
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
			if(i>pageVo.getTotalPage()) break;  
			
			if(i==currentPage){	%>
				<span style="color: #80ba00;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href
	='albumDetail.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
					[<%=i %>]</a>
			<%} %>		
	<%	} %>
	<!--  페이지 번호 끝 -->
	<!-- 다음 블럭으로 이동 -->
	<%
		if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<a href='albumDetail.jsp?currentPage=<%=pageVo.getLastPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				다음
			</a>	
	<%	} %>
	</div>
	<div class="divSearch" style=" text-align:center; margin-bottom: 10px;">
		<form name="frmSearch" method="post" action='albumDetail.jsp?no=<%=sno%>'>
			<select name="searchCondition">
				<option value="contents" <% if("contents".equals(condition)){ %> 
					selected="selected" <%} %>>내용</option>
				<option value="userid" <% if("userid".equals(condition)){ %>
					 selected="selected" <%} %> >작성자</option>
			</select> 
			<input type="text" name="searchKeyword" title="검색어 입력" value="<%=keyword%>"> 
			<input type="submit" value="검색">
		</form>
	</div>
</div>
	</div>
	</section>
<%@ include file="../inc/footer.jsp"%>