package com.Sa.CarSale.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Sa.CarSale.entity.Car;
import com.Sa.CarSale.entity.User;
import com.Sa.CarSale.service.UserService;

@Controller
public class LoginController {
	
	private static final String UPLOAD_DIRECTORY = "/images";

	
	@GetMapping("/profile")
	public String profile() {
	return "user_profile";
	}
	
	@GetMapping("/home")
    public String showUserProfile() {

        return "Home"; // Or the JSP where the profile is displayed
    }
	
	@Autowired
	private UserService userService;

    @RequestMapping(value="/login",  method= RequestMethod.GET)
    public String onLogin() {
        return "login";
    }


    @RequestMapping(value="/login_error")
    public ModelAndView onLoginError(Model model) {
      
        ModelAndView mav = new ModelAndView("login");
        String error_msg = "Incorrect username or password. Try Again.";
        model.addAttribute("error_string", error_msg);
		return mav;
		
    }
    
    @RequestMapping(value="/register_form")
	public String registerUserForm(Map<String, Object> model) {
    	System.out.println("Register Controller");
		User user = new User();
		model.put("user", user);

		return "Register";
	}
    
	@RequestMapping(value = "/register_process", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user, Model model) {
		System.out.println("/save Register User Controller");
		userService.save(user);
		String register_success = "<h5> Registeration Successful! </h5>";
		model.addAttribute("register_success", register_success);
		return "Home";
	}
	
	
    @RequestMapping(value="users",  method= RequestMethod.GET)
    public String viewUsers(Model model) {
        List<User> users = userService.listAll();
        
        System.out.println ("User Lists is "+users.toString());
        if(!CollectionUtils.isEmpty(users)) {
            model.addAttribute("userlists", users);
           System.out.println("User Lists is not empty"); 
        }
        return "all_user";
    }
    
	@RequestMapping("/user_delete")
	public String deleteStoreForm(@RequestParam long id) {
		userService.delete(id);
		return "redirect:/users";		
	}
	
	
	@RequestMapping("/user_edit")
	public ModelAndView editStoreForm(@RequestParam long id) {
		ModelAndView mav = new ModelAndView("edit_user");
		User euser = userService.get(id);
		mav.addObject("euser", euser);
		
		return mav;
	}
	
	@RequestMapping("/profile_edit")
	public ModelAndView editProfile(@RequestParam long id) {
		ModelAndView mav = new ModelAndView("edit_profile");
		User user = userService.get(id);
		mav.addObject("user", user);
		
		return mav;
	}
	
	
	@PostMapping("s_user")
	public String getUsers(@ModelAttribute User user, @RequestParam long id, @RequestParam("file") MultipartFile  file, HttpSession session, Model model) throws Exception{
		
		// Get the file name & set the file name
		String userphotoname = file.getOriginalFilename();
		System.out.println("user photo name is "+userphotoname);
		
		if(userphotoname != null && !userphotoname.trim().isEmpty()) {
		user.setUserphoto(userphotoname);

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
		userService.save_user(user, id);
		return "redirect:/users";
	}
	
	@PostMapping("update_profile")
	public String updateProfile(@ModelAttribute User user, @RequestParam long id, @RequestParam("file") MultipartFile  file, HttpSession session, Model model) throws Exception{
		// Get the file name & set the file name
		String userphotoname = file.getOriginalFilename();
		System.out.println("user photo name is "+userphotoname);
		
		if(userphotoname != null && !userphotoname.trim().isEmpty()) {
		user.setUserphoto(userphotoname);

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
		userService.save_user(user, id);
		return "redirect:/profile";
	}
	
	@GetMapping("/aboutUs")
	public String aboutUs() {
		return "AboutUs";
	}
	
	@GetMapping("/contactUs")
	public String contactUs() {
		return "ContactUs";
	}
    
    
}
