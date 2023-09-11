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
		#flea{
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
		.page_area{
			width: 800px;		
			margin: auto;
			/* background-color: red; */
		}
		.page{
			padding: 20px;
			width: 100px;
			/* background-color:blue; */
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
			<img src="resources/css_img/fleamarket_banner_img.png">
		</div>
		<form action="<%=contextPath %>/fleaListForm.bo" method="GET">
			<div id="main_content">
				<div id="content_title">
					<div id="content_title_el2">
						<div id="flea_search">
							<input type="hidden" name="cate" value="1">
							<input type="hidden" name="currentPage" value="1">
							<select name="subCategory" id="subCategory">
						        <option value="0">키워드 검색</option>
						        <option value="1">디지털기기</option>
						        <option value="2">스포츠/레저</option>
						        <option value="3">생활/가전</option>
						        <option value="4">티켓/교환권</option>
						        <option value="5">기타</option>
						    </select>
						</div>
						<div class="btn_el" id="flea_btn">
							<button type="submit"><img src="resources/css_img/search_img.png" style="width: 70%; height: 70%"></button>
						</div>
					</div>
					<div id="content_title_el1"><span>중고거래 인기매물</span></div>
					<div id="content_title_el3">
						<div id="content_btn_area">
							<%if (loginMember == null) {%>
								<!-- 로그인이 안되어있으면 알림창으로 띄워주기 -->
								<button type="button" onclick="alert('로그인이 필요합니다.'); location.href='<%=contextPath%>/login.me'">글쓰기</button>
							<%} else{%>
								<!-- 로그인 완료시 글작성 페이지로 -->
								<button type="button" onclick="location.href='<%=contextPath%>/insert.bo'">글쓰기</button>
							<%} %>
						</div>
					</div>
				</div>
				<div id="content_el">
					<%for (Board b : list) {%>
						<div class="box" id="content_el_1" onclick="location.href='<%=contextPath%>/boardDetail.bo?cate=1&boardNo=<%=b.getBoardNo()%>&memNo=<%=b.getMemberNo()%>'">
							<div id="flea_con">
								<div id="flea_img">
									<img src="<%=contextPath + b.getTitleImg()%>">
								</div>
								<div id="flea_text">
									<div id="flea_title"><%=b.getTitle() %></div>
									<div id="flea_price"><strong><fmt:formatNumber value="<%=b.getPrice() %>" pattern="#,###"/></strong>원</div>
									<div id="flea_address"><%=b.getAddress() %></div>
									<div id="flea_reply">조회수 <%=b.getCount() %></div>
								</div>
							</div>
						</div>
					<%} %>
				</div>
			</div>
		</form>
		<div class="page_area">
			<div class="page">
				<%for (int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
					<%if (i!=pi.getCurrentPage()) {%>
						<button type="button" onclick="location.href='<%=contextPath%>/fleaListForm.bo?cate=1&currentPage=<%=i%>&subCategory=<%=subCate%>'"><%=i %></button>
					<%}else {%>
						<button type="button" disabled><%=i %></button>
					<%} %>
				<%} %>
			</div>
		</div>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
	
	<script>
		//카테고리 검색시 값 유지
		$(function(){
			$("#subCategory").val("<%=subCate%>").prop("selected", true);
		})
	</script>
</body>
</html>