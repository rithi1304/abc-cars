package com.Sa.CarSale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Sa.CarSale.entity.Car;
import com.Sa.CarSale.repo.CarRepository;

@Service
public class CarService {

	@Autowired
	CarRepository c_repo;
	
	//to save and update car
	public void save_car(Car car) {
		c_repo.save(car);
	}
	
	public List<Car> getCar(){
		return c_repo.findAll();
	}
	
	//to delete the car by id
	public void delete_car(long id) {
		c_repo.deleteById(id);
	}
	
	//to get the car by id
	public Car getCarByID(long id) {
		return c_repo.getById(id);
	}
	
	public List<Car> search(String keyword) {
		return c_repo.search(keyword);
		
		}
}
