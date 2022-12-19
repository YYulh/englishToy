package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import common.RedirectPath;
import common.ScriptUtil;
import common.ViewPath;
import service.JoinService;
import service.LoginService;
import vo.UserVO;

@Controller
public class JoinController {
	private JoinService joinService;
	
	public JoinController(JoinService joinService) {
		this.joinService = joinService;
	}
	
	@RequestMapping(value = "/join/joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		String name ="";
		String email ="";
		String id ="";
		
		String mode = request.getParameter("mode");
		if (mode.equals("kakao")) {
			name = request.getParameter("user_name");
			email = request.getParameter("user_email");
			id = request.getParameter("user_id");
			
			model.addAttribute("name",name);
			model.addAttribute("email",email);
			model.addAttribute("id",id);
		}
		model.addAttribute("mode",mode);
		
		return ViewPath.JOIN +"form.jsp";
	}
	
	@RequestMapping("/join/join")
	public void join(UserVO vo, HttpServletRequest request,HttpServletResponse response) {
		
		String msg = null;
		String url = null;
		System.out.println(vo.getMode());
		int check = joinService.insert(vo);
		
		if(check != 0) {
			msg = vo.getUser_id()+ "님의 회원가입이 완료되었습니다." ;
			url =  "/engToy?id=" + vo.getUser_id(); 
		}else {
			msg = vo.getUser_id()+ "님의 회원가입이 실패됬습니다." ;
			url = (String)request.getHeader("REFERER");
			
		}
		try {
			ScriptUtil.alertAndMovePage(response, msg, url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// produces = "application/text;charset=utf-8" -> 반환되는 데이터가 text형태이고 utf8이다
	@RequestMapping(value="/join/checkid",produces = "application/text;charset=utf-8")
	@ResponseBody //데이터 자체를 클라이언트에게 전달하겠다
	public String checkid(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		if(joinService.checkid(id) != null) {
			return "이미 사용중인 ID입니다.";
		}else {
			return "사용 가능한 ID입니다.";
			
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
