package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;
import service.WordService;
import vo.WordVO;

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
	
	@RequestMapping("/game/gameSelect")
	@ResponseBody
	public String gameSelect(HttpServletRequest request) {
		
		 
		String ediction_word = wordService.selectOneE();
		
		System.out.println("ediction_word = "+ediction_word);
		
		return ediction_word;
		
	}
	
	@RequestMapping("/game/gameUpdate")
	@ResponseBody
	public String gameUpdate(HttpServletRequest request) {
		//user의 답변
		String kdiction_word = request.getParameter("kdiction_word");
		//사전의 답변
		String detect = "";
		// correct || wrong 
		//script쪽 arrayList에 저장, correct/총갯수*100으로 점수 표현
		String info = "";
		
		
		
		
		if(kdiction_word == detect ) {
			
			info = "correct";
			return info;
		}else {
			
			info = "wrong";
			return info;
		}
	}
	
	
	
	@RequestMapping("/game/gameStart")
	public String gameStart(HttpServletRequest request) {
		String mode = request.getParameter("mode");
		
		request.setAttribute("mode", mode);
		return ViewPath.GAME+"gameStart.jsp";
	}
	
}
























