package controller;

import org.springframework.stereotype.Controller;

import service.UserService;

@Controller
public class UserController {

	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	
}
























