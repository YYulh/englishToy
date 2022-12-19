package controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.RedirectPath;
import common.ScriptUtil;
import common.ViewPath;
import service.LoginService;
import vo.UserVO;

@Controller
public class LoginController {
	private LoginService loginService;
	
	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}
	
	
	//로그인 체크 확인 
	@RequestMapping("/login/login")
	public void loginCheck(Model model, HttpServletRequest request,HttpServletResponse response) {
		String msg ="";
		String url = "";
		
		String id ="";
		String pw = "";
		String name ="";
		String email ="";
		
		Cookie[] cks = null;
	    Cookie sck = null;
	    
		UserVO vo = new UserVO();
		
		String mode = request.getParameter("mode");
		vo.setMode(mode);
		
		if(mode.equals("kakao")) { // 카카오 로그인
			name = request.getParameter("user_name");
			email = request.getParameter("user_email");
			id = request.getParameter("user_id");
			vo.setUser_email(email);
			vo.setUser_id(id);
			
		}else { //일반 로그인
			id = request.getParameter("id");
			pw = request.getParameter("pw");
			
			vo.setUser_id(id);
			vo.setUser_pw(pw);
		}
		
		Integer no = loginService.loginCheck(vo);
		
		if(no != null) {
			msg = "로그인 되었습니다. 환영합니다";
			url = RedirectPath.USER +"?check=true";
			
			request.getSession().setAttribute("login", no);
			String ckid = request.getParameter("ckid");
			
			cks = request.getCookies();
			
			for(Cookie c : cks) {
				if(c.getName().equals("ckid")) {
					sck = c;
					break;
				}
			}
			
			if(ckid != null) { //기억하기 체크
				if(sck == null) { // 쿠키가 없다면 생성
					sck = new Cookie("ckid", vo.getUser_id());
					sck.setMaxAge(60*60*24);
					sck.setPath("/");
					
					response.addCookie(sck);
				}else { // 쿠키가 있는데
					if(!sck.getValue().equals(vo.getUser_id())) { //쿠키에 저장된 값이 다르면
						sck.setValue(vo.getUser_id());
						response.addCookie(sck);
					}
				}
			}else { // 기억하기 체크 안됬을 때
				if(sck != null) {
					if(sck.getValue().equals(vo.getUser_id())) {
						sck.setMaxAge(0);
						sck.setPath("/");
						response.addCookie(sck);
					}
				}
			}
			
			
		}else { // 로그인이 안됬을 때 
			if(mode.equals("kakao")) {
				msg = "등록된 회원정보가 없습니다. 회원가입 페이지로 이동합니다.";
				url = RedirectPath.U_JOIN + "joinForm?user_name=" + name + "&user_email="+ email + "&user_id=" + id +"&mode=" + mode;
			}else {
				msg="일치하는 정보가 없습니다. 아이디나 비밀번호를 확인해주세요.";
				url = (String)request.getHeader("REFERER") +"?check=false";
			}
		}
		
		try {
			ScriptUtil.alertAndMovePage(response, msg, url);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/login/logout")
	public void logout( HttpServletRequest request,HttpServletResponse response) {
		request.getSession().invalidate(); // 세션 초기화 // 전체 삭제
		
		String msg = "로그아웃되었습니다.";
		String url = RedirectPath.USER ;
		
		try {
			ScriptUtil.alertAndMovePage(response, msg, url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
