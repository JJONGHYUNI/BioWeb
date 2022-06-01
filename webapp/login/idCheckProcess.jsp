<%@ page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/layout/images/logo.jpg">
<title>밤낮-중복확인</title>
</head>
<body>
<h2>아이디중복체크</h2>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("userid");

UserDAO mdao = new UserDAO();

int result = mdao.IdCheck(id);
if (result == 1){
	out.print("사용가능한 아이디입니다");
	%>
	 <input type="button" value="아이디 사용하기" onclick="result();">
	<%
	
}else if(result == 0){
	out.print("중복된 아이디입니다");
}else{
	out.print("에러 발생!!!(-1)"); 
}

%>

<fieldset>
	<form action="idCheckProcess.jsp" method="post" name="wfr">
		ID : <input type="text" name="userid" value="<%=id%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

 <script type="text/javascript">
    function result(){
    	opener.document.fr.userId.value = document.wfr.userid.value;
    	opener.document.fr.id.readOnly=true;
    	window.close();
    }
 
 </script>

</body>