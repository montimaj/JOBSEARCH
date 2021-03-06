package com.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

public class Dao
{
	public Connection connect() throws Exception
	{
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobs","root","Montimaj535");		
		return con;
	}
	private int check_flag(String id) throws Exception
	{		
		Connection con=connect();
		String query="select flag from jobfinder where id=\""+id+"\"";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		int flag=-1;
		if(rs.next())
			flag=rs.getInt("flag");			
		return flag;
	}
	/**
	 * Save and edit records
	 * @param id Job id
	 * @param companyname Company name	
	 * @param postname Job post	
	 * @param location Job location
	 * @param salary 
	 * @return String 
	 */
	public String save(String id,String companyname,String postname,String location,int salary)
	{
		String i=null;	
		try 
		{
			 int flag=check_flag(id);
			 Connection con = connect();
			 if(flag==-1)
			 {			
				 PreparedStatement ps = con.prepareStatement("insert into jobfinder values(?,?,?,?,?,?)");
				 ps.setString(1,id);
				 ps.setString(2,companyname);
				 ps.setString(3,postname);
				 ps.setString(4,location);
				 ps.setInt(5,salary);
				 ps.setInt(6,0);
				 i=""+ps.executeUpdate();
			}
			 else if(flag==0)
			 {
				 String query="update jobfinder set companyname=\""+companyname+"\"";
				 query+=",postname=\""+postname+"\"";
				 query+=",location=\""+location+"\"";
				 query+=",salary=\""+salary+"\"";
				 query+=",flag=0 where id=\""+id+"\"";
				 PreparedStatement ps = con.prepareStatement(query);
				 i=""+ps.executeUpdate();
			 }
			 else
				 i="Posted";			 				 
		}
		catch(Exception e)
		{
				e.printStackTrace();
		}
		return i;
	}
	private String post_update(String id) throws Exception
	{
		String i=null;		
		Connection con = connect();
		String q="update jobfinder set flag=1 where id=\""+id+"\"";		
		PreparedStatement ps = con.prepareStatement(q);
		i=""+ps.executeUpdate();
		return i;
	}
	/**
	 * Permanently insert record to database
	 * @param id
	 * @param companyname
	 * @param postname
	 * @param location
	 * @param salary
	 * @return String
	 */
	public String post(String id,String companyname,String postname,String location,int salary)
	{
		String i=null;		
		try 
		{		 
			 int flag=check_flag(id);			
			 if(flag==-1)
			 {
				 Connection con = connect();
				 PreparedStatement ps = con.prepareStatement("insert into jobfinder values(?,?,?,?,?,?)");
				 ps.setString(1,id);
				 ps.setString(2,companyname);
				 ps.setString(3,postname);
				 ps.setString(4,location);
				 ps.setInt(5,salary);
				 ps.setInt(6,1);
				 i=""+ps.executeUpdate();
			 }
			 else if(flag==0)
				 i=post_update(id);
			 else
				 i="Posted";
		}
		catch(Exception e)
		{
				e.printStackTrace();
		}
		return i;
	}
	/**
	 * Show saved jobs
	 * @param query search criteria
	 * @return ResultSet 
	 */
	public ResultSet showPostedjobs(String query)
	{
		ResultSet rs=null;
		try
		{
			Connection con=connect();
			String x="\""+query+"\"";
			String q="select companyname, postname, location, salary from jobfinder where ";
			q+="(instr(companyname,"+x+")!=0 ";
			q+="or instr(postname,"+x+")!=0 ";
			q+="or instr(location,"+x+")!=0) and flag=1";
			Statement st=con.createStatement();
			rs=st.executeQuery(q);			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 * Show saved jobs to admin
	 * @param id Jobid
	 * @return Resultset
	 */
	public ResultSet showSavedjobs(String id)
	{
		ResultSet rs=null;
		try
		{
			Connection con=connect();			
			String q="select companyname, postname, location, salary from jobfinder where flag=0 and id=\""+id+"\"";			
			Statement st=con.createStatement();
			rs=st.executeQuery(q);			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}
}