package com.increpas.engToy;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import common.ViewPath;

@Controller
public class HomeController {

	@RequestMapping(value = {"/","/engToy"}, method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");

		boolean check = false;
		
		if(id == null){
			
			Cookie[] cks = request.getCookies();
			
			if(cks != null){
				for(Cookie ck : cks){
					if(ck.getName().equals("ckid")){
						id = ck.getValue();
						check = true;
						break;
					}
				}
			}
			
			if(id == null){
				id = "";
			}
		}
		
		model.addAttribute("check",check);
		model.addAttribute("id",id);

		return ViewPath.VIEW + "home.jsp";
	}
	
}
