<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="web.bean.Member" scope="page"/>
<jsp:setProperty name="member" property="ID" param="userId"/>
<jsp:setProperty name="member" property="PW" param="userPw"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			script.println("location.href='../calendar/calendar.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(member.getID(), member.getPW());
		if(result==1){
			session.setAttribute("ID",member.getID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../calendar/calendar.jsp'");
			script.println("</script>");
		}
		else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");	
		}
		else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");	
		}
		else if(result==-2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");	
		}
	
	
	
	%>
	
</body>
</html>