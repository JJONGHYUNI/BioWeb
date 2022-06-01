<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>밤낮-로그인</title>
	<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/layout/images/logo.jpg">
	<link href="<%= request.getContextPath() %>/login/CSS/Login.css?after" type="text/css" rel="stylesheet">
</head>

<body>
<jsp:include page="../layout/top.jsp" flush="false" />
<div class="main">
	<div id="formarea">
		<form id="loginForm" action="<%= request.getContextPath() %>/login/LoginProcess.jsp" method="post" onsubmit="return validate();">
			<h1>로그인</h1>
				
			<h4>아이디</h4>
			<span class="inputArea">
				<input type="text" name="userId" id="userId" placeholder="아이디 입력">
			</span>
				
			<h4>비밀번호</h4>
			<span class="inputArea">
				<input type="text" name="userPw" id="userPw" placeholder="비밀번호 입력">
			</span>
			<h4>
			</h4>
			<span >
				<input id = btn type="submit" value="로그인">
			</span>
		</form>
	</div>
</div>
<script>
	function validate(){
		let ID=document.getElementById("id");
		let PW=document.getElementById("pw");
		
		if(id.value.length<=0){
			alert("아이디 입력이 필요합니다.");
			id.select();
			return false;
		}
		if(pw.value.length<=0){
			alert("비밀번호 입력이 필요합니다.");
			pw.select();
			return false;
		}
		return true;
	}
</script>
</body>
</html>