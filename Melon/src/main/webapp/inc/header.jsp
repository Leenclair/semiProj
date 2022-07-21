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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Melon::음악이 필요한 순간, 멜론 </title>
  <!-- css -->
  <link rel="stylesheet" href="../css/main-style.css">
<title>Insert title here</title>
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
            <%=t_nickname%>님 안녕하세요</a> </li>
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
              <form name="frmSearch" method="post" action='../reply/searchList.jsp'>
              <input type="text" id="searchInput" name="searchInput" title="검색 입력 편집창" autocomplete="off"
              style="margin-top: 0px !important; position: relative; bottom: 10px;">
              <input type="image" src="../img/search.jpg" value="검색" >
              <i class="fas fa-search"></i>
              </form>
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
            <li> <a href="../starpost/list.jsp"><span>스타포스트</span></a> </li>
          </ul>

          <ul class="menu_right">
            <li><a class="myMusic" href="../mymusic/PlayList.jsp"> <span>플레이리스트</span> </a></li>
          </ul>

        </nav>

      </nav>
    </div>
  </header>
