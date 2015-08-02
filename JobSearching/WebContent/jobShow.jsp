<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="jobsearcher" class="com.project.SearchBean">
<jsp:setProperty name="jobsearcher" property="query"/>
</jsp:useBean>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobs","root","Montimaj535");
String x="\""+jobsearcher.getQuery()+"\"";
String q="select companyname, postname, location, salary from jobfinder where ";
q+="instr(companyname,"+x+")!=0 ";
q+="or instr(postname,"+x+")!=0 ";
q+="or instr(location,"+x+")!=0 and flag=1";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(q);
if(!rs.next())
	out.println("No search results!");
else do
{
%>
<TABLE BORDER="0">
<TR>
   <TH>Company</TH>
   <TH>Post</TH>
   <TH>Location</TH>
   <TH>Salary</TH>
</TR>
<TR>
   <TD> <%= rs.getString(1) %> </TD>
   <TD> <%= rs.getString(2) %> </TD>
   <TD> <%= rs.getString(3) %> </TD>
   <TD> <%= rs.getString(4) %> </TD>   
</TR>
</TABLE>
<%
}while(rs.next());
%>
<BR>
</body>
</html>