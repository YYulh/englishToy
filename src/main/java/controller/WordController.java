package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;
import service.WordService;

@Controller
public class WordController {

	private WordService wordService;
	
	public WordController(WordService wordService) {
		this.wordService = wordService;
	}
	
	@RequestMapping("/word/insertForm")
	public String insertForm() {
		
		return ViewPath.WORD + "insertForm.jsp";
	}
	
	@RequestMapping("/game/gameForm")
	public String gameForm(HttpServletRequest request) {
	
		return ViewPath.GAME + "gameForm.jsp";
	}
	
	
	@RequestMapping("/game/gameUpdate")
	@ResponseBody
	public String gameUpdate(HttpServletRequest request) {
	
		
		
		return ViewPath.GAME + "gameForm.jsp";
	}
	
	
	
	@RequestMapping("/game/gameStart")
	public String gameStart(HttpServletRequest request) {
		String mode = request.getParameter("mode");
		
		request.setAttribute("mode", mode);
		return ViewPath.GAME+"gameStart.jsp";
	}
	
}
























