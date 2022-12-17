package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
























