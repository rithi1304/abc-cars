package com.Sa.CarSale.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Sa.CarSale.entity.Car;
import com.Sa.CarSale.entity.CarBidding;
import com.Sa.CarSale.entity.User;
import com.Sa.CarSale.service.BidService;
import com.Sa.CarSale.service.CarService;
import com.Sa.CarSale.service.UserService;

@Controller
public class CarController {
	private static final String UPLOAD_DIRECTORY = "/images";
    private static Logger logger = LoggerFactory.getLogger(CarController.class);
    
	@Autowired
	CarService c_ser;
	
    @Autowired
    BidService carbidService;
    
	@Autowired
	UserService u_ser;

	
    @RequestMapping("/")
    public String showLandingPage() {
        return "Home";
    }
	
	@GetMapping("/post_car")
	public String postCar(Model model) {
		Car car = new Car();
		model.addAttribute("car", car);
		return "PostCar";
	}
	

	@PostMapping("/save_car")
	public String saveCar(@ModelAttribute Car car, @RequestParam("file") MultipartFile  file, HttpSession session, Model model) throws Exception {
		
		System.out.println("get Car Name");
		// Get the file name & set the file name
		String carphotoname = file.getOriginalFilename();
		System.out.println("Car photo name is "+carphotoname);
		
		if(carphotoname != null && !carphotoname.trim().isEmpty()) {
		car.setCarphoto(carphotoname);

		// Upload Car Photo
		ServletContext context = session.getServletContext();
		String path = context.getRealPath(UPLOAD_DIRECTORY);
		String filename = file.getOriginalFilename();

		System.out.println(path + " " + filename);
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(path + File.separator + filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();

		System.out.println("File successfully saved!");
		// End Upload Car Photo
		}
		//end of file upload
		
		System.out.println("Save & Update new car");
		c_ser.save_car(car);
		return "redirect:/view_cars";
	}
	
	@GetMapping("/view_cars")
	public String viewCars(Model model) {
		List<Car> all_cars = c_ser.getCar();
		model.addAttribute("all_cars", all_cars);
		return "ViewCars";
	}
	
	@GetMapping("search")
	public ModelAndView search(@RequestParam String keyword) {
		List<Car> result = c_ser.search(keyword);
		ModelAndView mav = new ModelAndView("search_car_results");
		mav.addObject("keyword", keyword);
		mav.addObject("search_cars", result);
		return mav;		
	}
	
	@GetMapping("/delete")
	public String delStore(@RequestParam long id) {
		System.out.println("Delete Id is " + id);
		c_ser.delete_car(id);
		return "redirect:/view_cars";
	}
	
	@GetMapping("/edit")
	public String updateStore(@RequestParam long id, Model model) {
		
		Car old_car_data = c_ser.getCarByID(id);
		model.addAttribute("car", old_car_data);
		return "PostCar";
	}
	
    @GetMapping("car_detail")
	public ModelAndView viewCar(@RequestParam long id) {
		ModelAndView mav = new ModelAndView("car_detail");
		Car car = c_ser.getCarByID(id);
		mav.addObject("car", car);
		mav.addObject("bidinfo", carbidService.listBidInfo((car)));
	return mav;
	}
    
    //Save the bid price to car bidding table
    @PostMapping("car_detail")
	   public String saveBit(@RequestParam(value="id", required = false) Long id,
	                           @RequestParam("bitprice") String bitprice,
	                           Model model) {
		   
		  //To post the bid information into the database 
		  //Get User name
		   String uname="";
		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   if(principal instanceof UserDetails) {
			    uname=((UserDetails) principal).getUsername();
			 
		   }
		   else {
			    uname=principal.toString();
		   }
		   
		   Long carid=id;
		   
		   Car car = c_ser.getCarByID(id);
		   User user=u_ser.getUserByName(uname);
		   
		   Date cur_time=new Date();
		   

	       CarBidding carBitInfo = new CarBidding();
	       carBitInfo.setBidderName(uname);
	       carBitInfo.setBidderPrice(bitprice);
	       
	       carBitInfo.setCar(car);
	       carBitInfo.setUser(user);
	       
	       carBitInfo.setBid_date_time(cur_time);
	      
	       logger.debug("Car Bidder Price:{}, Car ID: {}", carBitInfo.getBidderPrice(),carBitInfo.getId(),carBitInfo.getBidderName(),carBitInfo.getCar());
	       
	       CarBidding savedCar = carbidService.save(carBitInfo);

	       model.addAttribute("car", car);		
	       model.addAttribute("bidinfo", carbidService.listBidInfo(car));
	       
	       return "car_detail";
	 }
}
