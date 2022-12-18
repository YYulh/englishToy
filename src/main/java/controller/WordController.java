package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;
import service.WordService;
import vo.AdminVO;
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
	@RequestMapping("/word/search")
	@ResponseBody
	public String search(HttpServletRequest request) {
		String word_name = request.getParameter("word_name");
		
		List<AdminVO> list = wordService.meaningList(word_name);
		if(list.size()<1) {
			return "검색된 결과가 없습니다.";
		}else {			
			String [] arr = new String[list.size()]; 
			for(int i = 0; i < list.size(); i++) {
				arr[i] = list.get(i).getkDiction_word();			
			}
			String result =  String.join(",",arr);
			
		return result;
		}
	}
	@RequestMapping("/word/insert")
	@ResponseBody
	public String insert(HttpServletRequest request) {
			
//		int user_no = (Integer)request.getSession().getAttribute("login");
		int user_no=1;
		String word_Ename = request.getParameter("searchWord");
		String word_Kname = request.getParameter("answerWord");
		String word_memo = request.getParameter("memo");
		if(word_memo ==null) {
			word_memo= " ";
		}
		
		WordVO vo = new WordVO();
		vo.setUser_no(user_no);
		vo.setWord_Ename(word_Ename);
		vo.setWord_Kname(word_Kname);
		vo.setWord_memo(word_memo);

		int su = wordService.insert(vo);
		
			if(su != 0) {		
				return "성공";
			} else {
				return "실패";
			}
		}
	@RequestMapping("/word/updateLike")
	public String updateLike(HttpServletRequest request) {
//		Integer user_no = (Integer)request.getSession().getAttribute("user_no");
		int user_no =1;
		int word_no = Integer.parseInt(request.getParameter("word_no"));
		int word_like = Integer.parseInt(request.getParameter("word_like"));
		
		System.out.println(word_like);
		WordVO vo = new WordVO();
		vo.setWord_no(word_no);
		vo.setUser_no(user_no);
		vo.setWord_like(word_like);
		
		int su = wordService.updateLike(vo);

		return "/word/insertForm";
	}
	
	
}
























