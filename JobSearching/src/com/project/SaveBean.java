package com.project;


public class SaveBean {
	private String id;
	private String companyname;
	private String postname;
	private String location;
	private int salary;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getPostname() {
		return postname;
	}
	public void setPostname(String postname) {
		this.postname = postname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String save()
	{
		Dao d=new Dao();
		String i=d.save(id,companyname,postname,location,salary);
		return i;
	}	
	public String post()
	{
		Dao d=new Dao();
		String p=d.post(id,companyname,postname,location,salary);
		return p;
	}
}
