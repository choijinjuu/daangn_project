<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.danngn.member.model.vo.Member"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	//프로젝트 contextPath 설정
	String contextPath = request.getContextPath();

	//알림 메세지 꺼내주기
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	//로그인 유저 정보 꺼내오기
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <title>Document</title>
    
	<!-- 다음 주소 검색 API 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
        .menubar_wrap{
            width: 1285px;
            height: 60px;
            margin: 0 auto;
        }
        .menubar_wrap>div{
            float: left;
        }
        .menubar_el1{
            height: 100%;
        }
        #banner{
            width: 105px;
        }
        #banner div{
        	width: 100%;
        }
        #banner a{
        	width: 85px;
            height: 40px;
            display: block;
            margin: 8px 0 0 8px;
        }
        #menu{
            width: 670px;
        }
        #search{
            width: 360px;
            margin-left: -10px;
        }
        #loginbar{
            width: 150px;
            margin-left: 10px;
        }
        .menubar_el1>div{
            height: 100%;
            width: 31%;
            float: left;
        }
        #menu a{
            color: rgb(77, 77, 77);
            font-size: 20px;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            line-height: 3;
            margin-left: 30%;
        }
        /* 카테고리에 마우스 올렸을시 색깔 바꿔주기 */
        #menu a:hover{
            color: rgb(161, 161, 161);
        }
        #search_text{
            height: 65%;
            width: 80%;
            margin-top: 8px;
        }
        #text_area{
            width: 100%;
            height: 100%;
            border-radius: 8px;
            /* 테두리 없애주기 */
            border: 0 solid black;
            outline: none;
            background-color: rgb(238, 238, 238);
            font-size: 15px;
        }
        #search_img{
            height: 60%;
            width: 13%;
            margin-left: 13px;
            margin-top: 10px;
            border-radius: 10px;
        }
        #search_img button{
        	height: 100%;
        	width: 100%;
        	border-radius: 10px;
        	border: 0.1em solid black;
        	background-color: white;
        }
        #search_img button:hover{
        	background-color: rgb(244, 244, 244);
        	cursor: pointer;
        }
        #loginbar a{
            font-size: 14px;
            line-height: 4;
            text-decoration: none;
            color: rgb(71, 71, 71);
        }
        #loginbar a:hover{
        	font-weight: 600;
        }
        #loginbar span{
        	cursor: default;
        }
        /* 버튼 기본 CSS */
        .btn_el button{
			border-radius: 10px;
			border: 0.1em solid black;
        	background-color: white;
		}
		.btn_el button:hover{
        	background-color: rgb(244, 244, 244);
        	cursor: pointer;
        }
    </style>

</head>
<body>
	<script>
		//알림 띄우기
		var msg = "<%=alertMsg%>";
		
		if(msg != "null"){
			alert(msg);
			
			//알림 한번 띄워주고 지워줘야됨. 안그러면 header.jsp 열릴때마다 알림 생성
			<%session.removeAttribute("alertMsg");%>
		}
	</script>

    <form action="<%=contextPath %>">
    <div class="menubar_wrap">
        <div class="menubar_el1" id="banner">
            <div id="banner_img"><a href="<%=contextPath %>"><img src="resources/css_img/logo.png" alt="" style="width: 85px; height: 40px;"></a></div>
        </div>
        <div class="menubar_el1" id="menu">
            <div id="flea"><a href="<%=contextPath %>" id="flea">중고거래</a></div>
            <div id="market"><a href="<%=contextPath %>/storesListForm.bo?cate=2&currentPage=1&subCategory=0" id="store">동네가게</a></div>
            <div id="job"><a href="<%=contextPath %>/jobsListForm.bo?cate=3&currentPage=1&subCategory=0" id="job">알바</a></div>
        </div>
        <div class="menubar_el1" id="search">
            	<div id="search_text"><input type="text" id="text_area" placeholder="&nbsp;물품이나 동네를 검색해보세요!"></div>
            	<div id="search_img"><button type="submit"><img src="resources/css_img/search_img.png" alt="" style="width: 70%; height: 70%"></button></div>
        </div>
        <div class="menubar_el1" id="loginbar">
        	<!-- 로그인 멤버가 없으면 -->
        	<%if (loginMember == null) {%>
	            <a href="<%=contextPath%>/login.me">로그인</a>
	            <span>/</span>
	            <a href="<%=contextPath%>/insert.me">회원가입</a>
       		<!-- 로그인 멤버 있으면 -->
        	<%}else {%>
        		<a href="<%=contextPath%>/updateMy.me">마이페이지</a>
	            <span>/</span>
	            <a href="<%=contextPath%>/logout.me">로그아웃</a>
        	<%} %>
        </div>
    </div>
    </form>
</body>
</html>