package com.Sa.CarSale.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Sa.CarSale.entity.Car;

@Repository
public interface CarRepository extends JpaRepository<Car,Long>{
	
    @Query(value = "SELECT c FROM Car c WHERE c.make LIKE '%' || :keyword || '%'"
			+ " OR c.carModel LIKE '%' || :keyword || '%'"
			+ " OR c.registrationYear LIKE '%' || :keyword || '%'"
			+ " OR c.price LIKE '%' || :keyword || '%'")
    
	public List<Car> search(@Param("keyword") String keyword);

}
