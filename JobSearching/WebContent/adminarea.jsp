<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form id="form1" name="form1" method="post" action="jobarea.jsp">
  <p>
    <label for="id">       
        <strong>ADMIN AREA </strong>
     </label>
    <div align="center">
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
    </div>
  <div align="center">ID
    <input type="text" name="username" id="username" >&nbsp;Password     
    <input type="password" name="password" id="password" />
  </div>
  <p align="center">
    <input type="submit" name="Submit" id="Submit" value="SUBMIT" />
  </p>
  <p align="center">&nbsp;</p>
  <%
  	if(request.getParameter("Submit")!=null)
  	{
  		String adminname=request.getParameter("username");
  		String pwd=request.getParameter("password");
  		if(adminname.equals("Admin") && pwd.equals("12345"))
  		{
  		%>
  		 <jsp:forward page="jobarea.jsp"/>
  		<%
  		}
  		else
  			out.println("<strong>Invalid username or password!</strong>");
  	}
  %>
</form>
</body>
</html>