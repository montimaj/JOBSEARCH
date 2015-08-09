<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="adminarea" class="com.project.AdminBean">
<jsp:setProperty name="adminarea" property="*"/>
</jsp:useBean>
<%
if(adminarea.check_credentials())
{
	out.println("Welcome "+request.getParameter("username"));
%>	
<jsp:forward page="jobarea.jsp"></jsp:forward>
<%
}
else
{
	out.println("<strong>Invalid username or password!</strong>");
}
%>
</body>
</html>