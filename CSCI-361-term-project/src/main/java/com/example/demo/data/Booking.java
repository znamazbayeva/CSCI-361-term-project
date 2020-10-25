package com.example.demo.data;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="booking")
public class Booking {
	
	@Id
	private Integer booking_id;

	private Date check_in;
	
	private Date check_out;
	
	private Integer room_number;
	
	@ManyToOne
	@JoinColumns({
		@JoinColumn(name="room_type_name", referencedColumnName="room_type_name"),
		@JoinColumn(name="hotel_id", referencedColumnName="hotel_id")
	})
    private RoomType room_type;

	public Integer getId() {
		return booking_id;
	}

	public void setId(Integer id) {
		this.booking_id = id;
	}

	public Date getFromDate() {
		return this.check_in;
	}
	
	public void setFromDate(Date d) {
		this.check_in = d;
	}
	
	public Date getToDate() {
		return this.check_out;
	}
	
	public void setToDate(Date d) {
		this.check_out = d;
	}
	
	public Integer getRoomNumber() {
		return room_number;
	}

	public void setRoomNumber(Integer id) {
		this.room_number = id;
	}
	
	public RoomType getRoomType() {
		return room_type;
	}

	public void setRoomType(RoomType id) {
		this.room_type = id;
	}
	
}



