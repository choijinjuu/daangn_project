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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        #enroll_wrap{
            width: 800px;
            margin: auto;
            border-radius: 20px;
        }
        #enroll_text{
        	width: 700px;
        	height: 35px;
        	margin: auto;
        	padding-top: 20px;
        }
        #enroll_text>div{
        	float: left;
        	width: 33%;
        	margin: auto;
        }
        #enroll_text span{
        	font-size: 18px;
        	margin-left: 75px;
        	color: rgb(192, 192, 192);
        }
        #enroll_text span:hover{
        	color: rgb(53, 53, 53);
        	cursor: pointer;
        }
        #enroll_text_2{
        	color: rgb(53, 53, 53) !important;
        }
        #boardList{
        	width: 80%;
        	height: 90px;
        	padding: 10px;
        	margin: auto;
        }
        #boardList:hover{
        	background-color: rgb(231, 231, 231);
        	cursor: pointer;
        }
        #boardList>div{
        	float: left;
        }
        #list_img_area{
        	width: 100px;
        	height: 90px;
        	border: 1px solid black;
        }
        #list_img_area img{
        	width: 100%;
        	height: 100%;
        	border-radius: 5px;
        }
        #list_text_area{
        	margin-left: 10px;
        }
        #list_cate{
        	margin-top: 10px;
        
        }
        #list_title{
        	font-size: 18px;
        	margin-top: 5px;
        }
        #list_count{
        	font-size: 15px;
        	color: rgb(138, 138, 138);
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
	<%@ include file = "../common/header.jsp" %>
	
	<hr style="border: 0.3px solid rgb(232, 232, 232);">
	
	<div id="enroll_wrap">
		<div id="enroll_text">
			<div><span id="enroll_text_1" onclick="location.href='<%=contextPath%>/updateMy.me'"><strong>내 정보</strong></span></div>
			<div><span id="enroll_text_2" onclick="location.href='<%=contextPath%>/myBoard.me?currentPage=1'"><strong>나의 글</strong></span></div>
			<div><span id="enroll_text_3" onclick="location.href='<%=contextPath%>/myReply.me?currentPage=1'"><strong>나의 댓글</strong></span></div>
		</div>
		<hr id="enroll_text_hr">
		<div id="boardList_area">
			<%for (Board b : list) {%>
				<div id="boardList" onclick="location.href='<%=contextPath%>/boardDetail.bo?cate=<%=b.getCategory() %>&boardNo=<%=b.getBoardNo()%>&memNo=<%=b.getMemberNo()%>'">
					<div id="list_img_area">
						<img src="<%=contextPath + b.getTitleImg()%>">
					</div>
					<div id="list_text_area">
						<%if(b.getCategory().equals("1")) {%>
							<div id="list_cate"><span><strong>중고거래</strong></span></div>
						<%}else if(b.getCategory().equals("2")) {%>
							<div id="list_cate"><span><strong>동네가게</strong></span></div>
						<%}else {%>
							<div id="list_cate"><span><strong>알바</strong></span></div>
						<%} %>
						<div id="list_title"><span><strong><%=b.getTitle() %></strong></span></div>
						<div id="list_count"><span>댓글 5 - 조회수 <%=b.getCount() %></span></div>
					</div>
				</div>
				<hr style="width: 700px;">
			<%} %>
		</div>
		<div class="page_area">
			<div class="page">
				<%for (int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
					<%if (i!=pi.getCurrentPage()) {%>
						<button type="button" onclick="location.href='<%=contextPath%>/myBoard.me?currentPage=<%=i%>'"><%=i %></button>
					<%}else {%>
						<button type="button" disabled><%=i %></button>
					<%} %>
				<%} %>
			</div>
		</div>
    </div>
    
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>