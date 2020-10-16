package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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

}
