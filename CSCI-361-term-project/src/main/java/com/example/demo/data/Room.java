package com.example.demo.data;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;


@Entity
@Table(name="room")
public class Room{
	@Id
	private Integer room_id;

	private Integer room_number;

	private Integer available;

	private Integer capacity;

	@ManyToOne
    @JoinColumn(name="hotel_id", nullable=false)
    private Hotel hotel;

	public Integer getId() {
		return room_id;
	}

	public void setId(Integer id) {
		this.room_id = id;
	}

	public Integer getRoomNumber() {
		return room_number;
	}

	public void setRoomNumber(Integer id) {
		this.room_number = id;
	}

	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer id) {
		this.available = id;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer id) {
		this.capacity = id;
	}
	
	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel h) {
		hotel = h;
	}
	  
}
