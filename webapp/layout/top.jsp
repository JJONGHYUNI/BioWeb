<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="web.bean.Member" scope="page"/>
<jsp:setProperty name="member" property="ID" param="userId"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위쪽 레이아웃</title>
<link href="<%= request.getContextPath() %>/layout/CSS/top.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
	String id = null;
	if(session.getAttribute("ID")!=null);{
	id = (String) session.getAttribute("ID");
	}
%>
	<div class ="banner">
		<img class="logo" src="<%= request.getContextPath() %>/layout/images/logo.jpg" alt=banner>
	</div>
	<tr>
<%
		if(id!=null){
		%>
		<%=id%>
		<td colspan="2">
		<input class="but" type="button" value="로그아웃" onclick="javascript:window.location='../login/Logout.jsp'">
		<input class="but" type="button" value="캘린더" onclick="javascript:window.location='../calendar/calendar.jsp'">
		</td>
		</tr>
		<%
	}else{
		%>
		<td colspan="2">
		<input class="but" type="button" value="회원가입" onclick="javascript:window.location='../login/SignUp.jsp'">
		<input class="but" type="button" value="로그인" onclick="javascript:window.location='../login/Login.jsp'">
		</td>
		</tr>
		<% 
	}	
	
		%>
</body>
</html>