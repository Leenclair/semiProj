<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <li> <a href="#" title="공지사항"> 회원님 안녕하세요 뜨는 칸 </a> </li>
          </ul>
        </nav>
      </nav>
      <!-- 로고, 검색창 -->
      <nav class="menu">
        <nav class="menu_top">

          <a href="main.jsp" title="MelOn 로고 - 홈으로 이동">
            <img src="../img/melonLogo.JPG">
          </a>

          <div class="inputfield">
            <div class="inputDesign">
              <input type="text" id="searchInput" title="검색 입력 편집창" autocomplete="off">
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
            <li> <a><span>매거진</span></a> </li>
          </ul>

          <ul class="menu_right">
            <li><a class="myMusic"> <span>마이뮤직</span> </a></li>
          </ul>

        </nav>

      </nav>
    </div>
  </header>
