<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Post Job</title>
</head>
<body>
<h1 align="center">Add Job 
</h1>
<form id="form2" name="form2" method="post" >
  <p>JOB ID   
    <input type="text" name="id" id="id" />
  </p>
  <p>
    <label for="Company name"></label>
    <label for="companyname">COMPANY NAME</label>
    <input type="text" name="companyname" id="companyname" />
  </p>
  <p>
    <label for="postname">POST NAME</label>
    <input type="text" name="postname" id="postname" />
  </p>
  <p>
    <label for="location">LOCATION</label>
    <input type="text" name="location" id="location" />
  </p>
  <p>
    <label for="salary">SALARY</label>
    <input type="text" name="salary" id="salary" />
  </p>
  <p>
      
    <input type="submit" name="save" id="save" value="SAVE" />
    <input type="submit" name="post" id="post" value="POST" />    
  <% 
   if (request.getParameter("save") != null)
   {
   		%>
    	<jsp:forward page="jobsave.jsp"/> 
		<% 
    } 
   else if (request.getParameter("post") != null) 
   {
    	%>
     	<jsp:forward page="jobpost.jsp"/>      
   		<% 
   }   
  %>
</form>
</body>
</html>