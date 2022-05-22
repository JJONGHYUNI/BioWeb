<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="web.bean.Member" %>
<%@ page import="java.io.*" %>
<%
String storedID = null;
String storedPW = null;
String id = request.getParameter("id");
String pw = request.getParameter("pw");
try {
String realPath = application.getRealPath("/login/member/member_"+ id);
FileInputStream fis = new FileInputStream(realPath);
if (fis != null) {
ObjectInputStream ois = new ObjectInputStream(fis);
web.bean.Member storedMember = (web.bean.Member)ois.readObject();
storedID = storedMember.getId();
storedPW = storedMember.getPassword();
ois.close();
}
if (id.equals(storedID) && pw.equals(storedPW)) {
session.setAttribute("SUCCESS_LOGIN", id);
%>
<html>
<head><title>로그인 처리</title></head>
<body>
로그인에 성공했습니다. <br/>
</body>
</html>
<%
} else if (id.equals(storedID)) {
%>
<script>
alert("패스워드가 다릅니다.");
history.go(-1);
</script>
<% 
}else {
%>
<script>
alert("일치하는 ID의 회원정보가 없습니다.");
history.go(-1);
</script>
<%
}
} catch (Exception e) {
%>
<script>
alert("일치하는 ID의 회원정보가 없습니다.");
history.go(-1);
</script>
<% } %>