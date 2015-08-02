<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="jobfinder" class="com.project.SaveBean">
<jsp:setProperty name="jobfinder" property="id"/>
</jsp:useBean>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobs","root","Montimaj535");
String q="select companyname, postname, location, salary from jobfinder where ";
%>
<form id="form2" name="form2" method="get" action="jobpost2.jsp">
  <p>JOB ID   
    <input type="text" name="id" id="jobid" value=<%request.getParameter("id"); %>/>
    <input type="submit" name="postbyid" id="postbyid" value="Get Saved Records">;
  </p>
  </form> 
</body>
</html>