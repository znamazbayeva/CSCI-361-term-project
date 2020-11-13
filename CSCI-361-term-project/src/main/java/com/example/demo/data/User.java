//package com.example.demo.data;
//
//import java.util.Set;
//import javax.persistence.*;
//import javax.validation.constraints.NotNull;
//
//
//
//@Entity
//@Table(name = "guest")
//public class User {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "guest_id")
//    private int guest_id;
//
//    @NotNull
//    @Column(name = "name")
//    private String name;
//
//    @NotNull
//    @Column(name = "surname")
//    private String surname;
//
//    @NotNull
//    @Column(name = "email")
//    private String email;
//
//    @Column(name = "phone_number")
//    private String phone_number;
//
//    @Column(name = "password")
//    private String password;
//
//    @Column(name = "category")
//    private String category;
//
//    @Column(name = "status")
//    private String status;
//    
//	private String mobile_number;
//	private String id_type;
//	private String id_number;
//	private String address;
//	
//	@ManyToOne
//	@JoinColumn(name="role_id", referencedColumnName="role_id")
//    private Role role;
//
//	public Role getRole() {
//		return role;
//	}
//
//	public void setRole(Role role) {
//		this.role = role;
//	}
//
//	public int getId() {
//        return guest_id;
//    }
//
//    public void setId(int guest_id) {
//        this.guest_id = guest_id;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getSurname() {
//        return surname;
//    }
//
//    public void setSurname(String surname) {
//        this.surname = surname;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public String getPhone_number() {
//        return phone_number;
//    }
//
//    public void setPhone_number(String phone_number) {
//        this.phone_number = phone_number;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public String getStatus() {
//        return status;
//    }
//
//    public void setStatus(String status) {
//        this.status = status;
//    }
//
//	public String getCategory() {
//		return category;
//	}
//
//	public void setCategory(String category) {
//		this.category = category;
//	}
//
//	public String getMobile_number() {
//		return mobile_number;
//	}
//
//	public void setMobile_number(String mobile_number) {
//		this.mobile_number = mobile_number;
//	}
//
//	public String getId_type() {
//		return id_type;
//	}
//
//	public void setId_type(String id_type) {
//		this.id_type = id_type;
//	}
//
//	public String getId_number() {
//		return id_number;
//	}
//
//	public void setId_number(String id_number) {
//		this.id_number = id_number;
//	}
//
//	public String getAddress() {
//		return address;
//	}
//
//	public void setAddress(String address) {
//		this.address = address;
//	}
//
//}