<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Current Jobs</title>
</head>
<body>
<jsp:useBean id="jobsearcher" class="com.project.SearchBean">
<jsp:setProperty name="jobsearcher" property="query"/>
</jsp:useBean>
<%
ResultSet rs=jobsearcher.getRecords();
if(!rs.next())
	out.println("No search results!");
else 
{
	%>
	<TABLE BORDER="1" cellspacing="5" cellpadding="5">
	<TR>
	   <TH>Company</TH>
	   <TH>Post</TH>
	   <TH>Location</TH>
	   <TH>Salary</TH>
	</TR>
	<%
	do
	{
		%>
		
		<TR>
		   <TD> <%= rs.getString(1) %> </TD>
		   <TD> <%= rs.getString(2) %> </TD>
		   <TD> <%= rs.getString(3) %> </TD>
		   <TD> <%= rs.getString(4) %> </TD>   
		</TR>		
		<%
	}while(rs.next());	
}
%>
</TABLE>
<BR>
</body>
</html>