<%@page import="com.melon.starpost.model.spLikeDAO"%>
<%@page import="com.melon.starpost.model.spLikeService"%>
<%@page import="com.melon.starpost.model.spLikeVO"%>
<%@page import="com.melon.common.PagingVO"%>
<%@page import="com.melon.starpost.model.starpostVO"%>
<%@page import="com.melon.starpost.model.starpostService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean t_login=false;
	String t_userid=(String)session.getAttribute("userid");
	String t_nickname=(String)session.getAttribute("nickname");
	String t_username=(String)session.getAttribute("userName");
	
	
	if(t_userid!=null && !t_userid.isEmpty()){
		t_login=true;
	}
%>


<%
	starpostService service = new starpostService();
	List<starpostVO> list=null;
	try{			
		list=service.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//페이징 처리
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//현재 페이지 무관한 변수
	int totalRecord=list.size();
	int pageSize=5;
	int blockSize=5;
	
	PagingVO pageVo=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title> Melon::음악이 필요한 순간, 멜론 </title>
  <!-- css -->
  <link rel="stylesheet" href="../css/main-style.css">
<title>Insert title here</title>
<style type="text/css">
.magazineList {margin: auto;width: 1000px;}
	table{
		width:1000px;
		border:1px solid black;
	}
	.maintable img {width: 350px;height: 200px;}

#tr1 th:nth-child(2) {width: 310px;height: 200px;}

#tr1 th:first-child {font-size: 50px;}

#tr2:hover{
cursor:pointer;
background:#eee;
}

table.maintable {padding: 10px 10px 10px 0px;}

.magazinePage {margin: auto;text-align: center;}
</style>
</head>
<body>
<!-- header -->
  <header class="header">
    <div class="header_inner">
      <!-- header 최상단부 -->
      <nav class="top_menu">
        <nav class="top_right">
          <ul>
          	<%if(t_login){ %>
            <li> <a href="#" title="공지사항">
            <%=t_username%>님 안녕하세요</a> </li>
            <%}else{ %>
            <li> <a href="../login/login.jsp" title="공지사항">로그인이 필요합니다 </a> </li>           
            <%} %>
          </ul>
        </nav>
      </nav>
      <!-- 로고, 검색창 -->
      <nav class="menu">
        <nav class="menu_top">

          <a href="../inc/main.jsp" title="MelOn 로고 - 홈으로 이동">
            <img src="../img/melonLogo.JPG">
          </a>

          <div class="inputfield">
            <div class="inputDesign">
              <input type="text" id="searchInput" title="검색 입력 편집창" autocomplete="off"
              	style="margin-top: 0px !important; position: relative; bottom: 10px;">
              <a href="#"><img src="../img/search.jpg" title="검색"></a>
              <i class="fas fa-search"></i>
            </div>
          </div>

          

          <!-- 우측상단 배너 -->
          <aside class="cmn_banner">
            <img src="../img/slideBannerImg1.JPG" title="믿고 듣는 보컬 퀸, 태연 - 페이지이동">
          </aside>

        </nav>
        <!-- 메뉴바 -->
        <nav class="menubar">

          <ul class="menu_left">
            <li> <a><span>멜론차트</span></a> </li>
            <li> <a><span>최신음악</span></a> </li>
            <li> <a href="list.jsp"><span>스타포스트</span></a> </li>
          </ul>

          <ul class="menu_right">
            <li><a class="myMusic" href="../mymusic/PlayList.jsp"> <span>플레이리스트</span> </a></li>
          </ul>

        </nav>

      </nav>
    </div>
  </header>
  <!-- header 끝 -->

<div class="magazineList">
<h1>NOW list</h1>
<hr>
<h2>오늘의 인기ㅣ <span>아티스트들의 최신 소식을 실시간으로 확인하세요.</span></h2>
	<table class="maintable">
	<%
	int num=pageVo.getNum();//시작 글번호
		int curPos=pageVo.getCurPos();
		
		for(int i=0;i<pageVo.getPageSize();i++){
			if(num--<1) break;
			
			starpostVO vo=list.get(curPos++);
	%>
		<tr id="tr1">
			<th rowspan="2" ><%=vo.getNo() %></th>
			<th rowspan="3" ><image src="<%=vo.getFileName()%>"></th>
		</tr>
		<tr id="tr2" onclick="location.href='detail.jsp?no=<%=vo.getNo()%>'">
			<th><%=vo.getContent() %></th>
		</tr>
		<tr id="tr3">
			<th><%=sdf.format(vo.getRegdate()) %></th>
			<%
				spLikeService spLikeService = new spLikeService();
				spLikeDAO spLikeDao = new spLikeDAO();
				spLikeVO spLikeVo=null;
				try{
					spLikeVo=spLikeDao.selectByNo(vo.getNo());
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
			<th><a href="spLike.jsp?spNo=<%=vo.getNo()%>">좋아요</a><span><%=spLikeVo.getSpLike() %></span></th>
		</tr>
		<%} %>
	</table>
</div>
<div class="magazinePage">
<!-- 이전블럭으로 이동 -->
	<%
		if(pageVo.getFirstPage()>1){ %>
			<a href
='list.jsp?currentPage=<%=pageVo.getFirstPage()-1%>'>
				<img src='../img/first.JPG'>
			</a>	
	<%	} %>

	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
			if(i>pageVo.getTotalPage()) break;  
			
			if(i==pageVo.getCurrentPage()){%>
				<span style="color: blue;font-weight: bold;font-size: 1em"><%=i %></span>
			<%}else{ %>
			<a href
='list.jsp?currentPage=<%=i%>'>
				[<%=i %>]</a>	
			<%} %>
	<%	} %>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<%
		if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<a href
='list.jsp?currentPage=<%=pageVo.getLastPage()+1%>'>
				<img src='../img/last.JPG'>
			</a>	
	<%	} %>
</div>
</body>
</html>
<%@ include file="../inc/footer.jsp"%>