package com.example.demo.data;

import java.util.TreeSet;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface EmployeeRepository extends CrudRepository<Employee, Integer> {

	@Query("select h.employee_type from Employee h" )
    TreeSet<String> findTypesOnly();
	
	@Query("select e from Employee e where (e.employee_id=?1 or ?1=null) "
			+ "and (e.name=?2 or ?2='' or ?2=null) "
	  		+ "and (e.second_name=?3 or ?3='' or ?3=null) " 
			+ "and (e.employee_type=?4 or ?4='' or ?4=null) "
			+ "and (e.hotel.name=?5 or ?5='') or ?5=null")
	 
    Iterable<Employee> findEmployeeList(Integer id, String name, String surname, String type, String hotel);
}
