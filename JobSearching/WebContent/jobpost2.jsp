<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit saved jobs</title>
</head>
<body>
<jsp:useBean id="jobfinder" class="com.project.SaveBean">
<jsp:setProperty name="jobfinder" property="id"/>
</jsp:useBean>
<%
ResultSet rs=jobfinder.getSavedjobs();
String cname="",pname="",lname="",sal="",job_id=jobfinder.getId();
if(!rs.next())
{
	out.println("No Saved jobs!");
}
else
{
	cname=rs.getString(1);
	pname=rs.getString(2);
	lname=rs.getString(3);
	sal=rs.getString(4);
%>
<form id="form4" name="form4" method="post" >
  <p>JOB ID   
    <input type="text" name="id" id="id" value="<%=job_id %>"/>   
  </p>
  <p>
    <label for="companyname">COMPANY NAME</label>
    <input type="text" name="companyname" id="companyname" value="<%=cname %>"/>
  </p>
  <p>
    <label for="postname">POST NAME</label>
    <input type="text" name="postname" id="postname" value="<%=pname %>"/>
  </p>
  <p>
    <label for="location">LOCATION</label>
    <input type="text" name="location" id="location" value="<%=lname %>"/>
  </p>
  <p>
    <label for="salary">SALARY</label>
    <input type="text" name="salary" id="salary" value="<%=sal %>"/>
  </p>
  <p>
  <input type="submit" name="save" id="save" value="SAVE" />
  <input type="submit" name="post" id="post" value="POST" />    
  <% 
	if(request.getParameter("save")!=null)
  	{
  		%>
  		<jsp:forward page="jobsave.jsp"></jsp:forward>
  		<%
  	}  	
  	else if(request.getParameter("post")!=null)
  	{
  		%>
  		<jsp:forward page="jobpost.jsp"></jsp:forward>
  		<%
  	}
}
 %>
</form>
</body>
</html>