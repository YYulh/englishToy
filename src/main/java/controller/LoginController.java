package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.LoginService;

@Controller
public class LoginController {
	private LoginService loginService;
	
	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}
	
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public void loginCheck(@PathVariable("mode")String mode) {
		System.out.println("들어왔어");
		System.out.println(mode);
//		String mode = request.getParameter("mode");
//		
//		String name = request.getParameter("user_name");
//		String email = request.getParameter("user_email");
//		int id = Integer.parseInt(request.getParameter("user_id"));
		System.out.println(mode);
		System.out.println(name);
		System.out.println(email);
		System.out.println(id);
		
	}
}
