package com.project;

public class AdminBean 
{
	private String username, password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public boolean check_credentials()
	{
		if(password==null || username==null)
			return false;
		else if(password.equals("12345") && username.equals("Admin"))
			return true;
		else
			return false;
	}
	
}
