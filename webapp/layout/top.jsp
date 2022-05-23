<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위쪽 레이아웃</title>
<link href="<%= request.getContextPath() %>/layout/CSS/top.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class ="banner">
		<img class="logo" src="<%= request.getContextPath() %>/layout/images/logo.jpg" alt=banner>
	</div>
	<tr>
		<td colspan="2">
			<input class="but" id="join" type="button" value="회원가입" onclick="javascript:window.location='SignUp.jsp'">
			<input id="login" type="button" value="로그인" onclick="javascript:window.location='SignUp.jsp'">
		</td>
	</tr>
</body>
</html>