package com.example.domain;

public class LocalVO {
	private int id;
	private String place_name;
	private String address_name;
	private String phone;
	private double x;
	private double y;
	
	
	
	@Override
	public String toString() {
		return "LocalVO [id=" + id + ", place_name=" + place_name + ", address_name=" + address_name + ", phone="
				+ phone + ", x=" + x + ", y=" + y + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	
	
}
