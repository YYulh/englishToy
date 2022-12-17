package com.increpas.engToy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import common.ViewPath;

@Controller
public class HomeController {

	@RequestMapping(value = {"/","/engToy/"}, method = RequestMethod.GET)
	public String home() {


		return ViewPath.VIEW + "home.jsp";
	}
	
}
