package com.example.demo.data;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="guest")
public class Guest {
	@Id
	private int guest_id;
	private String name;
	private String surname;
	
//	@Column(name = "e-mail")
	private String email;
	
	@OneToMany(mappedBy="guest")
	private Set<Booking> booking;

	public int getGuestId() {
		return guest_id;
	}

	public void setGuestId(int guest_id) {
		this.guest_id = guest_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
