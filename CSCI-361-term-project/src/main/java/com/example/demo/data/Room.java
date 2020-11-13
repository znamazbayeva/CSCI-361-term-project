package com.example.demo.data;

import java.io.Serializable;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.example.demo.data.RoomType.RoomTypeId;


@SuppressWarnings("serial")
@Entity
@Table(name="room")
public class Room implements Serializable{
	
	@SuppressWarnings("serial")
	@Embeddable
	public static class RoomId implements Serializable {

		@Column(name = "room_number")
		private Integer room_number;

		private RoomTypeId room_type_id;

		public Integer getRoom_number() {
			return room_number;
		}

		public void setRoom_number(Integer id) {
			this.room_number = id;
		}

		public RoomTypeId getRoom_type_id() {
			return room_type_id;
		}

		public void setRoom_type_id(RoomTypeId id) {
			this.room_type_id = id;
		}

		@Override
		public boolean equals(Object o) {
			if (this == o)
				return true;
			if (o == null || getClass() != o.getClass())
				return false;
			RoomId that = (RoomId) o;
			return room_type_id.equals(that.room_type_id) && room_number == that.room_number;
		}

		@Override
		public int hashCode() {
			return Objects.hash(room_type_id, room_number);
		}

	}
	
	@EmbeddedId 
	private RoomId room_id;

	private Integer available;
	
	@MapsId("room_type_id")
	@JoinColumns({
		@JoinColumn(name="room_type_name", referencedColumnName="room_type_name"),
		@JoinColumn(name="hotel_id", referencedColumnName="hotel_id")
	})
	@ManyToOne
    private RoomType room_type;
	
	@OneToMany(mappedBy = "room")
	private Set<Booking> bookings;

	public RoomId getRoom_id() {
		return this.room_id;
	}
	
	public void setRoom_id(RoomId id) {
		this.room_id = id;
	}
	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer id) {
		this.available = id;
	}
	
	public RoomType getRoomType() {
		return room_type;
	}

	public void setRoomType(RoomType id) {
		this.room_type = id;
	}
	
	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Room that = (Room) o;
        return room_id.equals(that.room_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(room_id);
    }
	  
}

