package com.cs157a.evendor.model;

public class Posting {
	private int id;
	private String title;
	private String category;
	private double price;
	private String region;
	
	public Posting(int id, String title, String category, double price, String region) {
		this.id = id;
		this.title = title;
		this.category = category;
		this.price = price;
		this.region = region;
	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getCategory() {
		return category;
	}

	public double getPrice() {
		return price;
	}

	public String getRegion() {
		return region;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
}
