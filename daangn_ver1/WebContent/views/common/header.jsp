<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .menubar_wrap{
            /* background-color: red; */
            width: 1255px;
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
            /* background-color: antiquewhite; */
            width: 105px;
        }
        #banner div{
        	width: 100%;
        }
        #banner a{
        	/* margin-top: 10px; */
        	/* background-color: blue; */
        	width: 85px;
            height: 40px;
            display: block;
            margin: 8px 0 0 8px;
        }
        #menu{
            /* background-color: aqua; */
            width: 670px;
            /* margin-left: 30px; */
        }
        #search{
            /* background-color: aquamarine; */
            width: 360px;
            margin-left: -10px;
        }
        #loginbar{
            /* background-color: blue; */
            width: 120px;
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
        /* 메인페이지에서는 중고거래 카테고리 색깔 주황색으로 고정 */
        #flea{
            color: rgb(246, 117, 37) !important;
        }
        #search_text{
            height: 65%;
            width: 80%;
            /* background-color: blueviolet; */
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
            /* background-color: blue; */
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
    </style>

</head>
<body>
    <div class="menubar_wrap">
        <div class="menubar_el1" id="banner">
            <div id="banner_img"><a href=""><img src="resources/css_img/logo.png" alt="" style="width: 85px; height: 40px;"></a></div>
        </div>
        <div class="menubar_el1" id="menu">
            <div id="flea"><a href="" id="flea">중고거래</a></div>
            <div id="market"><a href="" id="store">동네가게</a></div>
            <div id="job"><a href="" id="job">알바</a></div>
        </div>
        <div class="menubar_el1" id="search">
            <div id="search_text"><input type="text" id="text_area" placeholder="&nbsp;물품이나 동네를 검색해보세요!"></div>
            <div id="search_img"><button><img src="resources/css_img/search_img.png" alt="" style="width: 70%; height: 70%"></button></div>
        </div>
        <div class="menubar_el1" id="loginbar">
            <a href="">로그인</a>
            <span>/</span>
            <a href="">회원가입</a>
        </div>
    </div>
</body>
</html>