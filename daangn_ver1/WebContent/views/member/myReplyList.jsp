<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import = "java.util.ArrayList,
    		com.danngn.board.board_reply.model.vo.Reply,
    		com.danngn.common.vo.PageInfo"%>
<%
	/* 게시물 리스트 꺼내기 */
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
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
            /* height: 730px; */
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
        #enroll_text_3{
        	color: rgb(53, 53, 53) !important;
        }
        #boardList{
        	/* background-color: red; */
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
        	margin-top: 5px;
        	font-size: 14px;
        	color: rgb(138, 138, 138);
        }
        #list_title{
        	font-size: 14px;
        	color: rgb(138, 138, 138);
        	/* margin-top: 5px; */
        }
        #list_count{
       		margin-top: 10px;
        	font-size: 18px;
        	/* color: rgb(138, 138, 138); */
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
			<%for (Reply r : list) {%>
				<div id="boardList" onclick="location.href='<%=contextPath%>/boardDetail.bo?cate=<%=r.getCategory() %>&boardNo=<%=r.getBoardNo()%>&memNo=<%=r.getMemberNo()%>'">
					<div id="list_img_area">
						<img src="<%=contextPath + r.getTitleImg()%>">
					</div>
					<div id="list_text_area">
						<%if(r.getCategory().equals("1")) {%>
							<div id="list_cate"><span><strong>&lt;중고거래&gt;</strong></span></div>
						<%}else if(r.getCategory().equals("2")) {%>
							<div id="list_cate"><span><strong>&lt;동네가게&gt;</strong></span></div>
						<%}else {%>
							<div id="list_cate"><span><strong>&lt;알바&gt;</strong></span></div>
						<%} %>
						<div id="list_title"><span><strong> - <%=r.getTitle() %></strong></span></div>
						<div id="list_count"><span><strong><%=r.getContent() %></strong></span></div>
					</div>
				</div>
				<hr style="width: 700px;">
			<%} %>
		</div>
		<div class="page_area">
			<div class="page">
				<%for (int i=pi.getStartPage(); i<=pi.getEndPage(); i++) {%>
					<%if (i!=pi.getCurrentPage()) {%>
						<button type="button" onclick="location.href='<%=contextPath%>/myReply.me?currentPage=<%=i%>'"><%=i %></button>
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