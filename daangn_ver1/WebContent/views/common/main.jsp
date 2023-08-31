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
			width: 70%;
		}
		#content_title_el1 span{
			font-weight: 600;
			font-size:32px;
			line-height: 5.3;
			margin-left: 260px;
			cursor: default;
		}
		#content_title_el2{
			height: 100%;
			width: 30%;
		}
		#flea_search{
			background-color: yellow;
			height: 30px;
			width: 130px;
			margin-top: 75px;
			margin-left: 50px;
		}
		#flea_search select{
			width: 100%;
			height: 100%;
			outline: none;
		}
		#flea_btn{
			width: 35px;
			height: 28px;
			margin-top: 76px;
			margin-left: 5px;
		}
		#flea_btn button{
			width: 100%;
			height: 100%;
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
			width: 100%;
			margin-top: 10px;
			/* 단 나누기 */
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			/* column-count: 2;
			-webkit-column-count: 2; */
		}
		#content_el_1{
			height: 360px;
			width: 100%;
		}
		#flea_con{
			height: 330px;
			width: 80%;
			border-radius: 10px;
			margin: auto;
			margin-top: 20px;
		}
		#flea_con:hover{
			background-color:rgba(0, 0, 0, 0.1);
			cursor: pointer;
		}
		#flea_img{
			border-radius: 10px;
			height: 220px;
			width: 100%;
		}
		#flea_img img{
			width: 100%;
			height: 100%;
		}
		#flea_text{
			padding-top: 10px;
		}
		#flea_title{
			font-size: 16px;
		}
		#flea_price{
			padding-top: 8px;
			font-size: 16px;
		}
		#flea_address{
			padding-top: 6px;
			font-size: 14px;
		}
		#flea_reply{
			padding-top: 2px;
			font-size: 12px;
			color: rgb(143, 143, 143);
		}
	</style>

</head>
<body>
	<div id="main_wrap">
		<div id="main_banner">
			<img src="resources/css_img/fleamarket_banner_img.png">
		</div>
		<div id="main_content">
			<div id="content_title">
				<div id="content_title_el1"><span>중고거래 인기매물</span></div>
				<div id="content_title_el2">
					<div id="flea_search">
						<select name="" id="">
					        <option value="">키워드 검색</option>
					        <option value="">디지털기기</option>
					        <option value="">스포츠/레저</option>
					        <option value="">생활/가전</option>
					        <option value="">티켓/교환권</option>
					        <option value="">기타</option>
					    </select>
					</div>
					<div class="btn_el" id="flea_btn">
						<button><img src="resources/css_img/search_img.png" alt="" style="width: 70%; height: 70%"></button>
					</div>
				</div>
			</div>
			<div id="content_el">
				<div id="content_el_1" onclick="fleaGo()">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div id="content_el_1">
					<div id="flea_con">
						<div id="flea_img">
							<img src="">
						</div>
						<div id="flea_text">
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
		//플리마켓 상세페이지로 가는 함수
		function fleaGo(){
			location.href="/daangn_ver1/fleaDetail.bo";
		}
	
	</script>
</body>
</html>