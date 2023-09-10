<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import = "java.util.ArrayList,
    		com.danngn.board.board_board.model.vo.Board,
    		com.danngn.common.vo.PageInfo"%>
<%
	/* 게시물 리스트 꺼내기 */
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	/* 페이지 */
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	/* 카테고리 */
	int subCate = Integer.parseInt(String.valueOf(request.getAttribute("subCate")));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#job{
            color: rgb(246, 117, 37) !important;
        }
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
			width: 43%;
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
			width: 17%;
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
			height: 28px;
			margin-top: 75px;
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
			float: left !important;
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
			color: rgb(129, 129, 129);
		}
		#list_empty{
			margin-left: 250px;
			width: 200px;
			font-size: 18px;
			color: rgb(129, 129, 129);
		}
		.page_area{
			width: 800px;		
			margin: auto;
		}
		.page{
			padding: 20px;
			width: 100px;
			margin: auto;
		}
		.page button{
			whidth: 15px;
			height: 30px;
			border-radius: 2px;
			border: 0.1em solid rgb(231, 231, 231);	
        	background-color: white;
		}
		.page button:hover{
        	background-color: rgb(244, 244, 244);
        	cursor: pointer;
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
			<form action="<%=contextPath %>/jobsListForm.bo" method="GET">
				<div id="content_title">
					<div id="content_title_el1"><span>인기 당근알바</span></div>
					<div id="content_title_el2">
						<div id="flea_search">
							<input type="hidden" name="cate" value="3">
							<input type="hidden" name="currentPage" value="1">
							<input type="hidden" name="subCategory" value="1">
							<input type="text" name="search" id="search" placeholder="주소로 검색">
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
			</form>
			<div id="content_el">
				<%for (Board b : list) {%>
					<div class="box" id="content_el_1" onclick="location.href='<%=contextPath%>/boardDetail.bo?cate=3&boardNo=<%=b.getBoardNo()%>&memNo=<%=b.getMemberNo()%>'">
						<div id="flea_con">
							<div id="flea_img">
								<img src="<%=contextPath + b.getTitleImg()%>">
							</div>
							<div id="flea_text">
								<%if (b.getTitle().length()>=10){%>
									<!-- 제목이 10자 이상이면 문자열 자르기 -->
									<div id="flea_title"><span><strong><%=b.getTitle().substring(0, 10) %>...</strong></span></div>
								<%}else {%>
									<!-- 제목이 10자 이하면 전체 출력 -->
									<div id="flea_title"><span><strong><%=b.getTitle() %></strong></span></div>
								<%} %>
								<div id="flea_price"><span><%=b.getAddress() %></span></div>
								<div id="flea_reply">댓글5 - 조회수 <%=b.getCount() %></div>
							</div>
						</div>
					</div>
				<%} %>
				<%if (list.isEmpty()) {%>
					<div id="list_empty">
						<span>검색 결과가 없습니다.</span>
					</div>
				<%} %>
			</div>
		</div>
		<div class="page_area">
			<div class="page">
				<%for (int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
					<%if (i!=pi.getCurrentPage()) {%>
						<button type="button" onclick="location.href='<%=contextPath%>/jobsListForm.bo?cate=3&currentPage=<%=i%>&subCategory=<%=subCate%>'"><%=i %></button>
					<%}else {%>
						<button type="button" disabled><%=i %></button>
					<%} %>
				<%} %>
			</div>
		</div>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>