<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>회원 가입 폼</title>
	<link href="<%= request.getContextPath() %>/login/CSS/SignUp.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="../layout/top.jsp" flush="false" />
<div class="main">
		<div id="formarea">
			<form id="signUpForm" action="<%= request.getContextPath() %>/login/SignUpProcess.jsp" method="post" onsubmit="return validate();">
				<h1>회원 가입</h1>
				
				<h4>아이디</h4>
				<span class="inputArea"><input type="text" maxlength="13" name="userId" required></span>
				<button id="idCheck" type="button">중복확인</button>
				
				<h4>비밀번호</h4>
				<span class="inputArea"><input type="password" maxlength="15" name="userPw" required></span>
				
				<h4>비밀번호 확인</h4>
				<span class="inputArea"><input type="password" maxlength="15" name="userPw2" required></span>
				<label id="pwdResult"></label>
				
				<h4>이름</h4>
				<span class="inputArea"><input type="text" maxlength="5" name="userName" required></span>
										
				<h4>이메일</h4>
				<span class="inputArea"><input type="email" name="userEmail"></span>
				
				<h4>우편번호</h4>
				<span class="inputArea"><input type="text" name="userZipcode" id=zipCode class="address"></span>
				<button type="button" onclick="Postcode()" >검색</button>
				<h4>도로명주소</h4>
				<span class="inputArea"><input type="text" name="userRoadAddress" id=roadAddress class="address"></span>
				<h4>상세주소</h4>
				<span class="inputArea"><input type="text" name="userDetailAddress" class="address"></span>
				
				<div class="btnArea">
					<button id="signUpBtn">가입하기</button>
					<button id="cancelBtn" onclick="goLogin()">취소</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function Postcode(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	document.getElementById("zipCode").value = data.zonecode;
	            document.getElementById("roadAddress").value = data.roadAddress;
	        }
	    }).open();
	}
    </script>
	<script>
	    function validate(){
			 return true;
		}
		function goLogin(){
			location.href="Login.jsp";
		}
	</script>
</body>
</html>