<%@page import="com.melon.notice.model.noticeVO"%>
<%@page import="com.melon.notice.model.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>

<%

	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");	
	
	noticeDAO dao=new noticeDAO();

	List<noticeVO> list=null;
	try{
		list=dao.selectAll(condition, keyword);	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	if(keyword==null) keyword="";
		int currentPage=1; 
		if(request.getParameter("currentPage")!=null){
			currentPage=Integer.parseInt((request.getParameter("currentPage")));
		}
		
		int totalRecord=list.size();  
		int pageSize=5; 
		int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
		int blockSize=10; 

		int	firstPage=currentPage-((currentPage-1)%blockSize); 
		int lastPage=firstPage+(blockSize-1); 
		
		int curPos=(currentPage-1)*pageSize;
		
		int num=totalRecord-curPos; 
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.nav-tabs{
	font-size: smaller;
}

</style>
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	 <link rel="stylesheet" href="../css/notice.css">
</head>
<div class="noticeAll">
<body>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
				data-bs-target="#home" type="button" role="tab" aria-controls="home"
				aria-selected="true"  >공지사항</button>
				
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
				data-bs-target="#profile" type="button" role="tab"
				aria-controls="profile" aria-selected="false">자주 하는 질문</button>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab"><!DOCTYPE HTML>
<html lang="ko">
<head>


</style>
<title>공지사항</title>
<meta charset="utf-8">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		$('.divList table.box2 tbody tr').hover(function(){
			$(this).css('background',' #aeff9f ');
		}, function(){
			$(this).css('background','');
		});
	});
</script>
<style type="text/css">

</style>	
</head>	
<body>
<br><br><br>
<p id="not"></p>
<% if(keyword!=null && !keyword.isEmpty()){ %>
	<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
<%} %>

<div class="divList">
<table class="box2"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:15%;" />
		<col style="width:30%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">분류</th>
	    <th scope="col">제목</th>
	    <th scope="col">조회</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead> 
	<tbody>  
	<%if(list.isEmpty()){ %>
		<tr>
			<td colspan="5" class="align_center">해당 글이 존재하지 않습니다.</td>
		</tr>
	<%}else{ %>	
	  <!--게시판 내용 반복문 시작  -->	
	  <%for(int i=0;i<pageSize;i++){ 
		  	if(num-- <1) break;
		  	
	  		noticeVO vo = list.get(curPos++);
	  %>	
		<tr  style="text-align:center">
			<td><%=vo.getNtNo() %></td>
			<td><%=vo.getNtCate() %></td>
			<td style="text-align:left">
			<a href="countUpdate.jsp?ntNo=<%=vo.getNtNo()%>">
				<%=vo.getNtTitle() %> </a></td>
			<td><%=vo.getNtNum() %></td>
			<td><%=sdf.format(vo.getNtRegdate()) %></td>
		</tr>
	  <%}//for %>	 
	  <!--반복처리 끝  -->
	 <%}//if %> 
	 </tbody>
</table>	   
</div>
<div class="divPage">
		<!-- 이전블럭으로 이동 -->
	<%
		if(firstPage>1){ %>
			<a href='noticeList.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='../img/first.JPG'>
			</a>	
	<%	} %>
	<br><br>
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break;  
			
			if(i==currentPage){	%>
				<span style="color: limegreen;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href
	='noticeList.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
					[<%=i %>]</a>
			<%} %>		
	<%	} %>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<%
		if(lastPage < totalPage){ %>
			<a href='noticeList.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='../img/last.JPG'>
			</a>	
	<%	} %> <br><br><br>
</div>


