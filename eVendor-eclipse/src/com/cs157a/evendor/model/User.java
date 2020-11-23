package com.cs157a.evendor.model;

public class User {
	private long id;
	private String username;
	private String hashedPassword;
	private String pwsalt;
	private String firstName;
	private String lastName;
	private String email;
	private double balance;
	
	public User(long id, String username, String hashedPassword, String pwsalt, String firstName, 
			String lastName, String email, double balance) {
		this.id = id;
		this.username = username;
		this.hashedPassword = hashedPassword;
		this.pwsalt = pwsalt;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.balance = balance;
	}
	
	//getter methods
	public long getId() {
		return id;
	}
	public String getUserName() {
		return username;
	}
	public String getHashedPassword() {
		return hashedPassword;
	}
	public String getPwSalt() {
		return pwsalt;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getEmail() {
		return email;
	}
	public double getBalance() {
		return balance;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setHashedPassword(String hashedPassword) {
		this.hashedPassword = hashedPassword;
	}

	public void setPwsalt(String pwsalt) {
		this.pwsalt = pwsalt;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
}
