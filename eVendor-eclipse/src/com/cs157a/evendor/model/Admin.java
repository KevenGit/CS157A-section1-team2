package com.cs157a.evendor.model;

public class Admin {
	private int id;
	private String firstName;
	private String lastName;
	private String username;
	private String hashedPW;
	private String pwSalt;
	
	public Admin(int id, String firstName, String lastName,
			String username, String hashedPW, String pwSalt)
	{
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.hashedPW = hashedPW;
		this.pwSalt = pwSalt;
	}
	
	public int getId() {
		return id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String gethashedPW() {
		return hashedPW;
	}
	
	public String getPWSalt() {
		return pwSalt;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setFirstName(String name) {
		this.firstName = name;
	}
	
	public void setLastName(String name) {
		this.lastName = name;
	}
	
	public void setUsername(String name) {
		this.username = name;
	}
	
	public void setHashedPW(String pw) {
		this.hashedPW = pw;
	}
	
	public void setPWSalt(String salt) {
		this.pwSalt = salt;
	}

}
