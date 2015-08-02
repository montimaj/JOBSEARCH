<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form4" id="form4" method="post">
 <p>
    <label for="companyname">COMPANY NAME</label>
    <input type="text" name="companyname" id="companyname">
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
 %>
</form>
</body>
</html>