</body>
</html></div>
		<div class="tab-pane fade" id="profile" role="tabpanel"
			aria-labelledby="profile-tab">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<p class="tit"></p>
	<div class="container">
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="false" aria-controls="flush-collapseOne">
						멜론 플레이어에서 사용기기는 어떻게 등록하나요?</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<strong>1. 사용 기기로 등록된 기기가 없는 경우</strong> <br> 멜론에서는 2대의 기기를
						등록하여 이용할 수 있으며, 월 2회 변경이 가능합니다. 등록은, PC 플레이어 및 안드로이드 어플리케이션, 아이폰
						어플리케이션을 이용하여 가능합니다. 또한, 주 사용기기 지정을 통해, WEB이나 PC 플레이어에서 다운로드 받은
						DCF음원을, 주로 전송할 기기로 선택할 수 있습니다. <br> <br>
						<code>※ 주 사용기기란? 멜론에서 등록하여 사용할 수 있는 기기는 2대까지 휴대폰과 MP3P를
							구분하지 않고 등록가능합니다. 그러나, 멜론 DCF 지원 기기의 DRM은 한 개의 인증키만을 사용하게 되므로, 서로
							다른 DRM 인증키를 갖는 기기를 등록한 경우(예. 휴대폰 2대), 한 개의 기기를 주 사용기기로 설정 해야합니다.
							PC 멜론 플레이어나, WEB에서 다운로드 받는 음원을 주 사용기기를 기준으로 DRM 인증키를 생성하므로, 기기 전송
							시 편의를 제공합니다. 이에, 주 사용기기와 동일하지 않은 DRM 인증키를 사용하는 기기에 이미 PC에 다운로드 받아
							놓은 컨텐츠를 전송할 경우는, 해당 기기의 DRM 인증키로 재 다운로드를 하여 전송하게 됩니다</code>
						<br> 등록 메시지에서 “예”를 누르면 기기 등록이 진행됩니다. 처음 등록한 기기는 자동으로 “주
						사용기기”로 등록 됩니다.<br> <br> <img src="../img/1-q&a.jpg">
						<br> <br> <strong>2. 사용 기기로 등록된 기기가 1대 있는 경우</strong> <br>등록
						메시지에서 “확인”를 누르면 기기 등록이 진행되며, 새로 등록할 기기를 “주 사용기기”로 변경 할 수 있습니다. <strong><br>
							<br> <img src="../img/2-q&a.jpg"> <br> <br>3.
							사용기기로 등록된 기기가 2대 있는 경우 (월 1회 변경 권한이 있는 경우)</strong> <br>기존에 등록되어 있는
						2대의 기기 중, 1대를 선택하여 삭제하고 연결한 기기를 등록할 수 있습니다. 새로 등록할 기기를 “주 사용기기”로
						변경 할 수 있습니다. <br> <br> <img src="../img/3-q&a.jpg">
						<br> <br>
						<code>※ 주 사용기기가 변경되면, 변경 이후 PC 플레이어나 WEB에서 다운로드 받는 DCF 파일의
							인증키도 바뀌게 됩니다. 이후, 등록기기를 연결하여 PC에 있는 파일을 전송하는 경우라도 기기에 맞는 인증키로 생성된
							DCF를 받기 위해 재다운로드가 실행될 수 있습니다. </code>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						다운로드한 음악 파일은 내 컴퓨터의 어디에 저장되나요?</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						※Windows 플레이어 5.19.603.17 버전, Mac 플레이어 v1.1.5 버전부터 기본 다운로드 폴더가
						변경되었습니다. 앱 업데이트 후 처음 다운로드 하실 때 파일 다운로드 경로를 꼭 확인하세요. <br> <br>
						<br> [Window 환경] 멜론 웹사이트 또는 멜론 윈도우 플레이어에서 다운로드한 곡들은 기본 저장 폴더
						(내문서 > 멜론보관함 > 받은 파일함)에 저장됩니다.<br> <br> <br> 1. 웹에서
						다운로드할 경우 (멜론 윈도우 플레이어를 함께 실행하지 않은 상태) 윈도우 비스타, 7, 8은 브라우저가 반드시
						<code>관리자 모드</code>
						로 실행되어야만 다운로드 위치가 정상적으로 반영됩니다. (관리자 권한이 아닐 경우, 윈도우 OS가 지정하는 별도의 가상
						폴더에 저장되므로, 다운로드 후 파일을 확인할 수 없게 됩니다.)<br> <br> <br>
						다운로드 진행 시 “파일 다운로드 후 폴더 열기”에 체크가 되어 있으면, 다운로드 완료 후, 해당 폴더가 자동으로
						열립니다. <br> <br> <img src="../img/4-q&a.jpg"><br>
						<br> 2. 멜론 윈도우 플레이어의 [Menu > 환경설정 > 다운로드]에서 폴더를 변경하거나 열 수
						있습니다. <br> <br> <img src="../img/5-q&a.jpg"><br>
						<br> 3. 다운로드 창에서 폴더 열기 / 다운로드 후 폴더 열기로 다운로드 전에 저장될 폴더를 미리 열어볼
						수 있습니다. <br> <br> <img src="../img/6-q&a.jpg"><br>
						<br> 다운로드 진행 시, “파일 다운로드 후 폴더 열기”에 체크가 되어 있으면, 다운로드 완료 후, 해당
						폴더가 자동으로 열립니다. <br> <br> <img src="../img/7-q&a.jpg"><br>
						<br>PC에 저장된 콘텐츠 메뉴 열기 팝업에서 “예”를 클릭하면 해당 메뉴의 탭이 자동으로 열립니다.<br>
						<br> <img src="../img/8-q&a.jpg"><br> <br>
						[Mac 환경] <BR>맥 플레이어에서 다운로드 한 곡들은 기본 저장 경로인 다운로드 > Melon 폴더 안에
						저장됩니다. Finder에서 왼쪽 즐겨찾기 메뉴의 다운로드 폴더에서 Melon 폴더를 찾으시거나, Finder에서 상단
						시스템 메뉴 > 이동 > 폴더에서 ~/Downloads/melon을 입력하시면 해당 폴더로 이동합니다.

					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
						MP3 파일을 DCF파일로 바꾸는 방법</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					aria-labelledby="flush-headingThree"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<strong> 1. MP3 파일을 DCF파일로 바꾸는 방법</strong> 멜론에서는 MP3 파일에 한하여
						DCF컨버팅 서비스를 제공하고 있으며,<br> 한 번에 다량의 MP3 파일을 DCF 파일로 컨버팅 후
						휴대폰으로 전송하실 수 있는 기능도 제공하고 있습니다.<br> ※ 가변음질(VBR) 방식으로 인코딩 된 MP3
						파일의 경우, DCF 변환 후 휴대폰으로 전송하여도 재생이 안될 수 있습니다.<br> <br> <br>
						<code>※ DCF컨버팅은 멜론 플레이어와 디바이스를 연결한 상태에서만 이용가능 합니다.</code>
						<br> <br> <strong>[DCF컨버팅 방법]<br> 1. 아래
							경로를 통해 DCF컨버팅 창을 엽니다.
						</strong><br> - PC플레이어 하단 DCF컨버팅 선택 <br> <br> <img
							src="../img/9-q&a.jpg"><br> <br> <br> <strong>
							2. 추가 버튼으로 컨버팅 할 MP3파일을 개별 파일 또는 폴더 전체를 선택하여 추가합니다.</strong> <br> <br>
						<br> <img src="../img/10-q&a.jpg"><br> <br>
						<br> ① 컨버팅이 불가능한 MP3 파일이 추가된 경우, ! 아이콘이 표시되고 컨버팅이 되지 않습니다.<br>

						② VBR 방식으로 인코딩 된 MP3 파일의 경우, ! 아이콘으로 표시되고 해당 아이콘 클릭하여 컨버팅하기 버튼을
						클릭하면 컨버팅이 가능하도록 변경됩니다.<br> (컨버팅하기 버튼을 클릭하지 않은 VBR곡은 컨버팅이 진행되지
						않습니다) <br> <br> <img src="../img/11-q&a.jpg"><br>
						<br> <strong>3. MP3 파일의 곡 정보를 확인하고 곡정보 변경 작업을 하실 수
							있습니다.</strong><br> ※ 곡 정보 변경은 해당 곡이 DCF컨버팅 되어 휴대폰으로 전송될 때 입력되는 정보로
						MP3 파일의 태그정보가 변경되는 것이 아닙니다. <br> <br> <img
							src="../img/12-q&a.jpg"><br> <br> <strong>
							4. 컨버팅하기 버튼을 클릭하여 전송할 폴더를 선택하고 [확인] 버튼을 클릭하면 됩니다.</strong> <br> <br>
						<img src="../img/13-q&a.jpg"><br> <br> ※ 저작권자의
						허락없이 불법으로 다른 사람의 저작물을 이용하는 것은
						<저작권법>에 위배되어 민형사상 불이익을 받을 수 있으니 유의하시기 바랍니다.<br>

						※ 사적으로 복사된 MP3 파일의 변환, 전송으로 인해 발생하는 <저작권 문제>, <휴대폰 오작동 및 파일
							재생 오류> 등 모든 문제에 대해서는 당사에서는 책임지지 않습니다. 
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
						aria-expanded="false" aria-controls="flush-collapseFour">
						다운로드 이용 PC 제한이 뭔가요?</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse"
					aria-labelledby="flush-headingFour"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						음원(DCF/MP3) 다운로드는 멜론에 등록된 PC에서만 가능하며, 최대 3대까지 등록이 가능합니다.<br>

						단, 개별곡 구매는 PC등록 없이 가능합니다.<br> - 월 3회 등록 또는 변경이 가능하며, 매월 1일에
						3회 사용 횟수를 초기화합니다.<br> - 월 3회 등록/변경 사용 횟수를 모두 사용하셨을 경우, 현재
						등록되어 있는 3대의 PC 이외 또 다른 PC로의 음원 다운로드를 시도하셨을 때 PC 이용 제한에 해당됩니다.<br>

						- PC등록은 음원(DCF/MP3)을 다운로드하실 때, 해당 PC의 등록 여부를 체크하여 등록하게 되며 PC당 1회만
						등록하시면 됩니다.<br> <br> <strong> 1. 처음 등록하는 PC인 경우</strong><br>
						다운로드 버튼 클릭 시, [PC등록] 창이 보이며 PC등록을 하실 수 있습니다.<br> PC 이름을 입력해
						두시면, 이후 변경 시 PC 확인에 유용합니다.<br> <br> <br> <img
							src="../img/14-q&a.jpg"><br> <br> <br> <strong>
							2. 3대 등록 이후, 변경 시 (변경 가능 횟수가 남아 있는 경우)</strong><br> 다운로드 버튼 클릭 시
						[PC등록] 창에서, 3대의 PC 중 1대를 선택하여 변경할 수 있습니다.<br> PC 이름을 입력해두시면,
						이후 변경 시 PC 확인에 유용합니다.<br> <br> <br> <img
							src="../img/15-q&a.jpg"><br> <br> <br> <strong>
							3. PC 등록 / 변경 횟수 초과한 경우</strong><br> 등록된 PC가 3대 이면서, 등록/변경 횟수 3회를 모두
						사용한 경우에는 다운로드 버튼 클릭 시 [PC 등록 제한] 창이 보입니다. 이런 경우 PC 이용제한 해제를 요청해
						주셔야 합니다. <br> <br> <br> <img
							src="../img/16-q&a.jpg"><br> <br> <br> <strong>4.
							PC 이용 제한 해제 요청하기</strong><br> PC 교체나 윈도우 재설치 등으로 PC 이용 제한 해제가 필요하신
						경우, 삭제를 원하시는 PC의 HDD장치 ID 정보 또는 등록할 때 입력하신 PC 이름을 확인하셔서 PC 이용 제한
						해제 요청하기 [1:1문의]를 남겨주세요. <br>※ 현재 멜론에 등록된 PC 등록 정보는 멜론 플레이어
						MENU > 기기 등록정보 > PC등록 탭에서 확인하실 수 있습니다. <br> <br>※ HDD 장치
						ID란?<br> HDD 장치 ID는 제조사 명과 시리얼 번호, 펌웨어 번호가 조합된 형태로 동일한 모델의
						HDD 장치라도 개인의 PC마다 고유의 장치 ID를 생성하게 되므로 각 PC 구분이 가능합니다. 하지만 동일한
						PC에서라도 가상 OS를 통하거나, USB 하드웨어를 연결한 상태로 다운로드를 시도할 경우, HDD 장치 ID가
						다르므로 멜론 플레이어에서 새로운 PC로 인식하여 새롭게 PC등록이 진행될 수 있으니, 기기 등록 시점과 동일한
						환경에서 다운로드를 시도해 주세요. <br> <br> <br> <strong>5.
							내 PC의 HDD 장치 ID 확인하는 방법</strong><br> 제어판 > 시스템 > 하드웨어 > 장치 관리자에서 디스크
						드라이브 선택 후 마우스 우클릭 > 속성을 선택합니다.\ <br> <br> <br> <img
							src="../img/17-q&a.jpg"><br> <br> <br>디스크
						드라이브의 자세히 탭을 선택하면 내 PC의 장치 ID를 확인할 수 있습니다. <br> <br> <br>
						<img src="../img/18-q&a.jpg"><br> <br> <br>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFive">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseFive"
						aria-expanded="false" aria-controls="flush-collapseFive">
						멜론 캐쉬 환불안내</button>
				</h2>
				<div id="flush-collapseFive" class="accordion-collapse collapse"
					aria-labelledby="flush-headingFive"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						멜론캐쉬는 고객님의 요청에 따라 잔액의 전액 환불이 가능합니다. 멜론캐쉬는 결제수단으로 환불을 하게되며 , 결제수단으로
						환불 불가할 경우 현금 환불 가능합니다. <br>단, 아래의 경우에는 멜론캐쉬 환불이 불가합니다.<br>
						1. 다른 고객 또는 제3자로부터 선물을 받아 적립된 경우 <br>2. 이벤트 당첨 또는 참여를 통하여 적립된
						경우<br> 3. 결제 도용 등과 같이 불법적인 수단으로 적립된 경우<br> 4. 멜론 서비스
						이용약관이나 본 약관 개별 이용권 안내페이지 등에서 금지 사유로 규정하고 있는 경우<br> <br>
						멜론캐쉬 환불 신청방법 <br>1. 멜론 웹사이트의 고객지원> 1:1 문의하기로 이동합니다.<br>2.
						1:1문의하기 중 [결제/해지/환불] > [해지/환불 요청] 메뉴를 선택합니다. <br>3. 문의내용에
						환불사유와 환불받을 은행/계좌번호/예금주를 기재합니다. <br>4. 환불이 가능한 경우 처리완료 답변일
						기준으로 다음주 금요일까지 입금 가능합니다.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSix">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseSix"
						aria-expanded="false" aria-controls="flush-collapseSix">
						Mac에서 멜론을 이용하고 싶어요.</button>
				</h2>
				<div id="flush-collapseSix" class="accordion-collapse collapse"
					aria-labelledby="flush-headingSix"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						Mac OS에서 멜론을 이용하시려면, App Store에서 멜론을 검색하시어 멜론 Mac Player를 설치해 주세요.<br>
						Mac 용 멜론 플레이어를 통해 음악을 감상하실 수 있고, 다운로드 이용권을 사용하신다면 음악 다운로드도 가능합니다.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSeven">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven"
						aria-expanded="false" aria-controls="flush-collapseSeven">
						이용권 해지 종류에는 어떤 것이 있고, 어떤 경로를 통하여 이용권을 해지할 수 있나요?</button>
				</h2>
				<div id="flush-collapseSeven" class="accordion-collapse collapse"
					aria-labelledby="flush-headingSeven"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						해지 신청 시, 정기결제해지와 중도해지 중 선택할 수 있습니다.<br> <br> - 정기결제해지를 할
						경우 다음 정기결제예정일까지 이용권을 사용할 수 있고, 결제예정일에 이용권이 해지되어 더 이상 자동결제가 되지 않으며,
						중도해지를 할 경우 해지신청 즉시 이용권 해지의 효과가 발생하여 서비스 이용이 즉시 중단됩니다. <br>-
						중도해지 시에는 결제된 금액에 대해서 고객이 별도 입력한 계좌로 현금 환불 해드립니다. <br>- 결제수단별
						결제 취소를 원하시는 경우 결제일로부터 7일 이내에 사용이력이 없는 상태로 정기결제 해지 후
						고객센터(1566-7727)또는 1:1 문의 접수를 통하여 결제취소 처리가 가능합니다. <br> <br>※
						다만, 카드사의 사정 등으로 결제수단별 결제취소가 불가능한 경우는 현금 환불만이 가능하오니 참고하시기 바랍니다.<br>
						<br> <br>[해지 경로]<br> 정기결제해지/중도해지에 대한 경로는 다음과 같습니다<br>
						<br> <br>- 정기결제해지의 경우 <br>(1) 멜론PC웹 > 내정보 >
						멜론이용권/결제정보 > 멜론이용권 > 이용권 해지신청 메뉴 <br>(2) 멜론모바일앱(안드로이드) 또는
						모바일웹 > 내정보 > 이용권/쿠폰/캐시 > 변경/해지 > 결제방법 변경/해지> 해지 메뉴 <br>※
						멜론모바일앱(안드로이드)에서 해당 메뉴는 안드로이드 앱 4.2.4 버전 이상에서 제공합니다. <br>(3)
						톡뮤직(안드로이드) > MY PAGE > 해지 메뉴 <br>(4) 삼성뮤직(안드로이드) > 내정보 > 이용권
						> 해지 메뉴에서 해지 신청 가능합니다. <br> <br> <br> - 중도해지의 경우 <br>
						<br>(1) 멜론PC웹 > 내정보 > 멜론이용권/결제정보 > 멜론이용권 > 이용권해지신청 메뉴 <br>(2)멜론모바일앱(안드로이드)
						또는 모바일웹 > 내정보 > 이용권/쿠폰/캐시 > 변경/해지 > 결제방법 변경/해지> 해지 메뉴 <br>※
						멜론모바일앱(안드로이드)에서 해당 메뉴는 안드로이드 앱 4.2.4 버전 이상에서 제공합니다. <br>(3)
						톡뮤직(안드로이드) > MY PAGE > 해지 메뉴 <br>(4) 삼성뮤직(안드로이드) > 내정보 > 이용권
						> 해지 메뉴에서 해지 신청 가능합니다. <br> <br>※ 참고로 iTunes Store 또는
						App Store를 통해 구매한 사항은 애플 판매 정책에 따라 기본적으로 취소가 불가능하며, 애플 앱스토어에서 해지 및
						환불 신청하시기 바랍니다. <br>(애플 앱스토어https://reportaproblem.apple.com접속
						후 로그인>구입한 항목 선택>환불요청)
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingEight">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseEight"
						aria-expanded="false" aria-controls="flush-collapseEight">
						멜론에서 이용권 사용 중 중도해지 할 경우 이용한 금액은 어떻게 환불되나요?</button>
				</h2>
				<div id="flush-collapseEight" class="accordion-collapse collapse"
					aria-labelledby="flush-headingEight"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						1. 이용권 중도 해지로 인한 환불<br>멜론 이용 중 중도해지 및 환불이 가능한 이용권은 유료 이용권 중
						무제한 다운로드가 포함되지 않은 이용권 입니다. 무제한 다운로드가 포함된 이용권(예: 스마트 프리클럽/티켓)은 중도해지
						되지 않으며, 무료 이벤트형 이용권은 해지해도 환불되지 않습니다. <br>①이용권 중도 해지 시 환불 수단 <br>중도
						해지시 고객님이 실제 이용하신 이용요금을 제외한 나머지를 계좌정보 입력을 통해서 현금으로 환불해 드립니다. (현금환불
						처리는 영업일 기준 3일 이내 처리가 됩니다.) <br>②이용권 중도 해지 시 환불 금액 <br>고객님이
						구매하신 가격에서 고객님의 실제 서비스 이용 금액을 제외하고 환불됩니다. <br>환불 금액 = 이용권의 구매
						가격 - 고객님의 실제 서비스 이용 금액 <br> <br>2. 결제 취소(청약 철회) <br>이용권
						가입 후 7일 이내에 사용이력이 없는 경우 결제 취소처리 됩니다. <br>휴대폰결제(KT/LG U+)로
						결제하여 당월에 환불을 요청하신 경우 결제가 취소되어 청구되지 않습니다. <br>결제하신 달이 지나서 환불을
						요청하시면, 현금으로 환불해 드립니다. <br> <br> ※ 멜론 이용권의 환불은 환불 사유에
						해당하는 경우에만 가능한 점 참고해 주세요.
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingNine">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseNine"
						aria-expanded="false" aria-controls="flush-collapseNine">
						멜론 이용권을 해지 신청 했는데 멜론 서비스 사용이 아직도 되네요. 해지된 게 맞나요?</button>
				</h2>
				<div id="flush-collapseNine" class="accordion-collapse collapse"
					aria-labelledby="flush-headingNine"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						이용권 해지 신청은 결제예정일에 사용중인 서비스가 자동 종료되어 이후에는 결제가 되지 않도록 예약하는 것입니다. <br>



						해지 신청을 한 경우 결제 예정일(이용권종료일)까지는 사용하시던 이용권을 사용하실 수 있습니다.<br>

						결제예정일이 지나면 서비스가 자동 종료되게 됩니다.<br> 예를 들어 매월 5일이 정기결제일인 경우 해지
						신청하게 되면, 결제예정일 5일까지 사용 후 이용권이 자동종료 되게 됩니다.<br> 현재 사용하던 결제예정일
						전까지는 사용할 수 있으니 이용에 참고하시기 바랍니다.<br>


					</div>
				</div>
			</div>
		</div>

	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html></div>
	</div>
	</div>
</body>
</html>
<%@ include file="../inc/footer.jsp"%>