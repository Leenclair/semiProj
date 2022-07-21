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
<!-- 카카오 스크립트 -->
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
 //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
	Kakao.init('bed8328e391cc9c4d3d42ea9fbf81c24');
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response);
        	  var id = response.id;
              var account = response.kakao_account;
   
              $('#form-kakao-login input[name=email]').val(account.email);
              $('#form-kakao-login input[name=nick]').val(account.profile.nickname);
              $('#form-kakao-login input[name=img]').val(account.profile.img);
              document.querySelector('#form-kakao-login').submit();
          }
        })
        console.log(authObj);
        var token = authObj.access_token;
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
};
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

  <!-- css -->
  <link rel="stylesheet" href="../css/main-style.css">
<title>Insert title here</title>
<style type="text/css">
div#asd {
    margin-top: -14px;
    display: block;
    margin-left: 196px;
}
button.ss {
    background-color: yellow;
}

.button_login {
    position: absolute;
    top: 28px;
    left: 720px;
    background: #fbfbfb;
    border: 1px solid rgb(209, 208, 208);
    width: 280px;
    height: 155px;
    padding: 17px 17px;
}
img.www {
    width: 67px;
    height: 65px;
}
.top_area {
    display: flex;
    margin-left: 9px;
    margin-top: 26px;
}
img.rr {
    width: 245px;
    height: 45px;
    margin-top: 4px;
}
div#tt {
    margin-left: -30px;
}
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

          <a href="main.jsp" title="MelOn 로고 - 홈으로 이동">
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

  <!-- main -->
  <main class="main">
    <!-- 최신 앨범 (상단 메인) -->
    <section class="new_album">
      <h2>최신 앨범 ></h2>
      <section class="section_na">
        <ul class="new_album_cate">
          <li class="category c1">전체</li>
        </ul>
      </section>

      <div style="clear: both;"></div>
      <!-- display : block -->
      <acticle class="outer">
        <article class="inner_list">
          <%String no="1"; %>
      
          <article style="position: relative;">
          <a href="../reply/albumDetail.jsp?no=<%=no%>">
            <div class="hover_div1">
              <h4 class="new_album_title">Midnight Guest</h4>
              <p class="new_album_artist">프로미스나인</p>
            </div>
            <img src="../img/promise9Album.JPG" class="new_album_img1">
          </a>
          </article>
          
       
          
          <%no="2"; %>
      
          <article style="position: relative;">
          <a href="../reply/albumDetail.jsp?no=<%=no%>">
            <div class="hover_div2">
              <h4 class="new_album_title">B</h4>
              <p class="new_album_artist">뱀뱀(BamBam)</p>
            </div>
            <img src="../img/baembaemAlbum.JPG" class="new_album_img1">
            </a>
          </article>
          
          
          <%no="3"; %>
      
          <article style="position: relative;">
          <a href="../reply/albumDetail.jsp?no=<%=no%>">
            <div class="hover_div3">
              <h4 class="new_album_title">Can't Control Myself</h4>
              <p class="new_album_artist">태연(TAEYEON)</p>
            </div>
            <img src="../img/taeyeonAlbum.JPG" class="new_album_img1">
            </a>
          </article>
          
          
          <%no="4"; %>
      
          <article style="position: relative;">
          <a href="../reply/albumDetail.jsp?no=<%=no%>">
            <div class="hover_div4">
              <h4 class="new_album_title">ˣ‿ˣ(SMiLEY)</h4>
              <p class="new_album_artist">YENA(최예나)</p>
            </div>
            <img src="../img/choiJenaAlbum.JPG" class="new_album_img1">
            </a>
          </article>
          
          
          <%no="5"; %>
      
          <article style="position: relative;">
          <a href="../reply/albumDetail.jsp?no=<%=no%>">
            <div class="hover_div5">
              <h4 class="new_album_title">일진에게 반했을 때 OST Part.2</h4>
              <p class="new_album_artist">원필(DAY6)</p>
            </div>
            <img src="../img/wonpilAlbum.JPG" class="new_album_img1">
            </a>
          </article>
          
          
          <%no="6"; %>
      
          <article style="position: relative;">
          <a href="../reply/albumDetail.jsp?no=<%=no%>">
            <div class="hover_div6">
              <h4 class="new_album_title">[REC.]</h4>
              <p class="new_album_artist">유주(YUJU)</p>
            </div>
            <img src="../img/yujuAlbum.JPG" class="new_album_img1">
            </a>
          </article>
          
        </article>

      </acticle>
      <!-- display : block -->
    </section>

   <!-- 이벤트 배너 -->
    <section class="event_list">
      <!-- 이벤트 이미지 -->
      <article class="event_inner">
        <article class="event_item event1">
        <%no="7"; %>
        <a href="../reply/albumDetail.jsp?no=<%=no%>">
          <img src="../img/event_kidmili.JPG" title="키드밀리">
        </article>
      </article>

    </section>
    <!-- 로그인  -->
   <aside class="button_login">
	  <%if(t_login){ %>	
      <div class="top_area" id="tt">
      <img src="../img/사람이미지.jpg" class="www">
        <a href="../login/logout.jsp" title="로그아웃 - 페이지 이동">로그아웃</a>
        <a href="../login/Edit.jsp" title="회원수정 - 페이지 이동">회원수정</a>
        <a href="../login/delete.jsp" title="회원탈퇴 - 페이지 이동">회원탈퇴</a>
        
      </div>
   	<%}else{ %>
      <a href="../login/login.jsp">
      <button>로그인</button>                   
      </a>
     <div class="aa" onclick="kakaoLogin();">
      			<a href="javascript:void(0)">
          			<img class="rr" src="../img/kakao_login.png">
      			</a>      			
	 </div>
				
      <div class="top_area" id="asd">
        <a href="../login/register.jsp" title="회원가입 - 페이지 이동"><br>회원가입</a>
      </div>
   	 <%} %>
    </aside>

    <!-- 콘서트 광고 배너 -->
    <aside class="ad_concert">
      <img src="../img/2dal_ticket.JPG" title="티켓(이달소)">
    </aside>

    <div style="clear: both;"></div>

    <!-- 인기있어요 (하단 메인)-->
    

    <!-- 멜론차트 -->
    

    <!-- 공지사항 -->
    <section class="notice">
	    <a href="#" title="공지사항">공지사항</a>
    </section>

  </main>

  <!-- footer -->
  <footer class="footer">
    <footer class="footer_inner">
      
      <!-- footer 메뉴 -->
      <article class="footer_menu">
        <ul>
          <li> <a href="../notice/noticeList.jsp"> 고객센터 </a> </li>
        </ul>
      </article>

      <!-- footer 정책 -->
      <article class="footer_policy">
        <li class="first_child">이용약관</li>
        <li><strong>위치기반서비스 이용약관</strong></li>
        <li><strong>개인정보처리방침</strong></li>
        <li>청소년보호정책</li>
        <li>제휴/프로모션문의</li>
        <li>이메일주소무단수집거부</li>
        <li>파트너센터</li>
      </article>

      <!-- footer 정보 -->
      <article class="footer_info">
        <li class="first"> <strong> (주)카카오엔터테인먼트 </strong> &nbsp 경기도 성남시 분당구 판교역로 221 </li>
        <li> 대표이사 : 이진수, 김성수 </li>
        <li> 사업자등록번호 : 220-88-02594 </li>
        <li> 통신판매업신고번호 : 2018-성남분당B-0004 <span class="info_check"> 사업자정보확인 </sapn>
        </li>
        <br>
        <li class="first"> 문의전화 : 1566-7727 (평일 09:00-18:00, 유료) </li>
        <li> 이메일 : <span class="email"> melon_info@kakaoent.com </span> </li>
        <li> 호스팅서비스사업자 : (주)카카오엔터테인먼트 </li>
        <li> <span class="corporation"> © Kakao Entertainment Corp. </span> </li>
      </article>

    </footer>
  </footer>
	<form id="form-kakao-login" method="post" action="../login/kakaoLogin_ok.jsp">
		<input type="hidden" name="email"/>
		<input type="hidden" name="nick"/>
		<input type="hidden" name="img"/>
	</form>
</body>
</html>