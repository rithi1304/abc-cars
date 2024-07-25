package com.Sa.CarSale.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class User {
	
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    @Column
    private String name;
    
    private String phone;
    private String address;
    private String userName;
    private String password;
    private String userphoto;

    @ManyToMany
    @JoinTable( name="user_role",
                joinColumns = @JoinColumn(name = "user_id"),
                inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    public User() {

    }

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public User(String userName, String password, Set<Role> roles) {
        this.userName = userName;
        this.password = password;
        this.roles = roles;
    }


    public User(String name, String password, String userName, Set<Role> roles) {
		// TODO Auto-generated constructor stub
    	 this.name=name;
         this.password = password;
         this.userName = userName;
         this.roles = roles;
	}
    
    

	public User(Long id, String name, String phone, String address, String userName, String password, Set<Role> roles) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.userName = userName;
		this.password = password;
		this.roles = roles;
	}
	
	

	public User(Long id, String name, String phone, String address, String userName, String password, String userphoto,
			Set<Role> roles) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.userName = userName;
		this.password = password;
		this.userphoto = userphoto;
		this.roles = roles;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
   

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getUserphoto() {
		return userphoto;
	}

	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return userName.equals(user.userName) && password.equals(user.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userName, password);
    }
}
