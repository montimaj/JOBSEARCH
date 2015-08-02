<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Save</title>
</head>
<body>
<jsp:useBean id="jobfinder" class="com.project.SaveBean">
<jsp:setProperty name="jobfinder" property="*"/>
</jsp:useBean>
<%
String i=jobfinder.save();
if(i!=null)
{
	if(i.equals("Posted"))
		out.println("<strong>Already posted</strong>");
	else
		out.println("<strong>Successfully saved</strong>");
}
else
{
	%>
	<jsp:forward page="jobarea.jsp"/>
	<% 
}
%>
</body>
</html>