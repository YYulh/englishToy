package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String insertForm(HttpSession session,HttpServletRequest request) {
		
//		Integer user_no = (Integer)request.getSession().getAttribute("user_no");

		int user_no =1; //로그인 구현 전 임시 유저번호
		
		List <WordVO> list = wordService.userWordList(user_no);
		
		request.setAttribute("list", list);
		
		return ViewPath.WORD + "insertForm.jsp";
	}
	
	@RequestMapping("/word/update")
	@ResponseBody
	public String update(HttpServletRequest request) {
		
		int word_no = Integer.parseInt(request.getParameter("word_no"));
		String word_memo = request.getParameter("word_memo");
		
		WordVO vo = new WordVO();
		
		vo.setWord_no(word_no);
		vo.setWord_memo(word_memo);
		
		int su = wordService.update(vo);
		
		if(su != 0) {
			String new_memo = wordService.getMemo(word_no);
			return new_memo;
			
		}else {		
			
			return "업데이트에 실패하였습니다.";
		}
		
	}
	@RequestMapping("/word/delete")
	@ResponseBody
	public String delete(HttpServletRequest request) {
			
		int word_no = Integer.parseInt(request.getParameter("word_no"));
		
		int su = wordService.delete(word_no);
			if(su!=0) {		
				return "성공";
			} else {
				return "실패";
			}
		}
	
	
	
}
























