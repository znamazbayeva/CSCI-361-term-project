package com.example.demo.data;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bookings")
public class Booking {
	@Id
	private Integer booking_id;

	private Date check_in_date;
	
	private Date check_out_date;
	
	private Integer room_id;
	

	public Integer getId() {
		return booking_id;
	}

	public void setId(Integer id) {
		this.booking_id = id;
	}

	public Date getFromDate() {
		return this.check_in_date;
	}
	
	public void setFromDate(Date d) {
		this.check_in_date = d;
	}
	
	public Date getToDate() {
		return this.check_out_date;
	}
	
	public void setToDate(Date d) {
		this.check_out_date = d;
	}
	
	public Integer getRoomId() {
		return room_id;
	}

	public void setRoomId(Integer id) {
		this.room_id = id;
	}
	  
}

