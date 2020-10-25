package com.example.demo.data;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.data.Room.RoomId;

//This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
//CRUD refers Create, Read, Update, Delete

public interface RoomRepository extends CrudRepository<Room, Integer> {
	
	@Query("select r from Room r where r.available=1 and r.room_id.room_type_id.hotel_id in ?1 and "
			+ "(r.room_id.room_type_id.room_type_name in ?2 or ?2=null) "
			+ "order by r.room_type.hotel.country_name, r.room_type.hotel.city")
	Iterable<Room> findAvailableNowRooms(Set<Integer> h, String r);

	@Query("select r.room_type.room_type_id.room_type_name from Room r")
	TreeSet<String> findRoomTypes();
	
	@Query("select r.room_id from Room r where r.available=1 and r.room_id.room_type_id.hotel_id in ?1 and "
			+ "(r.room_id.room_type_id.room_type_name in ?2 or ?2=null) "
			+ "order by r.room_type.hotel.country_name, r.room_type.hotel.city")
	Iterable<RoomId> findRoomIdByRoomType(Set<Integer> h, String r);
}

