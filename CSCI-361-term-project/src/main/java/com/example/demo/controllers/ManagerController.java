package com.example.demo.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.data.Booking;
import com.example.demo.data.Employee;
import com.example.demo.data.EmployeeRepository;
import com.example.demo.data.HotelRepository;
import com.example.demo.data.Schedule;
import com.example.demo.data.ScheduleRepository;

@Controller
@RequestMapping(path="/manager")
public class ManagerController {
	
	  @Autowired
	  private EmployeeRepository employeeRepository;
	  
	  @Autowired
	  private HotelRepository hotelRepository;
	  
	  @Autowired
	  private ScheduleRepository scheduleRepository;
	  
	  @GetMapping("/search")
	  public String showAll(
			  @RequestParam(value = "id", required = false) Integer id,
		        @RequestParam(value = "name", required = false) String name,
		        @RequestParam(value = "surname", required = false) String surname,
		        @RequestParam(value = "type", required = false) String type,
		        @RequestParam(value = "hotel", required = false) String hotel,
		        Model model) {
		  model.addAttribute("hotel", hotelRepository.findNamesOnly());
		  model.addAttribute("type", employeeRepository.findTypesOnly());
	      model.addAttribute("employees", scheduleRepository.findEmployeeList(id, name, surname, type, hotel));
	      return "schedule";
	  }
	  
//	  @GetMapping("/update")
//	  public String showEditForm(Model model) {
//	      List<Employee> employees = new ArrayList<>();
//	      employeeRepository.findAll().iterator().forEachRemaining(employees::add);
//	   
//	      model.addAttribute("form", new EmployeeDTO(employees));
//	      return "scheduleupdate";
//	  }
	  
		@RequestMapping("/edit/{id}")
		public ModelAndView showEditBookingPage(@PathVariable(name = "id") int id) {
		    ModelAndView mav = new ModelAndView("scheduleupdate");
		    Optional<Schedule> employee = scheduleRepository.findById(id);
		    mav.addObject("employee", employee.get());
		     
		    return mav;
		}
	  
//	  @PostMapping("/save")
//	  public String saveBooks(@ModelAttribute EmployeeDTO form, Model model) {
//		  employeeRepository.saveAll(form.getEmployees());
//	   
//	      model.addAttribute("books", employeeRepository.findAll());
//	      return "redirect:/manager/all";
//	  }
		
		@RequestMapping("/save")
		public RedirectView saveProduct(@ModelAttribute("employee") Schedule employee) {
			Schedule e = scheduleRepository.findById(employee.getEmployee().getEmployee_id()).get();

				
				e.setFrom(employee.getFrom());
				e.setTo(employee.getTo());
				scheduleRepository.save(e);

//			bookingRepository.save(booking);
		    return new RedirectView("/manager/search");
		}

}
