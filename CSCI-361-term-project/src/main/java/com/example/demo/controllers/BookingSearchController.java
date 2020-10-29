package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.data.Booking;
import com.example.demo.data.BookingRepository;
import com.example.demo.data.Hotel;

@Controller // This means that this class is a Controller
@RequestMapping(path="/bookingsearch") // This means URL's start with /search (after Application path)
public class BookingSearchController {

	@Autowired
	private BookingRepository bookingRepository;
	
	@GetMapping(path="/all")
	public @ResponseBody Iterable<Booking> getAllUsers() {
		// This returns a JSON or XML with the users
		return bookingRepository.findAll();
	}
}
