<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//쿠키 읽어오기
	String ck_value="";
	Cookie[] ckArr=request.getCookies();
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			if(ckArr[i].getName().equals("ck_userid")){
				ck_value=ckArr[i].getValue();
				break;
			}
		}//for
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main-style.css">
<link rel="stylesheet" type="text/css" href="../css/two.css" />
<title>Insert title here</title>
<style type="text/css">
.logo {
    width: 218px;
    margin: auto;
}
.wrapper .name {
    font-weight: 600;
    font-size: 1.4rem;
    letter-spacing: 1.3px;
    padding-left: 10px;
    color: #00d13c;
}
.wrapper .btn {
    box-shadow: none;
    width: 100%;
    height: 40px;
    background-color: #00d149;
    color: #fff;
    border-radius: 25px;
    box-shadow: 3px 3px 3px #b1b1b1, -3px -3px 3px #fff;
    letter-spacing: 1.3px;
}
.wrapper a {
    text-decoration: none;
    font-size: 0.8rem;
    color: #00d149;
}
img.aa {
    height: 67px;
    width: 172px;
    margin-bottom: 21px;
}
.wrapper {
    background-color: white;
}
article.simpleForm {
    background-color: white;
}
</style>
</head>
<body>
	<article class="simpleForm">
		<form name="frmLogin" method="post" action="login_ok.jsp">
			<fieldset>
				<div class="wrapper">
							<a href="../inc/main.jsp">
							<img class="aa" src="../img/melonLogo.JPG">
							</a>
					<form class="p-3 mt-3">
						<div class="form-field d-flex align-items-center">
							<span class="far fa-user"></span> <input type="text"
								name="userid" id="userid" placeholder="id">
						</div>
						<div class="form-field d-flex align-items-center">
							<span class="fas fa-key"></span> <input type="password"
								name="pwd" id="pwd" placeholder="Password">
						</div>
						
						<input type="submit" class="btn mt-3" name="chkSaveId" value="Login">
					</form>
					<div class="text-center fs-6">
						<a href="agreement.jsp">Sign up</a>
					</div>
				</div>
			</fieldset>
		</form>
	</article>
</body>
</html>
<%@ include file="../inc/footer.jsp"%>