<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#login_wrap{
			height: 400px;
			width: 500px;
			margin: auto;
			margin-top: 100px;
			margin-bottom: 100px;
			border-radius: 40px;
			border: 1px solid rgb(178, 178, 178);
		}
		#logo_img{
			height: 70px;
			width: 250px;
			margin: auto;
			margin-top: 25px;
		}
		#logo_img img{
			width: 100%;
			height: 100%;
		}
		.login_form{
			height: 50px;
			width: 350px;
			margin: auto;
			margin-top: 30px;
		}
		#id_area input, #pwd_area input{
			border-top-width: 0px;
			border-left-width: 0px;
			border-right-width: 0px;
			border-bottom-width: 1px;
			border-bottom-color: rgb(206, 206, 206);
			height: 100%;
			width: 100%;
			outline: none;
			font-size: 18px;
		}
		#loginForm_btn{
			width: 250px;
			height: 50px;
			margin: auto;
			margin-top: 30px;
		}
		#loginForm_btn button{
			width: 100%;
			height: 100%;
			background-color: rgb(255, 92, 22);
			font-size: 16px;
		}
	</style>

</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<div id="login_wrap">
		<div id="logo_img">
			<img src="resources/css_img/full_banner_img.png">
		</div>
		<form action="<%=contextPath %>/login.me" method="post">
			<div class="login_form" id="id_area">
				<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력해주세요.">
			</div>
			<div class="login_form" id="pwd_area">
				<input type="password" name="memberPwd" id="memberPwd" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div class="btn_el" id="loginForm_btn">
				<button type="submit"><strong>로그인</strong></button>
			</div>
		</form>
	</div>

	<%@ include file = "../common/footer.jsp" %>
</body>
</html>