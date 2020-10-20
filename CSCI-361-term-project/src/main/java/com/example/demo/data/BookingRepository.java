package com.example.demo.data;

import java.sql.Date;
import java.util.TreeSet;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface BookingRepository extends CrudRepository<Booking, Integer>{
	@Query("select r.room_id " + 
			"from Room r " + 
			"where r.room_id not in " + 
			"(" + 
			"  select b.room_id " + 
			"  from Booking b " + 
			"  where b.check_out_date > ?1" + 
			"  or b.check_in_date < ?2 " + 
			")")
	TreeSet<Integer> findAvailableRoomID(Date from, Date to);
}
