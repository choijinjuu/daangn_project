<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#main_banner{
			height: 310px;
			width: 100%;
		}
		#main_banner img{
			height: 100%;
			width: 100%;
		}
		#main_content{
			width: 800px;
			margin: auto;
		}
		#content_title{
			height: 120px;
			width: 100%;
		}
		#content_title>div, #content_title_el2>div{
			float: left;
		}
		#content_title_el1{
			height: 100%;
			width: 30%;
		}
		#content_title_el1 span{
			font-weight: 600;
			font-size:32px;
			line-height: 5.3;
			margin-left: 25px;
			cursor: default;
		}
		#content_title_el2{
			height: 100%;
			width: 40%;
		}
		#content_title_el3{
			height: 100%;
			width: 30%;
		}
		#flea_search{
			height: 20px;
			width: 180px;
			margin-top: 80px;
			margin-left: 60px;
		}
		#flea_search input{
			width: 100%;
			height: 100%;
			outline: none;
			border: 1px solid rgb(129, 129, 129);
		}
		#flea_btn{
			width: 35px;
			height: 25px;
			margin-top: 80px;
			margin-left: 10px;
		}
		#flea_btn button{
			width: 100%;
			height: 100%;
		}
		#content_btn_area{
			width: 70px;
			height: 30px;
			margin-top: 70px;
			margin-left: 130px;
		}
		#content_btn_area button{
			width: 100%;
			height: 100%;
			background-color: white;
			border-radius: 10px;
			border: 0.1em solid black;
		}
		#content_btn_area button:hover{
			cursor: pointer;
			background-color: rgb(244, 244, 244);
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
		#content_el{
			margin-top: 15px;
			width: 100%;
			/* 단 나누기 */
			display: grid;
			grid-template-columns: repeat(2, 1fr);
		}
		#content_el_1{
			height: 130px;
			width: 100%;
		}
		#flea_con{
			height: 90%;
			width: 95%;
			border-radius: 10px;
			margin: auto;
			margin-top: 5px;
		}
		#flea_con:hover{
			background-color:rgba(0, 0, 0, 0.1);
			cursor: pointer;
		}
		#flea_con>div{
			float: left;
		}
		#flea_img{
			border-radius: 10px;
			height: 115px;
			width: 30%;
		}
		#flea_img img{
			border-radius: 10px;
			width: 100%;
			height: 100%;
		}
		#flea_text{
			padding-top: 15px;
			padding-left: 10px;
		}
		#flea_title span{
			font-size: 18px;
			color: black;
		}
		#flea_price{
			padding-top: 5px;
			font-size: 15px;
			width: 250px;
			height: 50px;
			color: rgb(129, 129, 129);
		}
		#flea_reply{
			margin-top: -25px;
			font-size: 15px;
		}
	</style>

</head>
<body>
	<%@ include file = "../../views/common/header.jsp" %>
	
	<div id="main_wrap">
		<div id="main_banner">
			<img src="resources/css_img/jobs_banner_img.png">
		</div>
		<div id="main_content">
			<div id="content_title">
				<div id="content_title_el1"><span>인기 당근알바</span></div>
				<div id="content_title_el2">
					<div id="flea_search">
						<input type="text" placeholder="주소로 검색">
					</div>
					<div class="btn_el" id="flea_btn">
						<button><img src="resources/css_img/search_img.png" style="width: 70%; height: 70%"></button>
					</div>
				</div>
				<div id="content_title_el3">
					<div id="content_btn_area">
						<%if (loginMember == null) {%>
							<!-- 로그인이 안되어있으면 알림창으로 띄워주기 -->
							<button onclick="alert('로그인이 필요합니다.')">글쓰기</button>
						<%} else{%>
							<!-- 로그인 완료시 글작성 페이지로 -->
							<button onclick="location.href='<%=contextPath%>/insert.bo'">글쓰기</button>
						<%} %>
					</div>
				</div>
			</div>
			<div id="content_el">
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title"><span>인천 하객알바 구합니다.</span></div>
							<div id="flea_price"><span>인천광역시 부평구 부평동</span></div>
							<div id="flea_reply"><strong>건당 16,000</strong></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>