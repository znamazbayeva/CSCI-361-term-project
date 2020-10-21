package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("title", "Main Page");
        return "home";
    }

    @RequestMapping(path="/search")
    	public String search(Model model) {
        	model.addAttribute("title", "Search Service");
    	    return "search";
    	}
  @RequestMapping("/bookingform")
  public String bookingformpage() {
      return "bookingform";
  }
  @RequestMapping("/bookingform/sucess")
  public String bookcomplete() {
      return "successbook";
  }

}
