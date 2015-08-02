package com.project;

import java.sql.ResultSet;

public class SearchBean 
{
	private String query;

	public String getQuery() 
	{
		return query;
	}
	public void setQuery(String query) 
	{
		this.query = query;
	}
	public ResultSet getRecords()
	{
		Dao d=new Dao();
		return d.showjobs(query);
	}
}
