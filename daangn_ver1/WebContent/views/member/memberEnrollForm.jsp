<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        #enroll_wrap{
            width: 800px;
            height: 500px;
            margin: auto;
            border-radius: 20px;
            background-color: rgb(255, 239, 229);
        }
        #enroll_text{
        	width: 700px;
        	height: 70px;
        	margin: auto;
        	padding-top: 20px;
        }
        #enroll_text span{
        	font-size: 25px;
        	font-weight: 500;
        }
        #enroll_form{
            width: 700px;
            margin: auto;
        }
        .enroll_area{
        	width: 100%;
        	height: 60px;
        	padding: 5px;
        }
        .enroll_area input{
        	border: 0.1px solid rgb(225, 225, 225);
            outline: none;
            background-color: white;
        }
        .enroll_area2{
        	width: 250px;
        	height: 25px;
        	border-radius: 5px;
        	margin-top: 5px;
        }
        #enroll_go{
        	margin-top: 10px;
        	margin-left: 90px;
        	height: 35px;
        	width: 80px;
        }
        #enroll_go button{
        	height: 100%;
        	width: 100%;
        	background-color: white;
        	border: 1px solid black;
        	border-radius: 5px;
        }
        #enroll_go button:hover{
        	background-color: rgb(255, 250, 247);
        	cursor: pointer;
        }
        #daangn_img{
        	height: 330px;
        	width: 300px;
        	background-color: red;
        	margin-left: 400px;
        	margin-top: -380px;
        	border-radius: 10px;
        }
        #daangn_img img{
        	width: 100%;
        	height: 100%;
        }
    </style>

</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<hr style="border: 0.3px solid rgb(232, 232, 232);">
	
	<div id="enroll_wrap">
		<div id="enroll_text">
			<span>회원가입</span>
			<hr>
		</div>
        <div id="enroll_form">
            <form action="<%=contextPath%>/insert.me" method="post" onsubmit="return mem_insert();">
                <div class="enroll_area">
                	<span><strong>아이디</span><br>
	                <input class="enroll_area2" type="text" name="memberId" id="memberId">            
                </div>
                <div class="enroll_area">
                	<span><strong>비밀번호</span><br>
	                <input class="enroll_area2" type="password" name="memberPwd" id="memberPwd">            
                </div>
                <div class="enroll_area">
                	<span><strong>비밀번호 확인</span><br>
	                <input class="enroll_area2" type="password" name="memberPwdCk" id="memberPwdCk">            
                </div>
                <div class="enroll_area">
                	<span><strong>이메일</span><br>
	                <input class="enroll_area2" type="email" name="email" id="email">            
                </div>
                <div class="enroll_area">
                	<span><strong>주소</span><br>
	                <input class="enroll_area2" name="address" id="address" type="text"  onclick="postcode();">            
                </div>
                <div id="enroll_go">
                	<button>회원가입</button>
                </div>
            </form>
        </div>
        <div id="daangn_img">
        	<img src="resources/css_img/daangn_img.png">
        </div>
    </div>
    
    <script>
		//회원가입 버튼 클릭시
    	function mem_insert(){
			var memberId = document.getElementById("memberId");
    		var memberPwd = document.getElementById("memberPwd");
    		var memberPwdCk = document.getElementById("memberPwdCk");
    		
	    	/* 회원가입 버튼 버튼 클릭시 비밀번호, 비밀번호 확인 CK */
	    	if(memberPwd.value==memberPwdCk.value){
	    		return true;
	    	}else{
	    		//포커스 비밀번호 창으로 옮겨주기
				memberPwd.focus();
	    		alert("비밀번호와 비밀번호 확인 값이 일치하지 않습니다.");
	    		return false;
	    	}
    	}
    
    	/* 다음 주소 검색 API */
    	function postcode(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	//원하는 값 주소창에 넣어주기
		        	document.getElementById("address").value=data.sido+" "+data.sigungu+" "+data.bname;
		        }
		    }).open();	
    	}
    </script>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>