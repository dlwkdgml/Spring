package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		String dest=(String) session.getAttribute("dest");
	      if(session.getAttribute("dest") !=null){   
	         session.removeAttribute("dest");
	         return"redirect:" + dest;
	      }
		
		return "home";
	}
	
}
