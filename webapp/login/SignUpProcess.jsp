<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="web.bean.Member" scope="page"/>
<jsp:setProperty name="member" property="ID" param="userId"/>
<jsp:setProperty name="member" property="PW" param="userPw"/>
<jsp:setProperty name="member" property="userName" param="userName"/>
<jsp:setProperty name="member" property="zipCode" param="userZipCode"/>
<jsp:setProperty name="member" property="roadAddress" param="userRoadAddress"/>
<jsp:setProperty name="member" property="detailAddress" param="userDetailAddress"/>
<jsp:setProperty name="member" property="email" param="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입프로세스</title>
</head>
<body>
	<%
	String ID = null;
	if(session.getAttribute("ID")!=null);{
	ID = (String) session.getAttribute("ID");
	}
	if(ID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어 있습니다.')");
		script.println("location.href='Login.jsp'");
		script.println("</script>");
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.signUP(member);
	if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");	
	}else{
		session.setAttribute("ID",member.getID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'Login.jsp'");
		script.println("</script>");
		}
%>	
</body>
</html>