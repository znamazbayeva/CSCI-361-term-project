package com.example.demo.data;

import java.util.Set;
import java.util.TreeSet;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

//This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
//CRUD refers Create, Read, Update, Delete

public interface RoomRepository extends CrudRepository<Room, Integer> {
	@Query("select r from Room r where r.room_id in ?3 and r.hotel.hotel_id in "
			+ "(select h.hotel_id from Hotel h where (h.country=?1 or ?1=null) and (h.city=?2 or ?2=null)) order by r.hotel.country, r.hotel.city" )
	Iterable<Room> findRoomsOrderByHotel(String country, String city, Set<Integer> roomID);
	
	@Query("select r.room_id from Room r")
	TreeSet<Integer> findAllRoomID();
	
}
