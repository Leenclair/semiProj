# 국비학원 첫번째 팀프로젝트(음악 재생 사이트-멜론 클론 목표)

## 사용 버전

* Eclipse
* Java 17
* Tomcat v9.0
* OracleDB

## 화면 구성

<img src="https://user-images.githubusercontent.com/96601658/181147726-1fd4cd6a-5f35-4d1a-a90a-0e28ff82df85.jpg">
* http://localhost:9090/Melon/inc/main.jsp
  * 메인페이지 입니다.
  * DB에 임의의 곡을 넣어 최신음악을 표현했습니다.
  * 카카오로그인api를 사용해서 소셜로그인을 구현했고,
    회원가입을 통해 일반로그인도 가능합니다.
  * 고객센터, 스타포스트, 플레이리스트, 최신앨범, 검색기능을 구현했습니다.

<img src="https://user-images.githubusercontent.com/96601658/181148184-c814c4ae-6b6b-446d-84ab-1470ea2a8154.jpg">
* http://localhost:9090/Melon/login/register.jsp
  * 회원가입 화면입니다.
  * 유효성 검사를 통해 중복확인 기능을 만들었습니다.

* 회원가입 후 로그인 화면
  * 로그인 시 해당 닉네임을 화면 상단에 배치하여 로그인 되었음을 알리고,
    <br>회원 수정, 회원 탈퇴로 화면이 재구성 됩니다.

<img src="https://user-images.githubusercontent.com/96601658/181148297-451b8374-7587-4b55-9db1-43fcad0adaa2.jpg">
* http://localhost:9090/Melon/reply/albumDetail.jsp?no=1
  * 앨범 상세보기 화면입니다.
  * 메인화면에서 최신앨범 선택을 통해 들어올 수 있고,<br>댓글기능을 통해 댓글을 남길 수 있습니다.
  * 댓글은 ajax를 통해 구현했고, 수정/삭제는 해당 댓글을 작성한 아이디로 로그인 시 활성화 됩니다.
  * 24시간 이전에 등록된 댓글의 경우 new 이미지가 첨부되어 나타납니다.
  
<img src="https://user-images.githubusercontent.com/96601658/181148392-c2f633f8-6858-4b99-8950-d8e21e2c3aa2.jpg">  
* http://localhost:9090/Melon/starpost/list.jsp
  * 스타포스트 화면입니다.
  * 일종의 연예계 뉴스/ 신곡 홍보로 활용되는 란으로 만들었습니다.
<img src="https://user-images.githubusercontent.com/96601658/181148465-48d642cb-8ae6-4a9f-93ff-8c2c35b06ae2.jpg">
* http://localhost:9090/Melon/starpost/detail.jsp?no=1
  * 스타포스트 상세화면입니다.
  * 스타포스트는 관리자가 직접 작성하게 되어있고, DB를 통해 입력합니다.
  * 주로 동영상을 사용하게 만들었고, 각 글마다 동영상이 첨부되어 동영상 재생이 가능합니다.
  * 댓글은 앨범 상세보기와 동일하게 구현했습니다.

<img src="https://user-images.githubusercontent.com/96601658/181148542-8fb27d94-e3ed-45f5-8afa-7d8c08b2ba08.jpg">
* http://localhost:9090/Melon/notice/noticeList.jsp
  * 고객센터 화면입니다.
  * 일반게시판 화면으로 등록은 DB를 통해 작성하게 됩니다.
  * 자주하는 질문을 정리하고, 아코디언으로 구현했습니다.
