<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#board_wrap{
			width: 800px;
			/* background-color: red; */
			margin: auto;
		}
		#board_title{
			height: 100px;
			line-height: 5;
			font-size: 23px;
		}
		#content_area{
			width: 100%;
			/* background-color: blue; */
		}
		.board_area, .board_area2, .board_area3{
			width: 100%;
			height: 50px;
			/* border: 1px solid black; */
			/* line-height: 4; */
		}
		.board_area>div, .board_area2>div, .board_area3>div{
			float: left;
		}
		.board_area_1{
			width: 140px;
			height: 100%;
			/* border: 1px solid black; */
			line-height: 4;
		}
		.board_area_2{
			/* width: 80%; */
			/* border: 1px solid black; */
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
			/* background-color: red; */
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
			/* background-color: red; */
		}
		#board_btn{
			width: 500px;
			height: 45px;
			/* background-color: blue; */
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
		#open_min{
			margin-left: 5px;
		}
		#job_date input{
			width: 120px;
			font-size: 17px;
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
			<form id="content_area_form">
				<div class="board_area">
					<div class="board_area_1"><strong>카테고리 분류</strong></div>
					<div class="board_area_2" id="board_area_2">
						<select name="all_cate" id="all_cate">
				            <option value="없음">카테고리 분류</option>
				            <option value="중고거래">중고거래</option>
				            <option value="동네가게">동네가게</option>
				            <option value="알바">알바</option>
				        </select>
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>제목</strong></div>
					<div class="board_area_2">
						<input type="text">
					</div>
				</div>		
				<div class="board_area">
					<div class="board_area_1"><strong>작성자</strong></div>
					<div class="board_area_2">
						<input type="text" value="<%=loginMember.getMemberId() %>" placeholder="dd" disabled>
					</div>
				</div>
				<div class="board_area add1">
					<div class="board_area_1"><strong>주소</strong></div>
					<div class="board_area_2">
						<input type="text" name="address" id="address" onclick="postcode();">
					</div>
				</div>
				<div class="board_area add3" id="content_id">
					<div class="board_area_1"><strong>내용</strong></div>
					<div class="board_area_2">
						<textarea name="" id=""></textarea>
					</div>
				</div>
				<div class="board_area">
					<div class="board_area_1"><strong>첨부파일</strong></div>
					<div class="board_area_2">
						<input type="file" id="file1" name="file1">
					</div>
				</div>
				<div class="board_area" id="board_btn_area">
					<div class="board_area_1"></div>
					<div class="board_area_2" id="board_btn">
						<button>등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file = "../common/footer.jsp" %>
	
	<script>
		
		var category = document.getElementById("all_cate");
		var address = document.getElementById("address");
		var board_area = document.createElement("div");
		var board_area2 = document.createElement("div");
		var board_area3 = document.createElement("div");
		var newSelect = document.createElement("select");
		
		/* 대분류 카테고리마다 속성 변경하기 */
		category.addEventListener("change", function(){
			
			
			/* 중고거래 클릭시 */
			if(this.value == "중고거래"){
				/* 새로운 카테고리 생성 */
				newSelect.className = "newSelect";
				newSelect.innerHTML= '<select name="" id="">'+
										'<option value="디지털기기">디지털기기</option>'+
										'<option value="스포츠/레저">스포츠/레저</option>'+
										'<option value="생활/가전">생활/가전</option>'+
										'<option value="티켓/교환권">티켓/교환권</option>'+
										'<option value="기타">기타</option>'+
									'</select>';
				document.querySelector("#board_area_2").appendChild(newSelect);
				
				/* 주소 불러오기 */
				address.value="<%=loginMember.getAddress() %>";
				address.disabled = true;
				
				/* 새로운 가격 div 생성 */
				board_area.className = "board_area";
				board_area.innerHTML= '<div class="board_area_1">'+
										'<strong>가격</strong>'+
									'</div>'+
									'<div class="board_area_2">'+
										'<input type="number" name="price" id="price">'+
									'</div>';
				document.querySelector(".add1").after(board_area);
			}else{
				/* 새로운 카테고리, div 제거 */
				/* document.querySelector("#board_area_2").removeChild(newSelect);
				document.querySelector("#content_area_form").removeChild(board_area); */
				
				/* 입력되어있는 주소 제거 */
				address.value="";
				address.disabled = false;
			}
			
			/* 동네가게 클릭시 */
			if(this.value == "동네가게"){
				/* 새로운 카테고리 생성 */
				newSelect.className = "newSelect";
				newSelect.innerHTML= '<option value="식당">식당</option>'+
									'<option value="카페">카페</option>'+
									'<option value="뷰티/미용">뷰티/미용</option>'+
									'<option value="운동">운동</option>'+
									'<option value="기타">기타</option>';
				document.querySelector("#board_area_2").appendChild(newSelect);
				
				/* 입력되어있는 주소 제거 */
				/* address.value="";
				address.disabled = false; */
				
				/* 새로운 오픈시간 div 생성 */
				board_area.className = "board_area";
				board_area.innerHTML= '<div class="board_area_1 add2">'+
											'<strong>매장 시간</strong>'+
										'</div>'+
										'<div class="board_area_2">'+
											'<select name="" id="">'+
												'<option value="">00시</option>'+
												'<option value="8">08:00시</option>'+
												'<option value="9">09:00시</option>'+
												'<option value="10">10:00시</option>'+
												'<option value="11">11:00시</option>'+
												'<option value="12">12:00시</option>'+
											'</select>'+
											'<select name="" id="open_min">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
											'<strong> ~ </strong>'+
												'<select name="" id="">'+
												'<option value="">00시</option>'+
												'<option value="17">17:00시</option>'+
												'<option value="18">18:00시</option>'+
												'<option value="19">19:00시</option>'+
												'<option value="20">20:00시</option>'+
												'<option value="21">21:00시</option>'+
											'</select>'+
											'<select name="" id="open_min">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
										'</div>';
				document.querySelector(".add1").after(board_area);
			}else{
				/* 새로운 카테고리, div 제거 */
				/* document.querySelector("#board_area_2").removeChild(newSelect);
				document.querySelector("#content_area_form").removeChild(board_area); */
				
				/* 입력되어있는 주소 제거 */
				/* address.value="";
				address.disabled = false; */
			}
			
			/* 알바 클릭시 */
			if(this.value == "알바"){
				
				/* 1차분류 카테고리 삭제 */
				/* document.querySelector("#board_area_2").removeChild(newSelect); */
				
				/* 새로운 카테고리 생성 */
				/* newSelect.className = "newSelect";
				newSelect.innerHTML= '<select name="" id="">'+
										'<option value="디지털기기">디지털기기</option>'+
										'<option value="스포츠/레저">스포츠/레저</option>'+
										'<option value="생활/가전">생활/가전</option>'+
										'<option value="티켓/교환권">티켓/교환권</option>'+
										'<option value="기타">기타</option>'+
									'</select>';
				document.querySelector("#board_area_2").appendChild(newSelect); */
				
				/* 주소 불러오기 */
				<%-- address.value="<%=loginMember.getAddress() %>";
				address.disabled = true; --%>

				
				/* 새로운 오픈시간 div 생성 */
				board_area.className = "board_area";
				board_area.innerHTML= '<div class="board_area_1 add2">'+
											'<strong>근무 시간</strong>'+
										'</div>'+
										'<div class="board_area_2">'+
											'<select name="" id="">'+
												'<option value="">00시</option>'+
												'<option value="8">08:00시</option>'+
												'<option value="9">09:00시</option>'+
												'<option value="10">10:00시</option>'+
												'<option value="11">11:00시</option>'+
												'<option value="12">12:00시</option>'+
											'</select>'+
											'<select name="" id="open_min">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
											'<strong> ~ </strong>'+
												'<select name="" id="">'+
												'<option value="">00시</option>'+
												'<option value="17">17:00시</option>'+
												'<option value="18">18:00시</option>'+
												'<option value="19">19:00시</option>'+
												'<option value="20">20:00시</option>'+
												'<option value="21">21:00시</option>'+
											'</select>'+
											'<select name="" id="open_min">'+
												'<option value="00">00분</option>'+
												'<option value="10">10분</option>'+
												'<option value="20">20분</option>'+
												'<option value="30">30분</option>'+
												'<option value="40">40분</option>'+
												'<option value="50">50분</option>'+
											'</select>'+
										'</div>';
				document.querySelector(".add1").after(board_area);

				/* 새로운 근무 날짜 div 생성 */
				board_area3.className = "board_area3";
				board_area3.innerHTML= '<div class="board_area_1">'+
											'<strong>근무 날짜</strong>'+
										'</div>'+
										'<div class="board_area_2" id="job_date">'+
											'<input type="date" name="" id="">'+
										'</div>';
				document.querySelector(".add1").after(board_area3);

				/* 새로운 시급 div 생성 */
				board_area2.className = "board_area2";
				board_area2.innerHTML= '<div class="board_area_1">'+
											'<strong>시급</strong>'+
										'</div>'+
										'<div class="board_area_2">'+
											'<input type="number" name="price" id="price">'+
										'</div>';
				document.querySelector(".add3").before(board_area2);
			}else{
				/* 새로운 카테고리, div 제거 */
				/* document.querySelector("#board_area_2").removeChild(newSelect);*/
				/* document.querySelector("#content_area_form").removeChild(board_area); */
				
				/* 입력되어있는 주소 제거 */
				/* address.value="";
				address.disabled = false; */
			}
			
			/* 대분류 선택 안할시 */
			if(this.value == "없음"){
				/* document.querySelector("#board_area_2").removeChild(newSelect);
				document.querySelector("#content_area_form").removeChild(board_area); */
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
		
	</script>
</body>
</html>