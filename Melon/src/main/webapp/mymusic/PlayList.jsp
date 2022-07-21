<%@page import="com.melon.mymusic.model.SmemVO"%>
<%@page import="com.melon.mymusic.model.PlayListVO"%>
<%@page import="com.melon.mymusic.model.MyListDAO"%>
<%@page import="com.melon.mymusic.model.SMemDAO"%>
<%@page import="com.melon.mymusic.model.PlayListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../inc/header.jsp"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
PlayListDAO palyListDAO = new PlayListDAO();
SMemDAO smemDAO = new SMemDAO();
// 데이터 받기
ArrayList<PlayListVO> list = palyListDAO.musicAllData();
ArrayList<SmemVO> users = smemDAO.userAllData();

MyListDAO myListDAO = new MyListDAO();
%>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script type="text/javascript">

	$(document).ready(function() {
			
			$('#saveBtn').click(function() {
					console.log("length: "+ $("input:checkbox[name=chbx]:checked").length);
						var trArr = new Array();
						var checkbox = $("input:checkbox[name=chbx]:checked");
						var selectList = document.getElementById("UserId")
						var userId = selectList.options[selectList.selectedIndex].value
						console.log(userId);
						

						checkbox.each(function(i) {
							var tdArr = new Array();
							// checkbox.parent() : checkbox의 부모는 <td>이다.
							// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
							var tr = checkbox.parent().parent().eq(i);
							var td = tr.children();
							// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
							var sNo = td.eq(1).text();
							var sTitle = td.eq(2).text();
							var sArtist = td.eq(3).text();
							var sFile = td.eq(4).text();

							// 가져온 값을 배열에 담는다.
							tdArr.push(sNo);
							tdArr.push(sTitle);
							tdArr.push(sArtist);
							tdArr.push(sFile);

							trArr.push(tdArr);

							console.log(tdArr);
							document.open="MyList.jsp";
							$.ajax({
								type : "POST",
								url : "./MyList_Insert.jsp",
								data : "sNo="+ sNo+ "&userId="+ userId	
								+ "&sTitle="+ sTitle
								+ "&sArtist="+ sArtist
								+ "&sFile="	+ sFile,
																	
								success : function(	msg) {
									$('#result').hide();
									$("#result").html("<h3>"+ msg+ "</h3>").fadeIn("slow");
																	}
																});
													});
											console.log(trArr);
											alert('곡을 담았습니다!');
											location.href  ="PlayList.jsp" ; 
			});
});
	
	function windowopenPopup(){
		mylistOpen=window.open('MyList.jsp', '마이뮤직', 'width=400, height=600, menubar=no, status=no, toolbar=no');
		
	}
	
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="#">
<title>Play List</title>
<style type="text/css">
div#plMain {margin-left: 200px;}
select#UserId {background-color: #ffffff;color: green;font-weight: bold;width: 70px;font-size: 15px;}
h1#play {font-size: 27px;color: #00b900;}
table {
	border: 1px solid gray;
	border-collapse: collapse;
	border-left: none;
	border-right: none;
	width: 80%
}

.tb_list {
	border-bottom: 3px solid #80ba00
}
.tb_list2{
	border-bottom: 1px solid lightgray
	
}
tr {
	height: 35px;
}

button#saveBtn {
	padding: 0px;
}

#chbx{
	accent-color: #469d23f2;
}
#sNo{
	font-weight:bold;
	color: gray;
}
a#mm {float: right;margin-right: 20%;}
td#sTitle {color: darkslategray;font-weight: lighter;}

td#sArtist {font-weight: lighter;color: dimgray;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
	<div id="plMain">
	<h1 id="play">PLAY LIST</h1>
	<br>
	<select id="UserId" name="UserId">
		<%
		for (SmemVO user : users) {
		%>
		<option value="<%=user.getUserId()%>"><%=user.getUserId()%></option>
		<%
		}
		%>
	
	</select> 님의 플레이리스트에 담기  
	<a href="#" onClick="windowopenPopup()" id="mm"><img src="../img/mymusic.png"> </a>
	<br>
	<br>
	
	<table>
	<colgroup>
		<col style="width:5%;" />
		<col style="width:12%;" />	
		<col style="width:50%;" />
		<col style="width:33%;" />	
			
	</colgroup>
		<thead>
			<tr style="color: #80ba00;">
				<th scope="col" style="text-align: center" class="tb_list"><button type="submit" id="saveBtn">
		<img src="../img/savem.png">
	</button></th>
				<th scope="col" style="text-align: center" class="tb_list">음악번호</th>
				<th scope="col" style="text-align: center" class="tb_list">곡명</th>
				<th scope="col" style="text-align: center" class="tb_list">가수명</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < list.size(); i++) {
				PlayListVO vo = list.get(i);
			%>
			<tr name="music_item" style="color: black;">
				<td><input type="checkbox" id="chbx" class="tb_list2"
					name="chbx" value="<%=vo.getsNo()%>"></td>
				<td id="sNo" style="text-align: center" class="tb_list2"><%=vo.getsNo()%></td>
				<td id="sTitle" style="text-align: center" class="tb_list2"><%=vo.getsTitle()%></td>
				<td id="sArtist" style="text-align: center" class="tb_list2"><%=vo.getsArtist()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	
	</div>
</body>
</html>

<%@ include file="../inc/footer.jsp"%>