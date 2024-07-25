package com.Sa.CarSale.entity;

import javax.persistence.*;

@Entity
public class Car {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	long carId;
	
	@Column
	String carModel;
	String make;
	String color;
	String registrationNo;
	String registrationYear;
	double price;
    private String carphoto;
	
	public long getCarId() {
		return carId;
	}
	public void setCarId(long carId) {
		this.carId = carId;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getRegistrationYear() {
		return registrationYear;
	}
	public void setRegistrationYear(String registrationYear) {
		this.registrationYear = registrationYear;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getRegistrationNo() {
		return registrationNo;
	}
	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}
	public String getCarphoto() {
		return carphoto;
	}
	public void setCarphoto(String carphoto) {
		this.carphoto = carphoto;
	}
	
}
