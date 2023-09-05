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
			width: 40%;
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
			width: 30%;
		}
		#content_title_el3{
			height: 100%;
			width: 30%;
		}
		#flea_search{
			background-color: yellow;
			height: 30px;
			width: 130px;
			margin-top: 75px;
			margin-left: 30px;
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
	<%@ include file = "views/common/header.jsp" %>
	
	<div id="main_wrap">
		<div id="main_banner">
			<img src="resources/css_img/fleamarket_banner_img.png">
		</div>
		<div id="main_content">
			<div id="content_title">
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
						<button><img src="resources/css_img/search_img.png" style="width: 70%; height: 70%"></button>
					</div>
				</div>
				<div id="content_title_el1"><span>중고거래 인기매물</span></div>
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
							<div id="flea_title">아이패드</div>
							<div id="flea_price"><strong>171,000</strong>원</div>
							<div id="flea_address">서울 강남구 삼성2동</div>
							<div id="flea_reply">댓글5 - 조회수 20</div>
						</div>
					</div>
				</div>
				<div class="box" id="content_el_1">
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
				<div class="box" id="content_el_1">
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
				<div class="box" id="content_el_1">
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
				<div class="box" id="content_el_1">
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
				<div class="box" id="content_el_1">
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
				<div class="box" id="content_el_1">
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
				<div class="box" id="content_el_1">
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
				<div class="box" id="content_el_1">
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
	
		/* window.onload = function(){
			location.href = "/daangn_ver1/List.bo";
		} */
	
		//플리마켓 상세페이지로 가는 함수
		function fleaGo(){
			location.href="/daangn_ver1/fleaDetail.bo";
		}

        //무한스크롤 기능 구현
        var count = 9;
        var lastBox = document.querySelector(".box:last-child");

        //API 객체 생성
        var observer = new IntersectionObserver(//콜백함수, 옵션
            //콜백함수
            function (entries){
                entries.forEach(function (entry){
                    // 뷰포트와 엘리먼트의 교차 여부를 확인하고, 카운트가 18보다 작은지 확인
                    if(entry.isIntersecting && count < 18){
                        //6번 반복하는 루프
                        for(var i=0; i<6; i++){
                            var newBox = document.createElement("div");
                            newBox.className = "box";
                            newBox.innerHTML = '<div id="flea_con">'+
                                                    '<div id="flea_img">'+
                                                        '<img src="">'+
                                                    '</div>' +
                                                    '<div id="flea_text">'+
                                                        '<div id="flea_title">아이패드</div>'+
                                                        '<div id="flea_price"><strong>171,000</strong>원</div>'+
                                                        '<div id="flea_address">서울 강남구 삼성2동</div>'+
                                                        '<div id="flea_reply">댓글5 - 조회수 20</div>'+
                                                    '</div>'+
                                                '</div>';
                            document.querySelector("#content_el").appendChild(newBox);
                        }
                        //기존 lastBox에 대한 관찰을 멈춤
                        observer.unobserve(lastBox);
                        // 새로운 last box 등록
                        lastBox = document.querySelector(".box:last-child");
                        //새로운 lastBox에 대한 IntersectionObserver를 등록
                        // 새로운 마지막 박스를 관찰
                        observer.observe(lastBox);
                    }
                });
            },
            //옵션
            {
                //몇 % 교차했을때 callback을 실행할것인가 결정하는 값 (0.0 ~ 1.0)
                threshold : 1,
            }
        );
        // 초기에 마지막 박스 관찰 시작
        observer.observe(lastBox);
	</script>
	
	<%@ include file = "views/common/footer.jsp" %>
</body>
</html>