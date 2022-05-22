<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<title>로그인</title>
<link href="<%= request.getContextPath() %>/login/CSS/Login.css" type="text/css" rel="stylesheet">
</head>

<body>
<h1>로그인</h1>
<section id="formArea">
	<form action="LoginProcess.jsp" method="post">
		<table>
			<tr>
				<td><label>아이디 : </label></td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td><label >비밀번호 : </label></td>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2">
						<input id="iden" class="but" type="submit" value="로그인">
						<input class="but" type="button" value="회원가입" onclick="javascript:window.location='SignUp.jsp'">
				</td>
			</tr>
		</table>
	</form>
</section>
</body>
</html>