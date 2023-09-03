<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
		#fleaDe_wrap{
			width: 800px;
			height: 800px;
			/* background-color: red; */
			margin: auto;
		}
		.flea_all{
			width: 85%;
			margin: auto;
		}
		#fleaDe_img_area{
			height: 505px;
			/* background-color: blue; */
			margin-top: 25px;
		}
		#fleaDe_img_area img{
			width: 100%;
			height: 100%;
			border-radius: 20px;
		}
		#fleaDe_title_area{
			height: 80px;
			/* background-color: red; */
		}
		#fleaDe_title_area>div{
			float: left;
		}
		#flea_profile_area{
			height: 50px;
			width: 8%;
			/* background-color: blue; */
			margin-top: 15px;
			border-radius: 100px;
		}
		#flea_profile img{
			width: 100%;
			height: 100%;
			border-radius: 100px;
		}
		#flea_profile img:hover{
			/* a태그 밑줄 나오게 */
		}
		#flea_id_area{
			height: 45px;
			margin-top: 21px;
			/* background-color: yellow; */
		}
		#flea_id_area:hover{
			/* a태그 밑줄 나오게 */
		}
		#flea_id{
			font-size: 15px;
		}
		#flea_address{
			font-size: 13px;
			color: rgb(135, 135, 135);
			margin-top: 2px;
		}
		#flea_title{
			/* background-color: red; */
			height: 58px;
			width: 680px;
			margin: auto;
			font-size: 19px;
			line-height: 4.5;
		}
		#flea_cate{
			/* background-color: blue; */
			height: 23px;
			font-size: 14px;
			color: rgb(135, 135, 135);
		}
		#flea_money{
			height: 30px;
		}
		#flea_all_el2 pre{
			width: 680px;
			margin: auto;
			/* background-color: red; */
			font-size: 17px;
			color: rgb(55, 55, 55);;
		}
	</style>
	
</head>
<body>
	
	<%@ include file = "../common/header.jsp" %>
	
	<div id="fleaDe_wrap">
		<div class="flea_all" id="fleaDe_img_area">
			<img src="">
		</div>
		<div class="flea_all" id="fleaDe_title_area">
			<div id="flea_profile_area"><img src=""></div>
			<div id="flea_id_area">
				<div id="flea_id"><a><strong>아스크림사러</strong></a></div>
				<div id="flea_address">서울 관악구 신림동</div>
			</div>
		</div>
		<hr style="border: 0.1px solid rgb(224, 224, 224); width: 680px;">
		<div class="flea_all" id="fleaDe_text_area">
			<div>
				<div id="flea_title"><strong>전남친흔적</strong></div>
				<div id="flea_cate">여성잡화  ∙ 조회수 60</div>
				<div id="flea_money"><strong>120,000원</strong></div>
			</div>
			<div id="flea_all_el2">
				<pre>이러쿵.. 저러쿵...</pre>
			</div>
		</div>
		<div id=fleaDe_reply></div>
	</div>
	
	<%@ include file = "../common/footer.jsp" %>
	
</body>
</html>