<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.danngn.board.board_board.model.vo.Board"%>
<%
	/* 게시물 꺼내기 */
	Board b = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#board_wrap{
			width: 800px;
			margin: auto;
		}
		#board_title{
			height: 100px;
			line-height: 5;
			font-size: 23px;
		}
		#content_area{
			width: 100%;
		}
		.board_area, .board_area1, .board_area2{
			width: 100%;
			height: 50px;
		}
		.board_area>div, .board_area1>div, .board_area2>div{
			float: left;
		}
		.board_area_1{
			width: 140px;
			height: 100%;
			line-height: 4;
		}
		.board_area_2{
			height: 100%;
			line-height: 4;
		}
		.board_area_2 select{
			height: 30px;
			outline: none;
			cursor: pointer;
		}
		.board_area_2 input{
			border-top: 0px;
			border-left: 0px;
			border-right: 0px;
			border-bottom: 0.5px solid rgb(194, 194, 194);
			width: 500px;
			font-size: 18px;
			outline: none;
			background: white;
		}
		#content_id{
			height: 180px;
		}
		#content_id textarea{
			margin-top: 20px;
			border: 0.5px solid rgb(194, 194, 194);
			height: 150px;
			width: 500px;
			resize: none;
			outline: none;
		}
		#board_area_2 img{
			width: 150px;
			height: 120px;
		}
		#board_btn_area{
			height: 110px;
		}
		#board_btn{
			width: 500px;
			height: 45px;
			margin-top: 30px;
		}
		.board_area_2 button{
			width: 100%;
			height: 100%;
			background-color: rgb(255, 102, 31);
			border-radius: 20px;
			font-weight: 600;
			font-size: 16px;
			cursor: pointer;
		}
		.board_area_2 button:hover{
			opacity: 0.7;
		}
		#open_m, #close_m{
			margin-left: 5px;
		}
		#job_date{
			width: 120px !important;
			font-size: 17px !important;
		}
		.job_area{
			width: 120px !important;
		}
		.job_area input{
			width: 100%;
		}
	</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<div id="board_wrap">
		<div id="board_title">
			<strong>글 등록하기</strong>
		</div>
		<div id="content_area">
			<form action="<%=contextPath %>/update.bo?boardNo=<%=b.getBoardNo() %>" method="post" id="content_area_form" enctype="multipart/form-data">
				<!-- 회원 번호도 넘기기 -->
				<input type="hidden" name="memberNo" id="memberNo" value="<%=loginMember.getMemberNo()%>">
				<div class="board_area">
					<div class="board_area_1"><strong>카테고리 분류</strong></div>
					<!-- 들어온 카테고리에 따라 -->
					<div class="board_area_2" id="board_area_2">
						<select name="category" id="category">
				            <option value="0">카테고리 분류</option>
				            <option value="1">중고거래</option>
				            <option value="2">동네가게</option>
				            <option value="3">알바</option>
				        </select>
						<%if (b.getCategory().equals("1")) {%>
						        <select name="subCategory" id="subCategory" class="newSelect">
									<option value="1">디지털기기</option>
									<option value="2">스포츠/레저</option>
									<option value="3">생활/가전</option>
									<option value="4">티켓/교환권</option>
									<option value="5">기타</option>
								</select>
						<%}else {%>
						<%} %>
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>제목</strong></div>
					<div class="board_area_2">
						<input type="text" name="title" id="title">
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>작성자</strong></div>
					<div class="board_area_2">
						<input type="text" value="<%=loginMember.getMemberId() %>" disabled>
					</div>
				</div>
				<div class="board_area add1">
					<div class="board_area_1"><strong>주소</strong></div>
					<div class="board_area_2">
						<input type="text" name="address" id="address" onclick="postcode();">
					</div>
				</div>
				<!-- 들어온 카테고리에 따라 -->
				<%if (b.getCategory().equals("1")) {%>
					<div class="board_area1">
						<div class="board_area_1"><strong>가격</strong></div>
						<div class="board_area_2">
							<input type="number" name="price" id="price" value="<%=b.getPrice()%>">
						</div>
					</div>
					<div class="board_area add3" id="content_id">
						<div class="board_area_1"><strong>내용</strong></div>
						<div class="board_area_2">
							<textarea name="content" id="content"><%=b.getContent() %></textarea>
						</div>
					</div>
				<%}else {%>
				<%} %>
				<div class="board_area">
					<div class="board_area_1"><strong>첨부파일</strong></div>
					<div class="board_area_2">
						<input type="file" id="file1" name="file1">
					</div>
				</div>
				<div class="board_area" id="board_btn_area">
					<div class="board_area_1"></div>
					<div class="board_area_2" id="board_btn">
						<button type="submit">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file = "../common/footer.jsp" %>
	
	<script>
		
		var category = document.getElementById("category");
		var address = document.getElementById("address");
		var board_area1 = document.createElement("div");
		var board_area2 = document.createElement("div");
		var newSelect = document.createElement("select");
		/* 카테고리 name 넣어주기 */
		newSelect.name = "subCategory";
		
		/* 대분류 카테고리마다 속성 변경하기 */
		category.addEventListener("change", function(){
			
			if(this.value == "1"){ /* 중고거래 선택시 */
				
				/* 주소 불러오기 */
				address.value="<%=loginMember.getAddress() %>";
				address.disabled = true;
				
				/* 새로운 가격 div 생성 */
				board_area1.className = "board_area1";
				board_area1.innerHTML= '<div class="board_area_1">'+
											'<strong>가격</strong>'+
										'</div>'+
										'<div class="board_area_2">'+
											'<input type="number" name="price" id="price">'+
										'</div>';
				document.querySelector(".add1").after(board_area1);
				
			}else if(this.value == "2"){ /* 동네가게 선택시 */
				
				/* 새로운 카테고리 생성 */
				newSelect.className = "newSelect";
				newSelect.innerHTML= '<select name="subCategory" id="subCategory">'+
										'<option value="1">식당</option>'+
										'<option value="2">카페</option>'+
										'<option value="3">뷰티/미용</option>'+
										'<option value="4">운동</option>'+
										'<option value="5">기타</option>'+
									'</select>';
				document.querySelector("#board_area_2").appendChild(newSelect);
				
				/* 입력되어있는 주소 제거 */
				address.value="";
				address.disabled = false;
				
				/* 새로운 오픈시간 div 생성 */
				board_area1.className = "board_area2";
				board_area1.innerHTML= '<div class="board_area_1 add2">'+
											'<strong>매장 시간</strong>'+
										'</div>'+
										'<div class="board_area_2">'+
											'<select name="open_h" id="open_h">'+
												'<option value="00">00시</option>'+
												'<option value="08">08시</option>'+
												'<option value="09">09시</option>'+
												'<option value="10">10시</option>'+
												'<option value="11">11시</option>'+
												'<option value="12">12시</option>'+
											'</select>'+
											'<select name="open_m" id="open_m">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
											'<strong> ~ </strong>'+
												'<select name="close_h" id="close_h">'+
												'<option value="00">00시</option>'+
												'<option value="17">17시</option>'+
												'<option value="18">18시</option>'+
												'<option value="19">19시</option>'+
												'<option value="20">20시</option>'+
												'<option value="21">21시</option>'+
											'</select>'+
											'<select name="close_m" id="close_m">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
										'</div>';
				document.querySelector(".add1").after(board_area1);
				
			}else if(this.value == "3"){ /* 알바 선택시 */
				
				/* 입력되어있는 주소 제거 */
				address.value="";
				address.disabled = false;
				
				/* 새로운 근무 날짜 div 생성 */
				board_area1.className = "board_area2";
				board_area1.innerHTML= '<div class="board_area_1">'+
											'<strong>근무 날짜</strong>'+
										'</div>'+
										'<div class="board_area_2 job_area">'+
											'<input type="date" name="jobDate" id="jobDate">'+
										'</div>';
				document.querySelector(".add1").after(board_area1);

				/* 1차분류 카테고리 삭제 */
				document.querySelector("#board_area_2").removeChild(newSelect);
				
			}else{
				/* 1차분류 카테고리 삭제 */
				document.querySelector("#board_area_2").removeChild(newSelect);
				
				/* 입력되어있는 주소 제거 */
				address.value="";
				address.disabled = false;
			}
		})
		
		/* 다음 주소 검색 API */
    	function postcode(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	//원하는 값 주소창에 넣어주기
		        	document.getElementById("address").value=data.address;
		        }
		    }).open();	
    	}
		
		<%if (b!=null && b.getCategory().equals("1")) {%>
			$(function(){
				//값 집어넣기
				$("#category").val('<%=b.getCategory()%>').attr("selected","selected");
				$("#subCategory").val('<%=b.getSubCategory()%>').attr("selected","selected");
				$("#title").val('<%=b.getTitle()%>');
				$("#address").val('<%=b.getAddress()%>');
			})
		<%}else {%>
			console.log("222");
		<%} %>
		
	</script>
</body>
</html>