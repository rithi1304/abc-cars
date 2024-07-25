package com.Sa.CarSale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.Sa.CarSale.entity.User;
import com.Sa.CarSale.service.UserService;

@Component
public class UserInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private UserService userService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && modelAndView != null) {
            if (auth.getPrincipal() instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) auth.getPrincipal();
                String username = userDetails.getUsername();
                User user = userService.getUserByName(username); // Assuming you have a method to retrieve the user by username
                modelAndView.addObject("user", user);
        }
    }
}
}

