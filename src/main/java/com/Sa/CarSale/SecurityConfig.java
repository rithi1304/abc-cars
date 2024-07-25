package com.Sa.CarSale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.Sa.CarSale.service.UserDetailsServiceImpl;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	  @Bean
	    public UserDetailsService userDetailsService() {
	       return new UserDetailsServiceImpl();
	    }

	    @Bean
	    public PasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	    
	    
	    
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Configure class Authentication");
		//super.configure(auth);
		 auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Configure class HttpSecurity");
		
		System.out.println("At Security configure");
        http
        		
                .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/login")
                    .failureUrl("/login_error")
                    .permitAll()
                    .defaultSuccessUrl("/home", true)
                .and()
                .csrf()
                .and()
                .authorizeRequests()
                    .antMatchers("/").permitAll()
                    //.antMatchers("/css/**").permitAll()
                    .antMatchers("/images/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
                    .antMatchers(HttpMethod.GET, "/login").permitAll()
                    .antMatchers(HttpMethod.GET, "/home").permitAll()
                    .antMatchers(HttpMethod.GET, "/view_cars").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/car_detail").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/search").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET,"/post_car").hasRole("Users")
                    .antMatchers(HttpMethod.POST, "/save_car").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.POST, "/update_profile").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET,"/user_edit").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET,"/profile_edit").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET,"/profile").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.PUT, "/save_car").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.PUT, "/view_cars").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET,"/edit").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/delete").hasRole("Administrator")
                    .antMatchers(HttpMethod.DELETE, "/delete").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET,"/users").hasRole("Administrator")
                .and()
                .logout()
                    .logoutSuccessUrl("/login")
                    .invalidateHttpSession(true)
                    .deleteCookies("SESSIONID");
	}
}


