<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>회원 가입 폼</title>
</head>
<body>
<section id="formArea">
	<form action="<%= request.getContextPath() %>/login/SignUpProcess.jsp" method="post">
		<table>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td><label for="password">비밀번호 : </label></td>
				<td><input type="text" name="password" id="password"></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td><label for="email">이메일 : </label></td>
				<td><input type="text" name="email" id="email"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입">
					<input type="reset" value="다시 작성">
				</td>
			</tr>
		</table>
	</form>
</section>
</body>
</html>