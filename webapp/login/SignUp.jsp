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
			<form id="signUpForm" action="<%= request.getContextPath() %>/memberJoin" method="post" onsubmit="return validate();">
				<h1>회원 가입</h1>
				
				<h4>아이디</h4>
				<span class="inputArea"><input type="text" maxlength="13" name="id" required></span>
				<button id="idCheck" type="button">중복확인</button>
				
				<h4>비밀번호</h4>
				<span class="inputArea"><input type="password" maxlength="15" name="pw" required></span>
				
				<h4>비밀번호 확인</h4>
				<span class="inputArea"><input type="password" maxlength="15" name="pw2" required></span>
				<label id="pwdResult"></label>
				
				<h4>이름</h4>
				<span class="inputArea"><input type="text" maxlength="5" name="userName" required></span>
										
				<h4>이메일</h4>
				<span class="inputArea"><input type="email" name="email"></span>
				
				<h4>우편번호</h4>
				<span class="inputArea"><input type="text" name="address" class="postcodify_postcode5"></span>
				<button type="button" id="postcodify_search_button">검색</button>
				<h4>도로명주소</h4>
				<span class="inputArea"><input type="text" name="address" class="postcodify_address"></span>
				<h4>상세주소</h4>
				<span class="inputArea"><input type="text" name="address" class="postcodify_details"></span>
				
				<div class="btnArea">
					<button id="signUpBtn">가입하기</button>
					<button id="cancelBtn" onclick="goLogin()">취소</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 주소 API -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	
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