package com.cs157a.evendor.model;

public class User {
	long id;
	String username;
	String hashedPassword;
	String pwsalt;
	String firstName;
	String lastName;
	String email;
	long balance;
	public User(long id, String username, String hashedPassword, String pwsalt, String firstName, 
			String lastName, String email, long balance) {
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
	public long getBalance() {
		return balance;
	}
}
