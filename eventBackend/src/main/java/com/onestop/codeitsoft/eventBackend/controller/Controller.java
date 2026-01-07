package com.onestop.codeitsoft.eventBackend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Controller {
	
	@GetMapping("/")
	public ModelAndView index() {
		return new ModelAndView("index");
	}

}
