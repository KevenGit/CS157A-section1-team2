package com.cs157a.evendor.model;

public class Seller extends User {
	
	private String phone;

	public Seller(long id, String username, String hashedPassword, String pwsalt, String firstName, String lastName,
			String email, long balance, String phone) {
		super(id, username, hashedPassword, pwsalt, firstName, lastName, email, balance);
		this.phone = phone;
	}
	
	public Seller(User user, String phone) {
		super(user.getId(), user.getUserName(),
				user.getHashedPassword(), user.getPwSalt(),
				user.getFirstName(), user.getLastName(),
				user.getEmail(), user.getBalance());
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
