package com.cs157a.evendor.model;

import java.sql.Date;

public class Order {
	private int id;
	private String deliveryAddr;
	private Date date;
	private int quantity;
	
	public Order(int id, String addr, Date date, int quantity) {
		this.id = id;
		this.deliveryAddr = addr;
		this.date = date;
		this.quantity = quantity;
	}
	
	public int getId() {
		return id;
	}
	
	public String getDeliveryAddr() {
		return deliveryAddr;
	}
	
	public Date getDate() {
		return date;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setDeliveryAddr(String addr) {
		this.deliveryAddr = addr;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
